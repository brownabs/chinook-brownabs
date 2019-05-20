--1.  Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, CustomerId, Country
FROM Customer
WHERE Country != 'USA'

-- 2. Provide a query only showing the Customers from Brazil.

SELECT FirstName, LastName, CustomerId, Country
FROM Customer
WHERE Country = 'Brazil';

-- 3.  Provide a query showing the Invoices of customers who are from Brazil. 
--     The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT i.InvoiceId, i.InvoiceDate, i.BillingCountry,  c.firstName, c.lastName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE BillingCountry = 'Brazil'

-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT CONCAT(FirstName, ' ', LastName) SalesAgent
FROM Employee
WHERE Employee.Title = 'Sales Support Agent';

-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT InvoiceId, InvoiceDate, BillingCountry
FROM Invoice
WHERE BillingCountry = 'France'

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT
   concat (e.FirstName, ' ', e.LastName) SalesAgent,
   i.InvoiceId,
   i.InvoiceDate,
   i.BillingAddress,
   i.BillingCity,
   i.BillingState,
   i.BillingCountry,
   i.BillingPostalCode,
   i.Total
FROM Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId = c.CustomerId
ORDER BY e.LastName;

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT i.InvoiceId, i.Total, c.firstName, c.lastName, c.Country, e.FirstName, e.LastName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e on c.SupportRepId = e.EmployeeId

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT   i.InvoiceLineId, i.TrackId, i.UnitPrice, t.Name, ab.ArtistId, art.Name
From InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album ab ON t.AlbumId = ab.AlbumId
JOIN Artist art ON ab.ArtistId = art.ArtistId
