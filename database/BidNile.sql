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

-- Task 3: Business changes

-- 3.1
ALTER TABLE Accounts.Member
ADD CONSTRAINT FK_Member_City FOREIGN KEY (CityId) REFERENCES Logistics.City (CityId),
    CONSTRAINT FK_Member_Member FOREIGN KEY (InvitedByMemberId) REFERENCES Accounts.Member (MemberId);
GO

-- 3.1
ALTER TABLE Accounts.Wallet
ADD CONSTRAINT FK_Wallet_Member FOREIGN KEY (MemberId) REFERENCES Accounts.Member (MemberId);
GO

-- 3.1
ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT FK_Warehouse_City FOREIGN KEY (CityId) REFERENCES Logistics.City (CityId),
    CONSTRAINT FK_Warehouse_Employee FOREIGN KEY (ManagerId) REFERENCES Logistics.Employee (MemberId);
GO

-- 3.1
ALTER TABLE Logistics.Employee
ADD CONSTRAINT FK_Employee_Member FOREIGN KEY (MemberId) REFERENCES Accounts.Member (MemberId),
    CONSTRAINT FK_Employee_Warehouse FOREIGN KEY (WarehouseId) REFERENCES Logistics.Warehouse (WarehouseId);
GO

-- 3.1
ALTER TABLE Catalogue.Category
ADD CONSTRAINT FK_Category_Category FOREIGN KEY (ParentCategoryId) REFERENCES Catalogue.Category (CategoryId);
GO

-- 3.1
ALTER TABLE Catalogue.Item
ADD CONSTRAINT FK_Item_Member FOREIGN KEY (SellerId) REFERENCES Accounts.Member (MemberId),
    CONSTRAINT FK_Item_Category FOREIGN KEY (CategoryId) REFERENCES Catalogue.Category (CategoryId),
    CONSTRAINT FK_Item_Warehouse FOREIGN KEY (WarehouseId) REFERENCES Logistics.Warehouse (WarehouseId),
    CONSTRAINT FK_Item_Employee FOREIGN KEY (InspectorId) REFERENCES Logistics.Employee (MemberId);
GO

-- 3.1
ALTER TABLE Catalogue.ItemPhoto
ADD CONSTRAINT FK_ItemPhoto_Item FOREIGN KEY (ItemId) REFERENCES Catalogue.Item (ItemId) ON DELETE CASCADE;
GO

-- 3.1
ALTER TABLE Sales.Auction
ADD CONSTRAINT FK_Auction_Item FOREIGN KEY (ItemId) REFERENCES Catalogue.Item (ItemId);
GO

-- 3.1
ALTER TABLE Sales.Bid
ADD CONSTRAINT FK_Bid_Auction FOREIGN KEY (AuctionId) REFERENCES Sales.Auction (AuctionId),
    CONSTRAINT FK_Bid_Member FOREIGN KEY (MemberId) REFERENCES Accounts.Member (MemberId);
GO

-- 3.1
ALTER TABLE Sales.AuctionFollower
ADD CONSTRAINT FK_AuctionFollower_Member FOREIGN KEY (MemberId) REFERENCES Accounts.Member (MemberId),
    CONSTRAINT FK_AuctionFollower_Auction FOREIGN KEY (AuctionId) REFERENCES Sales.Auction (AuctionId);
GO

-- 3.2
ALTER TABLE Accounts.Member
ADD AppLanguage CHAR(2) NOT NULL
    CONSTRAINT DF_Member_AppLanguage DEFAULT ('ar')
    CONSTRAINT CK_Member_AppLanguage CHECK (AppLanguage IN ('ar', 'en'));
GO

-- 3.3
ALTER TABLE Catalogue.Item
ADD IsFeatured BIT NOT NULL
    CONSTRAINT DF_Item_IsFeatured DEFAULT (0);
GO

-- 3.4
EXEC sp_rename N'Sales.Bid.IpAddress', N'DeviceIp', N'COLUMN';
GO

-- 3.4
ALTER TABLE Logistics.Warehouse
DROP CONSTRAINT CK_Warehouse_Capacity;
GO

-- 3.4
EXEC sp_rename N'Logistics.Warehouse.Capacity', N'MaxItems', N'COLUMN';
GO

-- 3.4
ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT CK_Warehouse_MaxItems CHECK (MaxItems > 0);
GO

-- 3.5
ALTER TABLE Accounts.Member
ALTER COLUMN FullName NVARCHAR(150) NOT NULL;
GO

-- 3.6
ALTER TABLE Logistics.Warehouse
DROP CONSTRAINT CK_Warehouse_MaxItems;
GO

-- 3.6
ALTER TABLE Logistics.Warehouse
ALTER COLUMN MaxItems SMALLINT NOT NULL;
GO

-- 3.6
ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT CK_Warehouse_MaxItems CHECK (MaxItems > 0);
GO

-- 3.7
ALTER TABLE Catalogue.Category
DROP CONSTRAINT CK_Category_CommissionPct;
GO

-- 3.7
ALTER TABLE Catalogue.Category
ADD CONSTRAINT CK_Category_CommissionPct CHECK (CommissionPct BETWEEN 0 AND 25);
GO

-- 3.8
ALTER TABLE Sales.Auction
DROP CONSTRAINT CK_Auction_Status;
GO

-- 3.8
ALTER TABLE Sales.Auction
DROP CONSTRAINT DF_Auction_Status;
GO

-- 3.8
ALTER TABLE Sales.Auction
ADD CONSTRAINT CK_Auction_Status CHECK (Status IN ('PendingReview', 'Draft', 'Live', 'Ended', 'Cancelled'));
GO

-- 3.8
ALTER TABLE Sales.Auction
ADD CONSTRAINT DF_Auction_Status DEFAULT ('PendingReview') FOR Status;
GO

-- 3.9
ALTER TABLE Sales.Auction
ADD BuyNowPrice DECIMAL(12, 2) NULL;
GO

-- 3.9
-- Using WITH CHECK so SQL Server validates existing rows and trusts the constraint for query optimization.
ALTER TABLE Sales.Auction WITH CHECK
ADD CONSTRAINT CK_Auction_BuyNowPrice CHECK (BuyNowPrice IS NULL OR BuyNowPrice > StartingPrice);
GO

-- 3.10
ALTER TABLE Accounts.Member
ADD CONSTRAINT UQ_Member_Mobile UNIQUE (Mobile);
GO

-- 3.11
ALTER TABLE Accounts.Member
ADD VerifiedAt DATETIME2(3) NULL;
GO

-- 3.11
ALTER TABLE Accounts.Member
DROP CONSTRAINT DF_Member_IsVerified;
GO

-- 3.11
ALTER TABLE Accounts.Member
DROP COLUMN IsVerified;
GO

-- 3.12
CREATE SCHEMA Marketing;
GO

-- 3.12
ALTER SCHEMA Marketing TRANSFER Sales.AuctionFollower;
GO
