
drop database ProductionManagement
go

	USE [master]
	GO

	CREATE DATABASE ProductionManagement
	GO

	USE ProductionManagement
	GO


	CREATE TABLE Role (
		RoleID INT NOT NULL PRIMARY KEY,
		Rolename NVARCHAR(20)
	)

	CREATE TABLE Users (
		UserID NVARCHAR(20) NOT NULL PRIMARY KEY,
		Name NVARCHAR(50),
		PhoneNumber NVARCHAR(20),
		Sex NVARCHAR(20),
		Adress NVARCHAR(50),
		BirthDate DATE,
		Email NVARCHAR(50),
		Username NVARCHAR(50) NOT NULL,
		Password NVARCHAR(MAX) NOT NULL,
		RoleID INT NOT NULL,
		UserStatus BIT,
		FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
		UNIQUE(Username)
	)

	CREATE TABLE Orderr (
		OrderID NVARCHAR(20) NOT NULL PRIMARY KEY,
		StartDate DATE,
		EndDate DATE,
		TotalPrice INT,
		Address NVARCHAR(50),
		StatusProgress NVARCHAR(20),
	)
	
	Create Table Worker (
	    WorkerID NVARCHAR(20) NOT NULL Primary Key,
		FullName  NVARCHAR(20),
		Yob Date,
		Address nvarchar(100),
		Phone varchar(20),
		Position nvarchar(30),

	)
		CREATE TABLE Cage (
		CageID NVARCHAR(20) NOT NULL PRIMARY KEY,
		Name NVARCHAR(50),
		Price INT,
		Origin NVARCHAR(20),
		Description NVARCHAR(MAX)
	)
		CREATE TABLE OrderDetail (
		OrderID NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		Quantity INT,
		OrderDetailStatus NVARCHAR(20),
		PRIMARY KEY (OrderID, CageID),
		FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID)
	)

		Create table DesignForProcess (
		Phrase NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		TimeProcess INT,
		Description NVARCHAR(MAX),
		NumberOfEmployee INT,
		NumCompletionCage INT,
		PRIMARY KEY (Phrase, CageID ),
		FOREIGN KEY (CageID) REFERENCES Cage(CageID)
	)

	CREATE TABLE Process (
		ProcessID NVARCHAR(20) NOT NULL ,
		ProcessName NVARCHAR(20) NOT NULL,
		OrderID NVARCHAR(20) NOT NULL,
		Phrase NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		CompletedQuantity INT,
		QuanityNeedProduct INT,
		Note NVARCHAR(MAX),
		Status NVARCHAR(20),
		StartDate Date,
		EndDate Date,
		NumberOfEmployee INT,
		PRIMARY KEY (OrderID, Phrase, CageID, ProcessID),
		FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY (Phrase,CageID) REFERENCES DesignForProcess(Phrase, CageID) 
	)

	CREATE TABLE UserOrder (
		UserID NVARCHAR(20) NOT NULL,
		OrderID NVARCHAR(20) NOT NULL,
		PRIMARY KEY (UserID, OrderID),
		FOREIGN KEY (UserID) REFERENCES Users(UserID),
		FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID)
	)


	CREATE TABLE Inventory (
		InventoryID NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		ImportDate DATE,
		Quantity INT,
		Unit NVARCHAR(20),
		Description NVARCHAR(MAX),
		PRIMARY KEY(InventoryID, CageID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID)
	)

	CREATE TABLE Material (
		MaterialID NVARCHAR(20) NOT NULL PRIMARY KEY,
		Name NVARCHAR(50),
		Origin NVARCHAR(20),
		Price INT,
		Quantity int,
		Unit NVARCHAR(20),
	)

	CREATE TABLE CageMaterial (
		CageID NVARCHAR(20) NOT NULL,
		MaterialID NVARCHAR(20) NOT NULL,
		Quantity INT,
		PRIMARY KEY(MaterialID, CageID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID),
		FOREIGN KEY(MaterialID) REFERENCES Material(MaterialID)
	)

-- Khong co insert gia tri cho bang process, tao tu dong
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Role (RoleID, Rolename) VALUES 
(1, 'Admin'), 
(2, 'Staff'),
(3, 'Manage'),
(4, 'Customer');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Users (UserID,Name,PhoneNumber,Sex,Adress,BirthDate,Email,Username,Password,RoleID,UserStatus) VALUES 
('AD001','Ho Doan Minh Khoa','0901246781','M','TP HCM','2003/10/14','minhkhoa123@gmail.com','Khoaadmin123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',1, 'True'),
('ST001','Bui The Tam','0903797979','M','Binh Duong','2003/7/15','thetam123@gmail.com','Tamstaff123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',2, 'True'),
('ST002','Le Minh Nhat','0901793905','M','TP HCM','2003/7/15','minhnhat123@gmail.com','Nhatstaff123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',2, 'True'),
('ST003','Lam Thanh Phong','0903456789','M','Bien Hoa','2000/9/20','thanhphong123@gmail.com','Phongstaff123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',2, 'True'),
('ST004','Tran Thanh Thi','0903325672','F','Thu Duc','1999/3/14','thanhthi123@gmail.com','Thistaff123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',2, 'True'),
('CS001','Nguyen Ba Tung','0903793908','M','Binh Duong','2003/7/15','batung123@gmail.com','Tungcustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True'),
('CS002','Nguyen Hoang Tri','0902628754','M','Binh Thanh','2003/09/15','hoangtri123@gmail.com', 'Tricustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True'),
('CS003','Duong Dinh Nguyen','0907298012','M','Go Vap','1980/05/20','dinhnguyen123@gmail.com', 'Nguyencustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True'),
('CS004','Tran Trong Hao','0901266577','M','Quan 1','1990/03/11','tronghao123@gmail.com', 'Haocustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True'),
('CS005','Lam Hong Ngoc','0901135984','F','Quan 4','1992/11/28','hongngoc123@gmail.com', 'Ngoccustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True'),
('CS006','Nguyen Thi Ngoc Anh','0901774208','F','Thu Duc','1991/2/28','ngocanh123@gmail.com','Anhcustomer123','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4, 'True');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Orderr (OrderID,StartDate,EndDate,TotalPrice,Address,StatusProgress) VALUES 
('OD001',CAST('2023/10/10'AS DATE),CAST('2023/12/12'AS DATE),0,'Binh Duong','new order'),
('OD002',CAST('2023/7/8'AS DATE),CAST('2023/8/9'AS DATE),0,'TP HCM','new order'),
('OD003',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),0,'Binh Duong','new order'),
('OD004',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),0,'Binh Duong','new order'),
('OD005',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),0,'TP HCM','new order'),
('OD006',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),0,'TP HCM','new order');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Cage (CageID, Name, Price,Origin,Description) VALUES 
('CG001','Long Tang Vuong',3000000,'Viet Nam','Long chim nho'),
('CG002','Long Avi',4500000,'Viet Nam','Long san vuon'),
('CG003','Long Luc',870000,'Viet Nam','Long chim chao mao'),
('CG004','Long Sing',3600000,'Trung Quoc','Long chim chao mao'),
('CG005','Long Bay Chim',980000,'Viet Nam','Long chim nho');
---------------------------------------------------------------------------------------------------------------------z
INSERT INTO UserOrder(UserID, OrderID) VALUES
('CS001', 'OD001'),
('CS002', 'OD002'),
('CS003', 'OD003'),
('CS004', 'OD004'),
('CS005', 'OD005'),
('CS006', 'OD006');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderDetail (OrderID, CageID, Quantity, OrderDetailStatus) VALUES
('OD001','CG001', 100, 'new order'),
('OD001','CG002', 50, 'new order'),
('OD001','CG003', 80, 'new order'),

('OD002','CG001', 90, 'new order'),
('OD002','CG002', 50, 'new order'),
('OD002','CG003', 50, 'new order'),
('OD002','CG004', 50, 'new order'),

('OD003','CG001', 60, 'new order'),
('OD003','CG002', 80, 'new order'),

('OD004','CG001', 100, 'new order'),

('OD005','CG001', 60, 'new order'),

('OD006','CG001', 70, 'new order');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Material (MaterialID,Name,Origin,Price,Quantity,Unit) VALUES 
('MT001','Nan tre','Viet Nam',20000,10000,'cai'),
('MT002','Nep de','Viet Nam',20000,10000,'Mieng'),
('MT003','Moc treo','Viet Nam',50000,10000,'cai'),
('MT004','Tru','Viet Nam',20000,10000,'cai'),
('MT005','Cua','Viet Nam',100000,10000,'cai'),
('MT006','De lot','Viet Nam',150000,10000,'Mieng'),
('MT007','Dinh','Viet Nam',10000,10000,'Cay');
---------------------------------------------------------------------------------------------------------------------
INSERT INTO DesignForProcess (Phrase,CageID,TimeProcess,Description,NumberOfEmployee,NumCompletionCage) VALUES 
('P001','CG001',1,'Lam De',5,1),
('P002','CG001',2,'Lam Tru Long',5,1),
('P003','CG001',2,'Dung Khung',5,1),
('P004','CG001',3,'Lam Chop Long',5,1),
('P005','CG001',1,'Hoan Thien',5,1),

('P001','CG002',1,'Lam De',5,1),
('P002','CG002',2,'Lam Tru Long',5,1),
('P003','CG002',2,'Dung Khung',5,1),
('P004','CG002',3,'Lam Chop Long',5,1),
('P005','CG002',1,'Hoan Thien',5,1),

('P001','CG003',1,'Lam De',5,1),
('P002','CG003',2,'Lam Tru Long',5,1),
('P003','CG003',2,'Dung Khung',5,1),
('P004','CG003',3,'Lam Chop Long',5,1),
('P005','CG003',1,'Hoan Thien',5,1),

('P001','CG004',1,'Lam De',5,1),
('P002','CG004',2,'Lam Tru Long',5,1),
('P003','CG004',2,'Dung Khung',5,1),
('P004','CG004',3,'Lam Chop Long',5,1),
('P005','CG004',1,'Hoan Thien',5,1),

('P001','CG005',1,'Lam De',5,1),
('P002','CG005',2,'Lam Tru Long',5,1),
('P003','CG005',2,'Dung Khung',5,1),
('P004','CG005',3,'Lam Chop Long',5,1),
('P005','CG005',1,'Hoan Thien',5,1);
---------------------------------------------------------------------------------------------------------------------
INSERT INTO CageMaterial (CageID, MaterialID, Quantity) VALUES
('CG001', 'MT001', 40),
('CG001', 'MT002', 40),
('CG001', 'MT004', 10),
('CG001', 'MT005', 1),
('CG001', 'MT006', 1),
('CG001', 'MT007', 80),

('CG002', 'MT001', 40),
('CG002', 'MT002', 50),
('CG002', 'MT004', 20),
('CG002', 'MT005', 1),
('CG002', 'MT006', 5),
('CG002', 'MT007', 100),

('CG003', 'MT001', 30),
('CG003', 'MT002', 30),
('CG003', 'MT004', 5),
('CG003', 'MT005', 1),
('CG003', 'MT006', 1),
('CG003', 'MT007', 50),

('CG004', 'MT001', 30),
('CG004', 'MT002', 30),
('CG004', 'MT004', 5),
('CG004', 'MT005', 1),
('CG004', 'MT006', 1),
('CG004', 'MT007', 70),

('CG005', 'MT001', 30),
('CG005', 'MT002', 30),
('CG005', 'MT004', 5),
('CG005', 'MT005', 1),
('CG005', 'MT006', 1),
('CG005', 'MT007', 50);
-------------------------------------------
GO
CREATE FUNCTION [dbo].[GetNextMaterialID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(MaterialID, 3) AS INT)), 0) FROM Material) + 1
DECLARE @MaterialID NVARCHAR(10)
SET @MaterialID = 'MT' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @MaterialID
END
GO
CREATE FUNCTION [dbo].[GetNextAdminID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'AD' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextAdminIDWithRoleID](@RoleID INT)
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users WHERE RoleID = @RoleID) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'AD' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextCustomerID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'CS' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextCustomerIDWithRoleID](@RoleID INT)
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users WHERE RoleID = @RoleID) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'CS' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextManagerID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'MG' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextManagerIDWithRoleID](@RoleID INT)
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users WHERE RoleID = @RoleID) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'MN' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO

CREATE FUNCTION [dbo].[GetNextOrderID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(OrderID, 3) AS INT)), 0) FROM Orderr) + 1
DECLARE @orderID NVARCHAR(10)
SET @orderID = 'OD' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @orderID
END
GO
CREATE FUNCTION [dbo].[GetNextPharseID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(Phrase, 3) AS INT)), 0) FROM DesignForProcess) + 1
DECLARE @Phrase NVARCHAR(10)
SET @Phrase = 'P' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @Phrase
END
GO
CREATE FUNCTION [dbo].[GetNextStaffID]()
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'ST' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO
CREATE FUNCTION [dbo].[GetNextStaffIDWithRoleID](@RoleID INT)
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @count INT = (SELECT ISNULL(MAX(CAST(RIGHT(UserID, 3) AS INT)), 0) FROM Users WHERE RoleID = @RoleID) + 1
DECLARE @UserID NVARCHAR(10)
SET @UserID = 'ST' + RIGHT('00' + CAST(@count AS NVARCHAR(3)), 3)
RETURN @UserID
END
GO