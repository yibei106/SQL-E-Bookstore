create database APU_E_Bookstore;

use APU_E_Bookstore;


-- Table of Publishers (with details of publishers)
create table Publishers(
Publisher_ID nvarchar(50),
Company_Name nvarchar(50) NOT NULL,
Company_ContactNo nvarchar(50) NOT NULL,
primary key (Publisher_ID)
);

Insert into Publishers
values
('PB1054', 'Kenchara Media & Publications', '03-48515486'),
('PB1055', 'Basis Publications', '03-01554896'),
('PB1057', 'Kanyin Publications', '03-69945345'),
('PB1058', 'Future Ace Publishing Sdn Bhd', '03-51428795'),
('PB1059', 'Bluedate Group of Companies', '03-05612158')

SELECT * FROM Publishers;

-- Table of Book (with details of books)
create table Book(
Book_ID nvarchar(50),
ISBN_No bigint not null,
Book_Name nvarchar(100) not null,
Author nvarchar(50),
Subject_Category nvarchar(50),
Publication_Year integer,
Price decimal(10, 2) not null,
Publisher_ID nvarchar(50) not null,
primary key (Book_ID),
foreign key (Publisher_ID) references Publishers(Publisher_ID)
);

insert into Book
values
('BK1056', '9783319730042', 'Introduction to Deep Learning', 'Sandro Skansi', 'Artificial Intelligence', '2018', '120', 'PB1054'),
('BK1057', '9381159319316', 'Introduction to Database Management System', 'Satinder Bal Gupta', 'Databases', '2017', '84', 'PB1058'),
('BK1058', '9780321563842', 'The C++ Programming Language', 'Bjarne Stroustrup', 'Programming', '2013', '111', 'PB1057'),
('BK1059', '9781305494602', 'Systems Analysis and Design', 'Scott Tilley', 'Programming', '2016', '99', 'PB1059'),
('BK1060', '9781473751040', 'Foundation of Computer Science', 'Behrouz Forouzan', 'Computers', '2018', '73', 'PB1055'),
('BK1061', '9782815394372', 'Introduction to Python Programming', 'Gowrishankar S', 'Programming', '2019', '87', 'PB1054'), 
('BK1062', '9780134686998', 'Introduction to Mathematical Statistics', 'Robert V. Hogg', 'Mathematcial Statistics', '2019', '119', 'PB1057')

SELECT * FROM Book;

-- Table of Publisher Book List (records which book published by which publisher)
create table Publisher_Book_List(
ISBN_No bigint,
Book_Name nvarchar(100) not null,
Author nvarchar(50),
Subject_Category nvarchar(50),
Publication_Year date,
Price decimal(10, 2) not null,
Publisher_ID nvarchar(50) not null,
Published_Date date not null,
primary key (ISBN_No),
foreign key (Publisher_ID) references Publishers(Publisher_ID)
);

insert into Publisher_Book_List
values
('9780133594140', 'Computer Networking: A Top_Down Approach', 'James Kurose', 'Networking', '2017', '71', 'PB1059', '21 Mar 2022'),
('9780321486134', 'Computer Systems: Architecture and Operating Systems', 'Umakishore Ramachandran', 'Programming', '2010', '85', 'PB1057', '21 Mar 2022'),
('9781908614308', 'English for Academic Study', 'Joan MCCormack', 'English for Academic Study', '2014', '66', 'PB1055', '21 Mar 2022'),
('9783319730042', 'Introduction to Deep Learning', 'Sandro Skansi', 'Artificial Intelligence', '2018', '72' ,'PB1054', '21 Mar 2022'),
('9381159319316', 'Introduction to Database Management System', 'Satinder Bal Gupta', 'Databases', '2017', '50.40', 'PB1058', '21 Mar 2022'),
('9780321563842', 'The C++ Programming Language', 'Bjarne Stroustrup', 'Programming', '2013', '66.60', 'PB1057', '21 Mar 2022'),
('9781305494602', 'Systems Analysis and Design', 'Scott Tilley', 'Programming', '2016', '59.40', 'PB1059', '21 Mar 2022'),
('9781473751040', 'Foundation of Computer Science', 'Behrouz Forouzan', 'Computers', '2018', '43.80', 'PB1055', '21 Mar 2022'),
('9782815394372', 'Introduction to Python Programming', 'Gowrishankar S', 'Programming', '2019', '52.20', 'PB1054', '21 Mar 2022'), 
('9780134686998', 'Introduction to Mathematical Statistics', 'Robert V. Hogg', 'Mathematcial Statistics', '2019', '71.40', 'PB1057', '21 Mar 2022')

SELECT * FROM Publisher_Book_List;

-- Table of Orders (Orders that APU E Bookstore Manager made)
create table Orders(
Order_ID nvarchar(50),
Order_Date date not null,
primary key (Order_ID)
);

insert into Orders
values
('OR2465', '7 May 2022'),
('OR2466', '9 May 2022'),
('OR2467', '9 May 2022'),
('OR2468', '10 May 2022'),
('OR2469', '11 May 2022')

SELECT * FROM Orders;

-- Tables of Order ISBN (details of the orders)
create table Order_ISBN(
Order_Book_ID nvarchar(50),
Order_ID nvarchar(50) not null,
ISBN_No bigint not null,
Quantity integer not null,
primary key (Order_Book_ID),
foreign key (Order_ID) references Orders(Order_ID),
foreign key (ISBN_No) references Publisher_Book_List(ISBN_No)
);

insert into Order_ISBN
values 
('OB024', 'OR2465', '9780134686998', '20'),
('OB025', 'OR2465', '9782815394372', '20'), 
('OB026', 'OR2465', '9781473751040', '17'),
('OB027', 'OR2466', '9781305494602', '25'),
('OB028', 'OR2467', '9780321563842', '27'),
('OB029', 'OR2467', '9381159319316', '15'),
('OB030', 'OR2468', '9783319730042', '23'),
('OB031', 'OR2469', '9781908614308', '20'),
('OB032', 'OR2469', '9780321486134', '27')

SELECT * FROM Order_ISBN;

-- Table of Receives (record recieved order)
create table Receives(
Received_ID nvarchar(50),
Order_Book_ID nvarchar(50) not null,
Received_Date date not null,
Quantity integer not null,
primary key (Received_ID),
foreign key (Order_Book_ID) references Order_ISBN(Order_Book_ID)
);

insert into Receives
values
('RC3198', 'OB024', '8 May 2022', '20'),
('RC3199', 'OB025', '10 May 2022', '20'),
('RC3200', 'OB026', '10 May 2022', '17'),
('RC3201', 'OB027', '11 May 2022', '25'),
('RC3202', 'OB028', '12 May 2022', '27'),
('RC3203', 'OB029', '12 May 2022', '15'),
('RC3204', 'OB030', '12 May 2022', '14'),
('RC3205', 'OB030', '13 May 2022', '9')

SELECT * FROM Receives;

-- Table of Member (Details of Member)
create table Member(
Member_ID nvarchar(50),
Member_Name nvarchar(50) not null,
Contact_No nvarchar(50) not null,
IC_No nvarchar(50) not null,
primary key (Member_ID),
);

insert into Member
values
('TP060690', 'Saailendrao', '017-7119972', '020731-14-1113'),
('TP060691', 'Owais', '016-4872439', '020413-14-0427'),
('TP060692', 'Siti Nurzukrina', '012-4844566', '020927-14-3684'),
('TP060693', 'Boda', '012-5489613', '020603-14-4058'),
('TP060694', 'Choo Yi Bei', '016-4835238', '020105-14-4538'),
('TP060695', 'Sathish', '017-4685244', '020122-14-6813'),
('TP060696', 'Richard', '012-4588753', '020402-14-8345'),
('TP060697', 'Sairam', '016-4455862', '020314-14-1538')

SELECT * FROM Member;

-- Table of Shopping Cart (record of books that member added into cart)
create table ShoppingCart(
ShoppingCart_ID nvarchar(50),
Member_ID nvarchar(50) not null,
Book_ID nvarchar(50) not null,
Quantity integer not null,
primary key (ShoppingCart_ID),
foreign key (Member_ID) references Member(Member_ID),
foreign key (Book_ID) references Book(Book_ID)
);

insert into ShoppingCart
values
('SC090', 'TP060690', 'BK1062', '1'),
('SC091', 'TP060694', 'BK1056', '1'),
('SC092', 'TP060692', 'BK1058', '2'),
('SC093', 'TP060693', 'BK1059', '1'),
('SC094', 'TP060694', 'BK1062', '3'),
('SC095', 'TP060695', 'BK1060', '1'),
('SC096', 'TP060695', 'BK1062', '2'),
('SC097', 'TP060695', 'BK1058', '1')

SELECT * FROM ShoppingCart;

-- Table of Sales (record of member payment method, delivery address and so on)
create table Sales(
Purchase_ID nvarchar(50),
Member_ID nvarchar(50) not null,
Purchase_Date date not null,
Payment_Method nvarchar(50),
Delivery_Status nvarchar(50) not null,
Delivery_Address nvarchar(100) not null,
primary key (Purchase_ID),
foreign key (Member_ID) references Member(Member_ID),
);

insert into Sales
values
('PR301', 'TP060690', '14 May 2022', 'e-wallet', 'Delivered', 'No.44, Jalan Desa Melur 4/1'),
('PR302', 'TP060694', '14 May 2022', 'visa', 'Pending', '75 KG Sg Ramal Luar'),
('PR303', 'TP060692', '14 May 2022', 'visa', 'Pending', '204 JLN Lama Batu 3 3/4'),
('PR304', 'TP060693', '14 May 2022', 'e-wallet', 'Delivered', '3A Megan Avenue 1 Jln Tun Razak'),
('PR305', 'TP060691', '14 May 2022', 'visa', 'Delivered', '43 Jln Jejaka 2, Taman Maluri'),
('PR306', 'TP060695', '14 May 2022', 'visa', 'Pending', '7 Jln Burung Jentayu Taman Maluri'),
('PR307', 'TP060697', '14 May 2022', 'visa', 'Pending', 'Lorong Meranti 1, Off Jalan Kenanga')

SELECT * FROM Sales;

-- Table of Sales Book (details of sold books)
create table Sales_Book(
Sales_Book_ID nvarchar(50),
Purchase_ID nvarchar(50) not null,
Book_ID nvarchar(50) not null,
Quantity integer not null,
primary key (Sales_Book_ID),
foreign key (Purchase_ID) references Sales(Purchase_ID),
foreign key (Book_ID) references Book(Book_ID)
);

insert into Sales_Book
values
('201', 'PR301', 'BK1057', '1'),
('202', 'PR301', 'BK1058', '1'),
('203', 'PR302', 'BK1056', '1'),
('204', 'PR303', 'BK1059', '1'),
('205', 'PR304', 'BK1062', '1'),
('206', 'PR305', 'BK1061', '1'),
('207', 'PR306', 'BK1061', '1'),
('208', 'PR307', 'BK1058', '1')

SELECT * FROM Sales_Book;

-- Table of Rating (record of member feedbacks)
create table Rating(
Rating_ID nvarchar(50),
Member_ID nvarchar(50) not null,
Book_ID nvarchar(50) not null,
Rating integer not null,
Comment nvarchar(100),
primary key(Rating_ID),
foreign key(Member_ID) references Member(Member_ID),
foreign key(Book_ID) references Book(Book_ID)
);

insert into Rating
values
('RT1011', 'TP060690', 'BK1057', '8', 'Entertaining and Well-Written'),
('RT1012', 'TP060694', 'BK1056', '3', 'Not really interesting'),
('RT1013', 'TP060693', 'BK1059', '10', 'Very informative'),
('RT1014', 'TP060691', 'BK1062', '8', 'Entertaining and Well-Written'),
('RT1015', 'TP060697', 'BK1061', '9', 'Very informative'),
('RT1016', 'TP060690', 'BK1058', '7', 'Entertaining and Well-Written')

SELECT * FROM Rating;

-- Book(s) which has highest rating
SELECT TOP 3 r.Book_ID, b.Book_Name, AVG(r.Rating) AS Rating FROM Rating r 
INNER JOIN Book b
ON r.Book_ID = b.Book_ID 
GROUP BY r.Book_ID, b.Book_Name
ORDER BY AVG(r.Rating) DESC;

-- Total number of feedback per member
SELECT m.Member_ID,m.Member_Name, COUNT(r.Rating_ID) AS TotalNumberOfFeedback FROM Member m
INNER JOIN Rating r
ON m.Member_ID = r.Member_ID 
GROUP BY m.Member_ID, m.Member_Name;

-- Total Number of book published by each publisher
SELECT p.Publisher_ID, p.Company_Name , COUNT(b.Book_ID) AS BookPublished_By_Each_publisher FROM Publishers p
INNER JOIN Book b 
ON p.Publisher_ID = b.Publisher_ID 
GROUP BY p.Publisher_ID, p.Company_Name;

-- Total number of books ordered by store manager from each publisher
SELECT p.Publisher_ID, SUM(o.Quantity) AS TotalNumberOfBooksOrdered FROM Order_ISBN o
INNER JOIN Publisher_Book_List p
ON o.ISBN_No = p.ISBN_No 
GROUP BY p.Publisher_ID;

-- Books where quantity is more than the average quantity of all books
SELECT b.Book_ID, SUM(r.Quantity) AS BookQuantity FROM Book b
INNER JOIN Order_ISBN o
ON b.ISBN_No = o.ISBN_No 
INNER JOIN Receives r
ON r.Order_Book_ID = o.Order_Book_ID 
GROUP BY b.Book_ID 
HAVING SUM(r.Quantity) > (SELECT AVG(Quantity) FROM Receives);

-- The bestselling book(s)
SELECT TOP 3 s.Book_ID, b.Book_Name, SUM(s.Quantity) AS BooksSold FROM Sales_Book s 
INNER JOIN Book b 
ON b.Book_ID = s.Book_ID 
GROUP BY s.Book_ID, b.Book_Name 
ORDER BY SUM(s.Quantity) DESC;

-- Member(s) who spent most on buying books
SELECT TOP 3 s.member_ID, SUM(sb.Quantity) AS TotalNumberOfBooksBrought FROM Sales s
INNER JOIN Sales_Book sb
ON sb.Purchase_ID = s.Purchase_ID 
GROUP BY s.Member_ID 
ORDER BY SUM(sb.Quantity) DESC;

-- Member(s) who had not make any orders
SELECT m.Member_ID, m.Member_Name, s.Purchase_ID FROM Member m
LEFT JOIN Sales s
ON m.Member_ID = s.Member_ID 
WHERE Purchase_ID IS NULL;

-- Purchased books that have not been delivered to members
SELECT m.IC_No, s.Delivery_Address, m.Contact_No, sb.Book_ID, b.ISBN_No, b.Book_Name, SUM(sb.Quantity) AS Quantity, s.Purchase_Date, s.Delivery_Status  FROM Sales s
INNER JOIN Member m 
ON m.Member_ID = s.Member_ID 
INNER JOIN Sales_Book sb
ON sb.Purchase_ID = s.Purchase_ID 
INNER JOIN Book b
ON b.Book_ID = sb.Book_ID 
WHERE s.Delivery_Status = 'Pending'
GROUP BY m.IC_No, m.Contact_No, s.Delivery_Address, sb.Book_ID, b.ISBN_No, b.Book_Name, s.Purchase_Date, s.Delivery_Status;

-- Show members who made more than 2 orders
SELECT s.Member_ID, SUM(sb.Quantity) FROM Sales s
INNER JOIN Sales_Book sb
ON sb.Purchase_ID = s.Purchase_ID 
GROUP BY s.Member_ID 
HAVING SUM(sb.Quantity) > 2;