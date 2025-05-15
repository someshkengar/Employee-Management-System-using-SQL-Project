---Project Title : Employee Management System using SQL

---1.Database Setup

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

---2.Creating Tables

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL);

--- Use for See table

select * from Departments;


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id));
    
    select * from Employees;
    
---3.Altering Table Structure

ALTER TABLE Employees ADD COLUMN age INT;    

---4.Inserting Data

INSERT INTO Departments (dept_name) VALUES ('HR'), ('Engineering'), ('Marketing');

INSERT INTO Employees (emp_name, dept_id, salary, hire_date, age)
VALUES 
    ('Alice', 1, 50000, '2021-06-15', 30),
    ('Bob', 2, 70000, '2020-02-10', 35),
    ('Charlie', 3, 60000, '2022-09-22', 28); 
   
   Select * from Departments;
   Select * from Employees;
   
---5.Updating and Deleting Data

UPDATE Employees SET salary = salary + 5000 WHERE dept_id = 2;

DELETE FROM Employees WHERE emp_id = 3;

---6.Logical Operators and Constraints

SELECT * FROM Employees WHERE salary > 50000 AND age < 35;
SELECT * FROM Employees WHERE dept_id NOT IN (1, 3);

---7.Union Operator & Grouping

SELECT emp_name, salary FROM Employees WHERE dept_id = 1
UNION
SELECT emp_name, salary FROM Employees WHERE dept_id = 2;

SELECT dept_id, COUNT(emp_id) AS EmployeeCount 
FROM Employees 
GROUP BY dept_id 
HAVING COUNT(emp_id) > 1;

---8.Joins 

SELECT Employees.emp_name, Departments.dept_name
FROM Employees
INNER JOIN Departments ON Employees.dept_id = Departments.dept_id;

---9.Subqueries

SELECT emp_name, salary 
FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

---10.Window Functions

SELECT emp_name, salary, 
       RANK() OVER (ORDER BY salary DESC) AS SalaryRank
FROM Employees;

SELECT emp_name, salary,
       SUM(salary) OVER (PARTITION BY dept_id) AS DeptSalaryTotal
FROM Employees;



   
   
    
