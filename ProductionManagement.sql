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

	INSERT INTO Role (RoleID, Rolename) VALUES 
	(1, 'Admin'), 
	(2, 'Staff'),
	(3, 'Manage'),
	(4, 'Customer');


	INSERT INTO Users (UserID,Name,PhoneNumber,Sex,Adress,BirthDate,Email,Username,Password,RoleID) VALUES 
('CS003','nguyen van a',987456321,'M','Hue','2001/01/04','abc@gmail.com','AC003','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu' ,4),
('CS004','Trien Chieu',741258963,'F','Quang ninh','2000/09/15','xyz@gmail.com', 'AC004','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',4),
('AC001','thetam',123456789,'M','binh duong','2023/10/14','thetam@gmail.com','AC001','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',1),
('AC002','batung',9876544321,'F','ho chi minh','2002/7/15','batung@gmail.com','AC002','000b5u00071u0006au000c8u000a6u0009eu000e5u000b8u0003au0000fu00001u00034u00093u00059u000c3u0004cu',2);

INSERT INTO Orderr (OrderID,StartDate,EndDate,TotalPrice,Address,StatusProgress) VALUES 
('OD001',CAST('2023/10/10'AS DATE),CAST('2023/12/12'AS DATE),0,'Binh Duong','new order'),
('OD002',CAST('2023/7/8'AS DATE),CAST('2023/8/9'AS DATE),0,'HCM','Processing'),
('OD003',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),2,'Binh Duong','new order');

INSERT INTO Cage (CageID, Name, Price,Origin,Description) VALUES 
('CG001','Long Tang Vuong',1000,'VN','Long chim nho'),
('CG002','Long navi',2000,'VN','Long San vuon'),
('CG003','Long de ban',1500,'VN','Long son ca');

INSERT INTO OrderDetail (OrderID, CageID, Quantity, OrderDetailStatus) VALUES
('OD001', 'CG001', 20, 'new order'),
('OD001', 'CG002', 5, 'new order'),
('OD001', 'CG003', 15, 'new order'),
('OD002', 'CG001', 3, 'new order'),
('OD002', 'CG002', 4, 'new order');

INSERT INTO Material (MaterialID,Name,Origin,Price,Quantity,Unit) VALUES 
('MT001','Nan tre','VN',100,500,'cai'),
('MT002','Nep De','VN',100,500,'Mieng'),
('MT003','Moc treo','VN',100,500,'cai'),
('MT004','Tru','VN',100,500,'cai'),
('MT005','Cua','VN',100,500,'cai'),
('MT006','De lot','VN',100,500,'Mieng'),
('MT007','Dinh','VN',100,500,'Cay');

INSERT INTO DesignForProcess (Phrase,CageID,TimeProcess,Description,NumberOfEmployee,NumCompletionCage) VALUES 
('P001','CG001',1,'Lam De',1,1),
('P002','CG001',2,'Lam Tru Long',1,1),
('P003','CG001',2,'Dung khung',2,1),
('P004','CG001',3,'Lam Chop Long',2,1),
('P005','CG001',1,'Hoan Thien',3,1);



INSERT INTO Process (ProcessID,ProcessName,OrderID,Phrase,CageID,CompletedQuantity,Note,Status,StartDate,EndDate,NumberOfEmployee) VALUES 
('PR001','tao hinh','OD001','P001','CG001',0, NULL,'not yet',CAST('2023/10/14'AS DATE),CAST('2023/10/17'AS DATE),3),
('PR002','Lam Nan','OD001','P002','CG001',0, NULL,'not yet',CAST('2023/10/18'AS DATE),CAST('2023/10/23'AS DATE),3),
('PR003','tao hinh','OD001','P003','CG001',0, NULL,'not yet',CAST('2023/10/24'AS DATE),CAST('2023/10/30'AS DATE),4),
('PR004','Lap Rap','OD001','P004','CG001',0, NULL,'not yet',CAST('2023/11/01'AS DATE),CAST('2023/11/03'AS DATE),3);

INSERT INTO CageMaterial (CageID, MaterialID, Quantity) VALUES
('CG001', 'MT001', 20),
('CG001', 'MT002', 4),
('CG001', 'MT003', 1),
('CG001', 'MT004', 6),
('CG001', 'MT005', 1),
('CG002', 'MT001', 10),
('CG002', 'MT003', 1),
('CG002', 'MT005', 1),
('CG002', 'MT006', 1),
('CG002', 'MT002', 10);

INSERT INTO UserOrder(UserID, OrderID) VALUES
('CS003', 'OD001'),
('CS004', 'OD002'),
('AC001', 'OD003');
