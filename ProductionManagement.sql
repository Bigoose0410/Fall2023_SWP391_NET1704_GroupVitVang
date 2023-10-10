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
		OrderID NVARCHAR(20) NOT NULL PRIMARY KEY,
		StartDate DATE,
		EndDate DATE,
		TotalPrice INT,
		Address NVARCHAR(50),
		StatusProcess NVARCHAR(20),
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
		CageName NVARCHAR(50),
		Price INT,
		Origin NVARCHAR(20),
		Description NVARCHAR(MAX)
	)
		CREATE TABLE OrderDetail (
		OrderID NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		Quantity INT,
		PRIMARY KEY (OrderID, CageID),
		FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID)
	)

		Create table DesignForProcess (
		Phrase NVARCHAR(20) NOT NULL PRIMARY KEY,
		CageID NVARCHAR(20) NOT NULL,
		TimeProcess INT,
		Description NVARCHAR(MAX),
		NumberOfEmployee INT,
		CompletionCage INT,
		FOREIGN KEY (CageID) REFERENCES Cage(CageID)
	)

	CREATE TABLE Process (
		ProcessID NVARCHAR(20) NOT NULL PRIMARY KEY,
		ProcessName NVARCHAR(20) NOT NULL,
		OrderID NVARCHAR(20),
		Phrase NVARCHAR(20),
		CageID NVARCHAR(20),
		Status NVARCHAR(20),
		StartDate Date,
		EndDate Date,
		NumberOfEmployee INT,
		FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY (Phrase) REFERENCES DesignForProcess(Phrase),
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
		Inventory INT,
		Unit NVARCHAR(20)
	)

	CREATE TABLE DetailOrder (
		OrderID NVARCHAR(20) NOT NULL,
		CageID NVARCHAR(20) NOT NULL,
		Quantity INT,
		StatusProcess NVARCHAR(20),
		FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
		FOREIGN KEY(CageID) REFERENCES Cage(CageID)
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