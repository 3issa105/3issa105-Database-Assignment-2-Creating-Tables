USE master;
GO

IF DB_ID(N'BidNile') IS NOT NULL
BEGIN
    ALTER DATABASE BidNile SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BidNile;
END
GO

CREATE DATABASE BidNile;
GO

USE BidNile;
GO

-- Task 2: Schemas

CREATE SCHEMA Accounts;
GO

CREATE SCHEMA Logistics;
GO

CREATE SCHEMA Catalogue;
GO

CREATE SCHEMA Sales;
GO

-- Task 2: Tables (FK constraints added in 3.1)

CREATE TABLE Logistics.City (
    CityId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(60) NOT NULL,
    CountryCode CHAR(2) NOT NULL
        CONSTRAINT CK_City_CountryCode CHECK (CountryCode IN ('EG', 'SA', 'AE')),
    CONSTRAINT PK_City PRIMARY KEY (CityId),
    CONSTRAINT UQ_City_CountryCode_Name UNIQUE (CountryCode, Name)
);
GO

CREATE TABLE Accounts.Member (
    MemberId UNIQUEIDENTIFIER NOT NULL
        CONSTRAINT DF_Member_MemberId DEFAULT (NEWID()),
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(254) NOT NULL
        CONSTRAINT UQ_Member_Email UNIQUE,
    Mobile VARCHAR(16) NOT NULL
        CONSTRAINT CK_Member_Mobile CHECK (Mobile LIKE '+[0-9]%' AND SUBSTRING(Mobile, 2, 15) NOT LIKE '%[^0-9]%'),
    NationalId VARCHAR(20) NOT NULL
        CONSTRAINT UQ_Member_NationalId UNIQUE
        CONSTRAINT CK_Member_NationalId CHECK (LEN(NationalId) > 0 AND NationalId NOT LIKE '%[^A-Za-z0-9]%'),
    BirthDate DATE NOT NULL
        CONSTRAINT CK_Member_BirthDate CHECK (BirthDate <= DATEADD(YEAR, -18, CAST(GETDATE() AS DATE))),
    IsVerified BIT NOT NULL
        CONSTRAINT DF_Member_IsVerified DEFAULT (0),
    RegisteredAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Member_RegisteredAt DEFAULT (SYSDATETIME()),
    CityId INT NOT NULL,
    InvitedByMemberId UNIQUEIDENTIFIER NULL,
    CONSTRAINT PK_Member PRIMARY KEY (MemberId),
    CONSTRAINT CK_Member_InvitedByMemberId CHECK (InvitedByMemberId IS NULL OR InvitedByMemberId <> MemberId)
);
GO

CREATE TABLE Accounts.Wallet (
    MemberId UNIQUEIDENTIFIER NOT NULL,
    Balance DECIMAL(12, 2) NOT NULL
        CONSTRAINT DF_Wallet_Balance DEFAULT (0.00)
        CONSTRAINT CK_Wallet_Balance CHECK (Balance >= 0),
    HeldAmount DECIMAL(12, 2) NOT NULL
        CONSTRAINT DF_Wallet_HeldAmount DEFAULT (0.00)
        CONSTRAINT CK_Wallet_HeldAmount CHECK (HeldAmount >= 0),
    Currency CHAR(3) NOT NULL
        CONSTRAINT DF_Wallet_Currency DEFAULT ('EGP')
        CONSTRAINT CK_Wallet_Currency CHECK (Currency LIKE '[A-Z][A-Z][A-Z]'),
    UpdatedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Wallet_UpdatedAt DEFAULT (SYSDATETIME()),
    CONSTRAINT PK_Wallet PRIMARY KEY (MemberId),
    CONSTRAINT CK_Wallet_HeldAmount_Balance CHECK (HeldAmount <= Balance)
);
GO

CREATE TABLE Logistics.Warehouse (
    WarehouseId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(80) NOT NULL
        CONSTRAINT UQ_Warehouse_Name UNIQUE,
    Capacity INT NOT NULL
        CONSTRAINT CK_Warehouse_Capacity CHECK (Capacity > 0),
    CityId INT NOT NULL,
    Latitude FLOAT NOT NULL
        CONSTRAINT CK_Warehouse_Latitude CHECK (Latitude BETWEEN -90 AND 90),
    Longitude FLOAT NOT NULL
        CONSTRAINT CK_Warehouse_Longitude CHECK (Longitude BETWEEN -180 AND 180),
    ManagerId UNIQUEIDENTIFIER NULL
        CONSTRAINT UQ_Warehouse_ManagerId UNIQUE,
    ManagerStartDate DATE NULL,
    CONSTRAINT PK_Warehouse PRIMARY KEY (WarehouseId),
    CONSTRAINT CK_Warehouse_Manager CHECK (
        (ManagerId IS NULL AND ManagerStartDate IS NULL)
        OR (ManagerId IS NOT NULL AND ManagerStartDate IS NOT NULL)
    )
);
GO

CREATE TABLE Logistics.Employee (
    MemberId UNIQUEIDENTIFIER NOT NULL,
    WarehouseId INT NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY (MemberId)
);
GO

CREATE TABLE Catalogue.Category (
    CategoryId INT NOT NULL,
    ParentCategoryId INT NULL,
    NameEn VARCHAR(50) NOT NULL
        CONSTRAINT UQ_Category_NameEn UNIQUE,
    NameAr NVARCHAR(50) NULL,
    CommissionPct DECIMAL(4, 2) NOT NULL
        CONSTRAINT CK_Category_CommissionPct CHECK (CommissionPct BETWEEN 0 AND 30),
    CONSTRAINT PK_Category PRIMARY KEY (CategoryId),
    CONSTRAINT CK_Category_ParentCategoryId CHECK (ParentCategoryId IS NULL OR ParentCategoryId <> CategoryId)
);
GO

CREATE TABLE Catalogue.Item (
    ItemId INT IDENTITY(1,1) NOT NULL,
    Title NVARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ConditionScore TINYINT NOT NULL
        CONSTRAINT CK_Item_ConditionScore CHECK (ConditionScore BETWEEN 1 AND 10),
    Specifications NVARCHAR(MAX) NOT NULL
        CONSTRAINT CK_Item_Specifications CHECK (ISJSON(Specifications) = 1),
    SellerId UNIQUEIDENTIFIER NOT NULL,
    CategoryId INT NOT NULL,
    WarehouseId INT NULL,
    InspectorId UNIQUEIDENTIFIER NULL,
    ListedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Item_ListedAt DEFAULT (SYSDATETIME()),
    CONSTRAINT PK_Item PRIMARY KEY (ItemId),
    CONSTRAINT CK_Item_SellerId_InspectorId CHECK (InspectorId IS NULL OR SellerId <> InspectorId)
);
GO

CREATE TABLE Catalogue.ItemPhoto (
    ItemId INT NOT NULL,
    Position TINYINT NOT NULL
        CONSTRAINT CK_ItemPhoto_Position CHECK (Position BETWEEN 1 AND 20),
    PhotoUrl VARCHAR(500) NOT NULL,
    IsMain BIT NOT NULL
        CONSTRAINT DF_ItemPhoto_IsMain DEFAULT (0),
    CONSTRAINT PK_ItemPhoto PRIMARY KEY (ItemId, Position)
);
GO

CREATE TABLE Sales.Auction (
    AuctionId INT IDENTITY(1,1) NOT NULL,
    ItemId INT NOT NULL,
    StartingPrice DECIMAL(12, 2) NOT NULL
        CONSTRAINT CK_Auction_StartingPrice CHECK (StartingPrice > 0),
    ReservePrice DECIMAL(12, 2) NULL,
    BidIncrement DECIMAL(12, 2) NOT NULL
        CONSTRAINT DF_Auction_BidIncrement DEFAULT (50.00)
        CONSTRAINT CK_Auction_BidIncrement CHECK (BidIncrement > 0),
    StartTime DATETIMEOFFSET NOT NULL,
    EndTime DATETIMEOFFSET NOT NULL,
    Status VARCHAR(20) NOT NULL
        CONSTRAINT DF_Auction_Status DEFAULT ('Draft')
        CONSTRAINT CK_Auction_Status CHECK (Status IN ('Draft', 'Live', 'Ended', 'Cancelled')),
    CONSTRAINT PK_Auction PRIMARY KEY (AuctionId),
    CONSTRAINT CK_Auction_ReservePrice CHECK (ReservePrice IS NULL OR ReservePrice >= StartingPrice),
    CONSTRAINT CK_Auction_EndTime CHECK (EndTime > StartTime)
);
GO

CREATE TABLE Sales.Bid (
    BidId BIGINT IDENTITY(1,1) NOT NULL,
    AuctionId INT NOT NULL,
    MemberId UNIQUEIDENTIFIER NOT NULL,
    Amount DECIMAL(12, 2) NOT NULL
        CONSTRAINT CK_Bid_Amount CHECK (Amount > 0),
    PlacedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Bid_PlacedAt DEFAULT (SYSDATETIME()),
    IpAddress VARCHAR(45) NOT NULL,
    CONSTRAINT PK_Bid PRIMARY KEY (BidId),
    CONSTRAINT UQ_Bid_AuctionId_Amount UNIQUE (AuctionId, Amount)
);
GO

CREATE TABLE Sales.AuctionFollower (
    MemberId UNIQUEIDENTIFIER NOT NULL,
    AuctionId INT NOT NULL,
    FollowedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_AuctionFollower_FollowedAt DEFAULT (SYSDATETIME()),
    CONSTRAINT PK_AuctionFollower PRIMARY KEY (MemberId, AuctionId)
);
GO
