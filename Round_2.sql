CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'IT');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES
(1, 'Prabhanjan', 'Kalburgi', 4),
(2, 'Aisha', 'Khan', 2),
(3, 'Suresh', 'Patel', 3),
(4, 'Priya', 'Verma', 4),
(5, 'Vijay', 'Sharma', 1),   
(6, 'Neha', 'Singh', 2),     
(7, 'Rohit', 'Mehta', 4),   
(8, 'Kavita', 'Rao', 3),     
(9, 'Arjun', 'Desai', 4),    
(10, 'Simran', 'Batra', 2); 
;

INSERT INTO Orders (OrderID, EmployeeID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-11-15', 1234),
(2, 2, '2023-12-02', 987),
(3, 3, '2024-01-10', 4321),
(4, 1, '2023-11-20', 2500),
(5, 5, '2023-12-15', 450),
(6, 6, '2023-12-25', 320),
(7, 7, '2024-01-05', 6700),
(8, 8, '2024-02-14', 1530),
(9, 9, '2024-02-20', 999),
(10, 10, '2024-03-01', 2750),
(11, 4, '2024-03-10', 1825),
(12, 2, '2024-03-15', 1200),
(13, 5, '2024-04-05', 845),
(14, 6, '2024-04-12', 5000),
(15, 7, '2024-05-03', 3750),
(16, 8, '2024-05-11', 620),
(17, 9, '2024-05-20', 940),
(18, 10, '2024-06-01', 2745),
(19, 1, '2024-06-15', 1300),
(20, 3, '2024-07-10', 1540),
(21, 4, '2024-07-25', 845),
(22, 7, '2024-08-05', 4920),
(23, 9, '2024-08-15', 3850),
(24, 8, '2024-08-20', 1450),
(25, 10, '2024-08-25', 2599);


SELECT d.DepartmentName,SUM(o.TotalAmount) AS TotalSalesAmount
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

