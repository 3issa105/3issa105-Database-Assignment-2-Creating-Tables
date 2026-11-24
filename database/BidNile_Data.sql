USE [BidNile]
GO
SET IDENTITY_INSERT [Logistics].[City] ON
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (6, N'Dubai', N'AE')
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (2, N'Alexandria', N'EG')
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (1, N'Cairo', N'EG')
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (3, N'Giza', N'EG')
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (5, N'Jeddah', N'SA')
GO
INSERT [Logistics].[City] ([CityId], [Name], [CountryCode]) VALUES (4, N'Riyadh', N'SA')
GO
SET IDENTITY_INSERT [Logistics].[City] OFF
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (100, NULL, N'Vehicles', N'مركبات', CAST(7.50 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (110, 100, N'Cars', N'سيارات', CAST(5.00 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (120, 100, N'Motorcycles', N'دراجات نارية', CAST(6.50 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (200, NULL, N'Electronics', N'إلكترونيات', CAST(10.00 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (210, 200, N'Mobiles', N'هواتف محمولة', CAST(8.00 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (220, 200, N'Laptops', N'أجهزة لابتوب', CAST(7.00 AS Decimal(4, 2)))
GO
INSERT [Catalogue].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [CommissionPct]) VALUES (300, NULL, N'Antiques', N'تحف ومقتنيات', CAST(15.00 AS Decimal(4, 2)))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000001', N'أحمد محمد عيسى', N'ahmed.eissa@bidnile.eg', N'+201001112233', N'29904150101234', CAST(N'1999-04-15' AS Date), CAST(N'2026-01-10T10:15:22.1200000' AS DateTime2), 1, NULL, N'ar', CAST(N'2026-01-10T11:05:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000002', N'Karim Tarek Hassan', N'karim.hassan@bidnile.eg', N'+201112223344', N'29508210104567', CAST(N'1995-08-21' AS Date), CAST(N'2026-01-12T14:20:10.4500000' AS DateTime2), 1, NULL, N'en', CAST(N'2026-01-12T16:00:12.3000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000003', N'Nourhan Adel Mansour', N'nourhan.mansour@bidnile.eg', N'+201223334455', N'29711030207891', CAST(N'1997-11-03' AS Date), CAST(N'2026-01-15T09:45:05.8100000' AS DateTime2), 2, NULL, N'en', CAST(N'2026-01-15T10:12:40.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000004', N'فهد عبدالله القحطاني', N'fahad.qahtani@bidnile.sa', N'+966501234567', N'1084523910', CAST(N'1993-03-19' AS Date), CAST(N'2026-01-20T17:30:44.2050000' AS DateTime2), 4, NULL, N'ar', CAST(N'2026-01-21T08:20:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000005', N'Rashid Saeed Al Maktoum', N'rashid.maktoum@bidnile.ae', N'+971509876543', N'784199412345678', CAST(N'1994-06-27' AS Date), CAST(N'2026-02-01T12:05:19.9900000' AS DateTime2), 6, NULL, N'en', CAST(N'2026-02-01T15:40:10.1200000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000006', N'يوسف إبراهيم الشناوي', N'youssef.shenawy@bidnile.eg', N'+201554445566', N'29602142103321', CAST(N'1996-02-14' AS Date), CAST(N'2026-02-05T19:10:02.6000000' AS DateTime2), 3, NULL, N'ar', CAST(N'2026-02-06T09:00:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000007', N'Salma Mahmoud El-Gamal', N'salma.gamal@bidnile.eg', N'+201095556677', N'30005180109988', CAST(N'2000-05-18' AS Date), CAST(N'2026-02-14T11:25:33.4100000' AS DateTime2), 1, N'a1000000-0000-0000-0000-000000000001', N'en', CAST(N'2026-02-14T13:10:05.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000008', N'مصطفى خالد عبد الرحمن', N'mostafa.khaled@bidnile.eg', N'+201026667788', N'29809090205544', CAST(N'1998-09-09' AS Date), CAST(N'2026-02-18T16:42:51.0750000' AS DateTime2), 2, N'a1000000-0000-0000-0000-000000000001', N'ar', NULL)
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000009', N'Sultan Nasser Al Harbi', N'sultan.harbi@bidnile.sa', N'+966559988776', N'1097634218', CAST(N'1991-12-08' AS Date), CAST(N'2026-03-02T20:14:09.3300000' AS DateTime2), 5, N'a1000000-0000-0000-0000-000000000004', N'ar', CAST(N'2026-03-03T10:00:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000010', N'Hessa Hamad Al Falasi', N'hessa.falasi@bidnile.ae', N'+971524455667', N'784199976543210', CAST(N'1999-07-22' AS Date), CAST(N'2026-03-10T08:50:17.5000000' AS DateTime2), 6, N'a1000000-0000-0000-0000-000000000005', N'en', CAST(N'2026-03-10T11:15:30.2500000' AS DateTime2))
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000011', N'عمر حسام الدين فؤاد', N'omar.fouad@bidnile.eg', N'+201147778899', N'29401302106677', CAST(N'1994-01-30' AS Date), CAST(N'2026-03-15T13:33:28.1400000' AS DateTime2), 3, N'a1000000-0000-0000-0000-000000000002', N'ar', NULL)
GO
INSERT [Accounts].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a1000000-0000-0000-0000-000000000012', N'Laila Sherif Abdelaziz', N'laila.abdelaziz@bidnile.eg', N'+201288889900', N'30103120104411', CAST(N'2001-03-12' AS Date), CAST(N'2026-03-20T15:18:45.9000000' AS DateTime2), 1, N'a1000000-0000-0000-0000-000000000007', N'en', CAST(N'2026-03-21T09:30:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000001', CAST(450000.00 AS Decimal(12, 2)), CAST(35000.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-20T10:00:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000002', CAST(180000.00 AS Decimal(12, 2)), CAST(15000.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-20T11:15:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000003', CAST(95000.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-18T09:30:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000004', CAST(120000.00 AS Decimal(12, 2)), CAST(12000.00 AS Decimal(12, 2)), N'SAR', CAST(N'2026-11-21T14:20:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000005', CAST(250000.00 AS Decimal(12, 2)), CAST(40000.00 AS Decimal(12, 2)), N'AED', CAST(N'2026-11-22T16:45:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000006', CAST(65000.00 AS Decimal(12, 2)), CAST(5000.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-19T13:10:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000007', CAST(140000.00 AS Decimal(12, 2)), CAST(22000.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-23T18:05:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000008', CAST(30000.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-15T12:00:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000009', CAST(85000.00 AS Decimal(12, 2)), CAST(8000.00 AS Decimal(12, 2)), N'SAR', CAST(N'2026-11-22T20:30:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000010', CAST(195000.00 AS Decimal(12, 2)), CAST(18000.00 AS Decimal(12, 2)), N'AED', CAST(N'2026-11-23T11:40:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000011', CAST(52000.00 AS Decimal(12, 2)), CAST(4500.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-21T17:25:00.0000000' AS DateTime2))
GO
INSERT [Accounts].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [UpdatedAt]) VALUES (N'a1000000-0000-0000-0000-000000000012', CAST(310000.00 AS Decimal(12, 2)), CAST(42000.00 AS Decimal(12, 2)), N'EGP', CAST(N'2026-11-24T09:50:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [Logistics].[Warehouse] ON
GO
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerId], [ManagerStartDate]) VALUES (1, N'Cairo Nasr City Hub', 15000, 1, 30.0561124, 31.3301842, N'a1000000-0000-0000-0000-000000000002', CAST(N'2024-06-01' AS Date))
GO
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerId], [ManagerStartDate]) VALUES (2, N'Alexandria Smouha Hub', 8000, 2, 31.2134901, 29.9412854, N'a1000000-0000-0000-0000-000000000003', CAST(N'2024-09-15' AS Date))
GO
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerId], [ManagerStartDate]) VALUES (3, N'Giza 6th October Hub', 12000, 3, 29.9723415, 30.9421087, N'a1000000-0000-0000-0000-000000000011', CAST(N'2025-01-10' AS Date))
GO
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerId], [ManagerStartDate]) VALUES (4, N'Riyadh Olaya Hub', 10000, 4, 24.7135517, 46.6752957, N'a1000000-0000-0000-0000-000000000004', CAST(N'2025-03-01' AS Date))
GO
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerId], [ManagerStartDate]) VALUES (5, N'Dubai Al Quoz Hub', 9500, 6, 25.1381924, 55.2264518, N'a1000000-0000-0000-0000-000000000005', CAST(N'2025-05-20' AS Date))
GO
SET IDENTITY_INSERT [Logistics].[Warehouse] OFF
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000002', 1)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000003', 2)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000004', 4)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000005', 5)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000006', 1)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000009', 4)
GO
INSERT [Logistics].[Employee] ([MemberId], [WarehouseId]) VALUES (N'a1000000-0000-0000-0000-000000000011', 3)
GO
SET IDENTITY_INSERT [Catalogue].[Item] ON
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (1, N'Toyota Corolla 2021 GLI', N'First owner, agency maintenance history.', 9, N'{"brand":"Toyota","model":"Corolla","year":2021,"mileageKm":62000,"transmission":"Automatic"}', N'a1000000-0000-0000-0000-000000000001', 110, 1, N'a1000000-0000-0000-0000-000000000002', CAST(N'2026-11-01T10:00:00.0000000' AS DateTime2), 1)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (2, N'iPhone 15 Pro Max 256GB', N'Box and original cable included, battery health 94%.', 9, N'{"brand":"Apple","model":"iPhone 15 Pro Max","storage":"256GB","colour":"Natural Titanium","batteryPct":94}', N'a1000000-0000-0000-0000-000000000007', 210, 1, N'a1000000-0000-0000-0000-000000000006', CAST(N'2026-11-03T14:30:00.0000000' AS DateTime2), 1)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (3, N'Hyundai Tucson 2022 Turbo', N'Full panoramic roof, minor bumper repaint.', 8, N'{"brand":"Hyundai","model":"Tucson","year":2022,"mileageKm":41500,"fuel":"Petrol"}', N'a1000000-0000-0000-0000-000000000008', 110, 2, N'a1000000-0000-0000-0000-000000000003', CAST(N'2026-11-05T11:20:00.0000000' AS DateTime2), 0)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (4, N'MacBook Pro 14 M3 Pro', N'Clean chassis, 42 battery cycles.', 10, N'{"brand":"Apple","cpu":"M3 Pro","ramGb":18,"ssdGb":512,"screenInch":14.2}', N'a1000000-0000-0000-0000-000000000012', 220, 3, N'a1000000-0000-0000-0000-000000000011', CAST(N'2026-11-08T16:45:00.0000000' AS DateTime2), 1)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (5, N'Samsung Galaxy S24 Ultra 512GB', N'UAE version with S-Pen and box.', 9, N'{"brand":"Samsung","model":"Galaxy S24 Ultra","storage":"512GB","colour":"Titanium Black"}', N'a1000000-0000-0000-0000-000000000010', 210, 5, N'a1000000-0000-0000-0000-000000000005', CAST(N'2026-11-10T12:15:00.0000000' AS DateTime2), 0)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (6, N'1940s Brass Astrolabe Replica', N'Hand-engraved brass collector piece in velvet case.', 8, N'{"era":"1940s","origin":"Egypt","material":"Solid Brass","diameterCm":18}', N'a1000000-0000-0000-0000-000000000001', 300, 1, N'a1000000-0000-0000-0000-000000000006', CAST(N'2026-11-12T09:40:00.0000000' AS DateTime2), 0)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (7, N'Yamaha MT-07 2021', N'Low mileage sport motorcycle, service done.', 8, N'{"brand":"Yamaha","model":"MT-07","year":2021,"engineCc":689,"mileageKm":14200}', N'a1000000-0000-0000-0000-000000000009', 120, 4, N'a1000000-0000-0000-0000-000000000004', CAST(N'2026-11-14T15:10:00.0000000' AS DateTime2), 1)
GO
INSERT [Catalogue].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerId], [CategoryId], [WarehouseId], [InspectorId], [ListedAt], [IsFeatured]) VALUES (8, N'Dell XPS 15 9530 OLED', NULL, 7, N'{"brand":"Dell","cpu":"Core i7-13700H","ramGb":32,"ssdGb":1024,"gpu":"RTX 4060"}', N'a1000000-0000-0000-0000-000000000007', 220, NULL, NULL, CAST(N'2026-11-24T11:00:00.0000000' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [Catalogue].[Item] OFF
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (1, 1, N'https://cdn.bidnile.com/items/1/front.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (1, 2, N'https://cdn.bidnile.com/items/1/interior.jpg', 0)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (1, 3, N'https://cdn.bidnile.com/items/1/odometer.jpg', 0)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (2, 1, N'https://cdn.bidnile.com/items/2/main.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (2, 2, N'https://cdn.bidnile.com/items/2/back.jpg', 0)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (3, 1, N'https://cdn.bidnile.com/items/3/exterior.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (3, 2, N'https://cdn.bidnile.com/items/3/cabin.jpg', 0)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (4, 1, N'https://cdn.bidnile.com/items/4/open.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (5, 1, N'https://cdn.bidnile.com/items/5/front.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (6, 1, N'https://cdn.bidnile.com/items/6/astrolabe.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (7, 1, N'https://cdn.bidnile.com/items/7/side.jpg', 1)
GO
INSERT [Catalogue].[ItemPhoto] ([ItemId], [Position], [PhotoUrl], [IsMain]) VALUES (8, 1, N'https://cdn.bidnile.com/items/8/laptop.jpg', 1)
GO
SET IDENTITY_INSERT [Sales].[Auction] ON
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (1, 1, CAST(650000.00 AS Decimal(12, 2)), CAST(720000.00 AS Decimal(12, 2)), CAST(5000.00 AS Decimal(12, 2)), CAST(N'2026-11-20T12:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-11-30T22:00:00.0000000+02:00' AS DateTimeOffset), N'Live', CAST(820000.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (2, 2, CAST(32000.00 AS Decimal(12, 2)), CAST(36000.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(12, 2)), CAST(N'2026-11-21T15:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-11-28T21:00:00.0000000+02:00' AS DateTimeOffset), N'Live', CAST(44000.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (3, 3, CAST(880000.00 AS Decimal(12, 2)), CAST(950000.00 AS Decimal(12, 2)), CAST(5000.00 AS Decimal(12, 2)), CAST(N'2026-11-08T10:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-11-15T20:00:00.0000000+02:00' AS DateTimeOffset), N'Ended', NULL)
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (4, 4, CAST(55000.00 AS Decimal(12, 2)), NULL, CAST(1000.00 AS Decimal(12, 2)), CAST(N'2026-11-10T14:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-11-18T22:00:00.0000000+02:00' AS DateTimeOffset), N'Ended', CAST(72000.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (5, 5, CAST(3100.00 AS Decimal(12, 2)), CAST(3500.00 AS Decimal(12, 2)), CAST(100.00 AS Decimal(12, 2)), CAST(N'2026-11-22T18:00:00.0000000+04:00' AS DateTimeOffset), CAST(N'2026-12-01T23:00:00.0000000+04:00' AS DateTimeOffset), N'Live', CAST(4200.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (6, 6, CAST(4500.00 AS Decimal(12, 2)), NULL, CAST(250.00 AS Decimal(12, 2)), CAST(N'2026-12-02T16:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-12-07T21:00:00.0000000+02:00' AS DateTimeOffset), N'Draft', CAST(7500.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (7, 7, CAST(22000.00 AS Decimal(12, 2)), CAST(26000.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(12, 2)), CAST(N'2026-12-03T19:00:00.0000000+03:00' AS DateTimeOffset), CAST(N'2026-12-10T22:00:00.0000000+03:00' AS DateTimeOffset), N'PendingReview', CAST(31000.00 AS Decimal(12, 2)))
GO
INSERT [Sales].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (8, 6, CAST(4000.00 AS Decimal(12, 2)), CAST(5000.00 AS Decimal(12, 2)), CAST(200.00 AS Decimal(12, 2)), CAST(N'2026-11-14T12:00:00.0000000+02:00' AS DateTimeOffset), CAST(N'2026-11-17T18:00:00.0000000+02:00' AS DateTimeOffset), N'Cancelled', NULL)
GO
SET IDENTITY_INSERT [Sales].[Auction] OFF
GO
SET IDENTITY_INSERT [Sales].[Bid] ON
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (1, 1, N'a1000000-0000-0000-0000-000000000002', CAST(655000.00 AS Decimal(12, 2)), CAST(N'2026-11-20T12:15:10.1200000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (2, 1, N'a1000000-0000-0000-0000-000000000007', CAST(660000.00 AS Decimal(12, 2)), CAST(N'2026-11-20T13:02:44.5000000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (3, 1, N'a1000000-0000-0000-0000-000000000012', CAST(665000.00 AS Decimal(12, 2)), CAST(N'2026-11-20T15:40:11.0150000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (4, 1, N'a1000000-0000-0000-0000-000000000002', CAST(670000.00 AS Decimal(12, 2)), CAST(N'2026-11-21T09:11:05.3300000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (5, 1, N'a1000000-0000-0000-0000-000000000006', CAST(675000.00 AS Decimal(12, 2)), CAST(N'2026-11-21T11:50:29.8800000' AS DateTime2), N'41.44.102.77')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (6, 1, N'a1000000-0000-0000-0000-000000000011', CAST(680000.00 AS Decimal(12, 2)), CAST(N'2026-11-21T18:22:14.2100000' AS DateTime2), N'197.38.19.205')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (7, 1, N'a1000000-0000-0000-0000-000000000007', CAST(685000.00 AS Decimal(12, 2)), CAST(N'2026-11-22T10:05:51.6400000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (8, 1, N'a1000000-0000-0000-0000-000000000012', CAST(690000.00 AS Decimal(12, 2)), CAST(N'2026-11-22T14:30:08.9000000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (9, 1, N'a1000000-0000-0000-0000-000000000003', CAST(695000.00 AS Decimal(12, 2)), CAST(N'2026-11-23T08:45:19.1050000' AS DateTime2), N'197.163.44.12')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (10, 1, N'a1000000-0000-0000-0000-000000000002', CAST(700000.00 AS Decimal(12, 2)), CAST(N'2026-11-23T19:12:37.4500000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (11, 1, N'a1000000-0000-0000-0000-000000000012', CAST(710000.00 AS Decimal(12, 2)), CAST(N'2026-11-24T10:20:03.7200000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (12, 1, N'a1000000-0000-0000-0000-000000000007', CAST(725000.00 AS Decimal(12, 2)), CAST(N'2026-11-24T14:55:42.1900000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (13, 2, N'a1000000-0000-0000-0000-000000000001', CAST(32500.00 AS Decimal(12, 2)), CAST(N'2026-11-21T15:10:00.1100000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (14, 2, N'a1000000-0000-0000-0000-000000000003', CAST(33000.00 AS Decimal(12, 2)), CAST(N'2026-11-21T16:05:22.3400000' AS DateTime2), N'197.163.44.12')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (15, 2, N'a1000000-0000-0000-0000-000000000012', CAST(33500.00 AS Decimal(12, 2)), CAST(N'2026-11-21T18:40:15.7000000' AS DateTime2), N'2a00:1450:4001:81f::200e')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (16, 2, N'a1000000-0000-0000-0000-000000000001', CAST(34000.00 AS Decimal(12, 2)), CAST(N'2026-11-22T09:12:04.2200000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (17, 2, N'a1000000-0000-0000-0000-000000000006', CAST(34500.00 AS Decimal(12, 2)), CAST(N'2026-11-22T12:30:49.8100000' AS DateTime2), N'41.44.102.77')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (18, 2, N'a1000000-0000-0000-0000-000000000011', CAST(35000.00 AS Decimal(12, 2)), CAST(N'2026-11-22T17:19:33.5000000' AS DateTime2), N'197.38.19.205')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (19, 2, N'a1000000-0000-0000-0000-000000000001', CAST(35500.00 AS Decimal(12, 2)), CAST(N'2026-11-23T11:02:18.9400000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (20, 2, N'a1000000-0000-0000-0000-000000000003', CAST(36000.00 AS Decimal(12, 2)), CAST(N'2026-11-23T15:44:27.6200000' AS DateTime2), N'197.163.44.12')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (21, 2, N'a1000000-0000-0000-0000-000000000012', CAST(36500.00 AS Decimal(12, 2)), CAST(N'2026-11-24T09:10:11.0800000' AS DateTime2), N'2a00:1450:4001:81f::200e')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (22, 2, N'a1000000-0000-0000-0000-000000000001', CAST(37000.00 AS Decimal(12, 2)), CAST(N'2026-11-24T13:25:55.4300000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (23, 3, N'a1000000-0000-0000-0000-000000000001', CAST(885000.00 AS Decimal(12, 2)), CAST(N'2026-11-08T11:00:12.3000000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (24, 3, N'a1000000-0000-0000-0000-000000000002', CAST(890000.00 AS Decimal(12, 2)), CAST(N'2026-11-09T14:20:45.1000000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (25, 3, N'a1000000-0000-0000-0000-000000000007', CAST(900000.00 AS Decimal(12, 2)), CAST(N'2026-11-10T10:15:30.4000000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (26, 3, N'a1000000-0000-0000-0000-000000000012', CAST(910000.00 AS Decimal(12, 2)), CAST(N'2026-11-11T19:05:11.2500000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (27, 3, N'a1000000-0000-0000-0000-000000000001', CAST(920000.00 AS Decimal(12, 2)), CAST(N'2026-11-12T16:40:02.6000000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (28, 3, N'a1000000-0000-0000-0000-000000000002', CAST(930000.00 AS Decimal(12, 2)), CAST(N'2026-11-13T21:18:54.8200000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (29, 3, N'a1000000-0000-0000-0000-000000000012', CAST(940000.00 AS Decimal(12, 2)), CAST(N'2026-11-14T13:50:29.1700000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (30, 3, N'a1000000-0000-0000-0000-000000000001', CAST(955000.00 AS Decimal(12, 2)), CAST(N'2026-11-15T18:10:07.9100000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (31, 3, N'a1000000-0000-0000-0000-000000000012', CAST(965000.00 AS Decimal(12, 2)), CAST(N'2026-11-15T19:52:41.5500000' AS DateTime2), N'2001:0db8:85a3:0000:0000:8a2e:0370:7334')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (32, 4, N'a1000000-0000-0000-0000-000000000001', CAST(56000.00 AS Decimal(12, 2)), CAST(N'2026-11-10T15:30:10.0000000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (33, 4, N'a1000000-0000-0000-0000-000000000006', CAST(57000.00 AS Decimal(12, 2)), CAST(N'2026-11-11T12:12:12.1200000' AS DateTime2), N'41.44.102.77')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (34, 4, N'a1000000-0000-0000-0000-000000000007', CAST(58000.00 AS Decimal(12, 2)), CAST(N'2026-11-12T18:45:00.3400000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (35, 4, N'a1000000-0000-0000-0000-000000000002', CAST(59500.00 AS Decimal(12, 2)), CAST(N'2026-11-14T20:10:33.7600000' AS DateTime2), N'197.55.12.84')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (36, 4, N'a1000000-0000-0000-0000-000000000001', CAST(61000.00 AS Decimal(12, 2)), CAST(N'2026-11-16T11:05:49.9000000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (37, 4, N'a1000000-0000-0000-0000-000000000007', CAST(62500.00 AS Decimal(12, 2)), CAST(N'2026-11-17T21:30:15.2000000' AS DateTime2), N'156.204.88.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (38, 4, N'a1000000-0000-0000-0000-000000000001', CAST(64000.00 AS Decimal(12, 2)), CAST(N'2026-11-18T21:48:09.6100000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (39, 5, N'a1000000-0000-0000-0000-000000000004', CAST(3200.00 AS Decimal(12, 2)), CAST(N'2026-11-22T19:00:05.1100000' AS DateTime2), N'185.70.44.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (40, 5, N'a1000000-0000-0000-0000-000000000005', CAST(3300.00 AS Decimal(12, 2)), CAST(N'2026-11-22T20:15:40.2900000' AS DateTime2), N'94.200.118.42')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (41, 5, N'a1000000-0000-0000-0000-000000000009', CAST(3400.00 AS Decimal(12, 2)), CAST(N'2026-11-23T10:22:18.5400000' AS DateTime2), N'212.138.113.10')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (42, 5, N'a1000000-0000-0000-0000-000000000004', CAST(3500.00 AS Decimal(12, 2)), CAST(N'2026-11-23T14:40:09.8300000' AS DateTime2), N'185.70.44.19')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (43, 5, N'a1000000-0000-0000-0000-000000000005', CAST(3600.00 AS Decimal(12, 2)), CAST(N'2026-11-23T22:05:31.1200000' AS DateTime2), N'94.200.118.42')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (44, 5, N'a1000000-0000-0000-0000-000000000001', CAST(3700.00 AS Decimal(12, 2)), CAST(N'2026-11-24T08:30:44.6700000' AS DateTime2), N'41.234.18.90')
GO
INSERT [Sales].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (45, 5, N'a1000000-0000-0000-0000-000000000005', CAST(3850.00 AS Decimal(12, 2)), CAST(N'2026-11-24T16:12:50.9000000' AS DateTime2), N'94.200.118.42')
GO
SET IDENTITY_INSERT [Sales].[Bid] OFF
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000001', 2, CAST(N'2026-11-21T15:05:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000002', 1, CAST(N'2026-11-20T12:10:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000003', 1, CAST(N'2026-11-20T14:00:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000004', 5, CAST(N'2026-11-22T18:45:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000007', 1, CAST(N'2026-11-20T12:55:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000007', 6, CAST(N'2026-11-24T11:20:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000008', 2, CAST(N'2026-11-22T10:15:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000009', 5, CAST(N'2026-11-23T09:50:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000012', 1, CAST(N'2026-11-20T15:30:00.0000000' AS DateTime2))
GO
INSERT [Marketing].[AuctionFollower] ([MemberId], [AuctionId], [FollowedAt]) VALUES (N'a1000000-0000-0000-0000-000000000012', 2, CAST(N'2026-11-21T18:30:00.0000000' AS DateTime2))
GO
