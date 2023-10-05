﻿USE [master]
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
	TotalPrice INT,
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

CREATE TABLE Process (
	ProcessID NVARCHAR(20) NOT NULL PRIMARY KEY,
	ProcessName NVARCHAR(20) NOT NULL,
	Description NVARCHAR(MAX),
	Rate float
)

CREATE TABLE CageProcess (
	CageID NVARCHAR(20) NOT NULL,
	ProcessID NVARCHAR(20) NOT NULL,
	PRIMARY KEY (CageID, ProcessID),
	FOREIGN KEY(CageID) REFERENCES Cage(CageID),
	FOREIGN KEY(ProcessID) REFERENCES Process(ProcessID)
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

CREATE TABLE CageOrder (
	OrderID NVARCHAR(20) NOT NULL,
	CageID NVARCHAR(20) NOT NULL,
	ImportDate DATE,
	CompletionDate DATE,
	Quantity INT,
	StatusProcess NVARCHAR(20),
	PRIMARY KEY(OrderID, CageID),
	FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
	FOREIGN KEY(CageID) REFERENCES Cage(CageID)
)

CREATE TABLE Material (
	MaterialID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	Origin NVARCHAR(20),
	Price INT,
	Quantity INT,
	Unit NVARCHAR(20)
)

CREATE TABLE CageMaterial (
	CageID NVARCHAR(20) NOT NULL,
	MaterialID NVARCHAR(20) NOT NULL,
	Quantity INT,
	PRIMARY KEY(CageID, MaterialID),
	FOREIGN KEY(CageID) REFERENCES Cage(CageID),
	FOREIGN KEY(MaterialID) REFERENCES Material(MaterialID)
)
