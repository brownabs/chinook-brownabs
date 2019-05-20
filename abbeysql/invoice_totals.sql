--Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers

SELECT i.InvoiceId, i.Total, c.firstName + ' '+ c.lastName CustomerFullName, c.Country, e.FirstName + ' ' + e.LastName EmployeeFullName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e on c.SupportRepId = e.EmployeeId
