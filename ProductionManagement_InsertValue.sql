INSERT INTO Role VALUES
(1, 'Staff'),
(2, 'Manager'),
(3, 'Admin'),
(4, 'Customer');
-------------------------------------------------------------
INSERT INTO Users (UserID,Name,PhoneNumber,Sex,Adress,BirthDate,Email,Username,Password,RoleID) VALUES 
('AC003','nguyen van a',987456321,'M','Hue','2001/01/04','abc@gmail.com','CS003',123456 ,4),
('AC004','Trien Chieu',741258963,'F','Quang ninh','2000/09/15','xyz@gmail.com', 'CS004',123456,4),
('AC001','thetam',123456789,'M','binh duong','2023/10/14','thetam@gmail.com','AC001',123456,1),
('AC002','batung',9876544321,'F','ho chi minh','2002/7/15','batung@gmail.com','AC002',123456,2);
-------------------------------------------------------------
INSERT INTO Orderr (OrderID,StartDate,EndDate,TotalPrice,Address,StatusProgress) VALUES 
('OD001',CAST('2023/10/10'AS DATE),CAST('2023/12/12'AS DATE),0,'Binh Duong','new order'),
('OD002',CAST('2023/7/8'AS DATE),CAST('2023/8/9'AS DATE),0,'HCM','Processing'),
('OD003',CAST('2023/9/10'AS DATE),CAST('2023/12/25'AS DATE),2,'Binh Duong','new order');
--------------------------------------------------------------
INSERT INTO Material (MaterialID,Name,Origin,Price,Quantity,Unit) VALUES 
('MT001','Nan tre','VN',100,500,'cai'),
('MT002','Nep De','VN',100,500,'Mieng'),
('MT003','Moc treo','VN',100,500,'cai'),
('MT004','Tru','VN',100,500,'cai'),
('MT005','Cua','VN',100,500,'cai'),
('MT006','De lot','VN',100,500,'Mieng'),
('MT007','Dinh','VN',100,500,'Cay');
