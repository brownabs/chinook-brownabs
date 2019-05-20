-- Which sales agent made the most in sales in 2009?

SELECT TOP 1 e.EmployeeId, SUM(i.Total) as Totalsales, e.FirstName + ' ' + e.LastName as FULLNAME
FROM Invoice i 
JOIN Customer c on i.CustomerId = c.CustomerId
JOIN Employee e on c.SupportRepId = e.EmployeeId
WHERE YEAR(i.InvoiceDate) ='2009'
GROUP by e.EmployeeId,  e.LastName, e.FirstName 
ORDER by Totalsales desc 
