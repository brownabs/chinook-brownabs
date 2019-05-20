--Provide a query showing only the Employees who are Sales Agents

SELECT CONCAT(FirstName, ' ', LastName) SalesAgent
FROM Employee
WHERE Employee.Title = 'Sales Support Agent';
