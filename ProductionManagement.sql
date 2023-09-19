﻿USE [master]
GO

CREATE DATABASE [ProductionManagement]
GO

USE [ProductionManagement]
GO

CREATE TABLE Staff (
	StaffID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	PhoneNumber NVARCHAR(20),
	Sex NVARCHAR(20),
	Email NVARCHAR(50), 
	Adress NVARCHAR(50),
	BirthDate DATE,
	Username NVARCHAR(50),
	Password NVARCHAR(50)
)

CREATE TABLE Customer (
	CustomerID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	PhoneNumber NVARCHAR(20),
	Adress NVARCHAR(50),
	Email NVARCHAR(50)
)

CREATE TABLE Orderr (
	OrderrID NVARCHAR(20) NOT NULL PRIMARY KEY,
	StartDate DATE,
	EndDate DATE,
	Quantity INT,
	Price INT,
	Delivery NVARCHAR(20),
	Address NVARCHAR(50),
	StatusProcess NVARCHAR(20),
	StaffID NVARCHAR(20),
	CustomerID NVARCHAR(20),
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE Inventory (
	InventoryID NVARCHAR(20) NOT NULL PRIMARY KEY,
	ImportDate DATE,
	Quantity INT,
	Unit INT,
	Description NVARCHAR(MAX)
)

CREATE TABLE Cage (
	CageID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	Price INT,
	Origin NVARCHAR(20),
	Description NVARCHAR(MAX),
	InventoryID NVARCHAR(20),
	FOREIGN KEY(InventoryID) REFERENCES Inventory(InventoryID)
)

CREATE TABLE CageOrderr (
	OrderrID NVARCHAR(20) NOT NULL,
	CageID NVARCHAR(20) NOT NULL,
	PRIMARY KEY(OrderrID, CageID),
	FOREIGN KEY(OrderrID) REFERENCES Orderr(OrderrID),
	FOREIGN KEY(CageID) REFERENCES Cage(CageID)
)

CREATE TABLE Material (
	MaterialID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	Origin NVARCHAR(20),
	Price INT,
	Quantity INT,
	Unit INT
)

CREATE TABLE CageMaterial (
	CageID NVARCHAR(20) NOT NULL,
	MaterialID NVARCHAR(20) NOT NULL
	PRIMARY KEY(CageID, MaterialID),
	FOREIGN KEY(CageID) REFERENCES Cage(CageID),
	FOREIGN KEY(MaterialID) REFERENCES Material(MaterialID)
)

CREATE TABLE Admin (
	AdminID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	Email NVARCHAR(50),
	Username NVARCHAR(50),
	Password NVARCHAR(50)
)

CREATE TABLE Manager (
	ManagerID NVARCHAR(20) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50),
	PhoneNumber NVARCHAR(20),
	Address NVARCHAR(50),
	Email NVARCHAR(50),
	Username NVARCHAR(50),
	Password NVARCHAR(50)
)
