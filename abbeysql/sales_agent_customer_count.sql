--Provide a query that shows the count of customers assigned to each sales agent.

SELECT e.FirstName + ' ' + e.LastName as FULLNAME, count(c.CustomerId) as CustomerTotal
FROM Employee e 
Left JOIN Customer c on e.EmployeeId = c.SupportRepId
where e.Title = 'Sales Support Agent'
group by e.FirstName, e.LastName
