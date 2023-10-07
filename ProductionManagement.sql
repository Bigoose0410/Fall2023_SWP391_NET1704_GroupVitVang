	USE [master]
	GO

	CREATE DATABASE [ProductionManagement]
	GO

	USE [ProductionManagement]
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
		Password NVARCHAR(20) NOT NULL,
		RoleID INT NOT NULL,
		FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
		UNIQUE(Username)
	)

	CREATE TABLE Orderr (
		OrderID NVARCHAR(20) NOT NULL,
		CustomerID NVARCHAR(20) NOT NULL,
		TotalPrice INT,
		StartDate Datetime,
		StatusProcess NVARCHAR(20),
		Primary key (OrderID),
		FOREIGN KEY (CustomerID) REFERENCES Users(UserID)

	)
	
	Create Table Worker (
	    WorkerID NVARCHAR(20) NOT NULL Primary Key,
		FullName  NVARCHAR(20),
		Yob Date,
		Address nvarchar(100),
		Phone varchar(20),
		Position nvarchar(30),

	)

	CREATE TABLE Process (
		ProcessID NVARCHAR(20) NOT NULL,
		ProcessName NVARCHAR(20) NOT NULL,
		PRIMARY KEY (ProcessID)
	)

	Create table DetailProcess (
		DetailPID NVARCHAR(20) NOT NULL PRIMARY KEY,
		ProcessID NVARCHAR(20) NOT NULL,
		WorkerID NVARCHAR(20) NOT NULL,
		OrderID NVARCHAR(20) NOT NULL,
		Description NVARCHAR(MAX),
		DateTimeStart datetime,
		DateTimeEnd Datetime,
		Quantity int,
		Status NVARCHAR(20) NOT NULL,
		FOREIGN KEY (ProcessID) REFERENCES Process(ProcessID),
		FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY (WorkerID) REFERENCES Worker(WorkerID)
		
	)

	CREATE TABLE UserOrder (
		UserID NVARCHAR(20) NOT NULL,
		OrderID NVARCHAR(20) NOT NULL,
		PRIMARY KEY (UserID, OrderID),
		FOREIGN KEY (UserID) REFERENCES Users(UserID),
		FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID)
	)

	CREATE TABLE Cage (
		CageID NVARCHAR(20) NOT NULL PRIMARY KEY,
		CageName NVARCHAR(50),
		Price INT
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

	CREATE TABLE DetailOrder (
		OrderID NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		Quantity INT,
		StatusProcess NVARCHAR(20),
		FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID)
	)

	CREATE TABLE Material (
		MaterialID NVARCHAR(20) NOT NULL PRIMARY KEY,
		Name NVARCHAR(50),
		Inventory INT,
		Unit NVARCHAR(20)
	)

	CREATE TABLE CageMaterial (
		CageID NVARCHAR(20) NOT NULL,
		MaterialID NVARCHAR(20) NOT NULL,
		Quantity INT,
		Name NVARCHAR(20),
		Origin NVARCHAR(20),
		Price int,
		Unit NVARCHAR(20),
		PRIMARY KEY(MaterialID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID),
		FOREIGN KEY(MaterialID) REFERENCES Material(MaterialID)
	)

	Create table HistoryProduction (
		HistoryPID NVARCHAR(20) NOT NULL PRIMARY KEY,
		OrderID NVARCHAR(20) NOT NULL,
		DetailPID NVARCHAR(20) NOT NULL,
		DateTimeStart datetime,
		DateTimeEnd Datetime,
		FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY(DetailPID) REFERENCES DetailProcess(DetailPID)
	)
