IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;

CREATE TABLE dbo.Customers
(
    CustomerId INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Segment VARCHAR(20) NOT NULL,
    IsActive BIT NOT NULL,
    CreatedOn DATE NOT NULL
);

CREATE TABLE dbo.Orders
(
    OrderId INT PRIMARY KEY,
    CustomerId INT NOT NULL,
    OrderDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    PaymentMode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Orders_Customer
    FOREIGN KEY (CustomerId) REFERENCES dbo.Customers(CustomerId)
);

INSERT INTO dbo.Customers VALUES
(101,'Gopi Suresh','Coimbatore','Retail',1,'2025-11-12'),
(102,'Anita Ravi','Chennai','Corporate',1,'2025-10-05'),
(103,'Karthik Mohan','Bengaluru','Retail',1,'2025-09-15'),
(104,'Meena Kumar','Chennai','Retail',0,'2024-12-20'),
(105,'Suresh Babu','Hyderabad','Corporate',1,'2025-01-10');

INSERT INTO dbo.Orders VALUES
(5001,101,'2026-01-10',1200.00,'Delivered','UPI'),
(5002,101,'2026-01-15',850.00,'Pending','Card'),
(5003,102,'2026-01-05',5000.00,'Delivered','Card'),
(5004,103,'2025-12-30',300.00,'Cancelled','Cash'),
(5005,105,'2026-01-18',2500.00,'Delivered','UPI'),
(5006,102,'2026-01-20',1500.00,'Pending','UPI');
