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

-- 12. Provide a query that includes the purchased track name with each invoice line item

SELECT il.InvoiceLineId, il.InvoiceId, il.TrackId InvoiceTrackId, il.UnitPrice, il.Quantity, t.Name TrackName, t.TrackId TrackId
FROM InvoiceLine il
JOIN Track t ON t.TrackId = il.TrackId
ORDER BY il.InvoiceId;

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT   i.InvoiceLineId, i.TrackId, i.UnitPrice, t.Name, ab.ArtistId, art.Name
From InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album ab ON t.AlbumId = ab.AlbumId
JOIN Artist art ON ab.ArtistId = art.ArtistId

-- 14. Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT Count(InvoiceId) Invoices, BillingCountry
FROM Invoice
GROUP BY BillingCountry;

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.Name Track, a.Title AlbumName, g.Name Genre, mt.Name MediaType
FROM Track t
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId

-- 18. Provide a query that shows total sales made by each sales agent.

SELECT CONCAT(e.FirstName, ' ', e.LastName) SalesAgent, totalSales.TotalSales
FROM Employee e
JOIN (
   SELECT e.EmployeeId, SUM(i.Total) TotalSales
   FROM Employee e
   JOIN Customer c ON c.SupportRepId = e.EmployeeId
   JOIN Invoice i ON i.CustomerId = c.CustomerId
   GROUP BY e.EmployeeId
) totalSales ON totalSales.EmployeeId = e.EmployeeId;


-- 20. Which sales agent made the most in sales over all?

SELECT TOP 1 CONCAT(e.FirstName, ' ', e.LastName) SalesAgent, totalSales.TotalSales
FROM Employee e
JOIN (
   SELECT e.EmployeeId, SUM(i.Total) TotalSales
   FROM Employee e
   JOIN Customer c ON c.SupportRepId = e.EmployeeId
   JOIN Invoice i ON i.CustomerId = c.CustomerId
   GROUP BY e.EmployeeId
) totalSales ON totalSales.EmployeeId = e.EmployeeId
ORDER BY totalSales.TotalSales desc;


-- 22. Provide a query that shows the total sales per country.

SELECT BillingCountry Country, SUM(Total) TotalSales
FROM Invoice
GROUP BY BillingCountry;


-- 24. Provide a query that shows the most purchased track of 2013

SELECT TOP 1 t.Name TrackName, COUNT(il.TrackId) TrackSales
   FROM InvoiceLine il
   JOIN Invoice i ON i.InvoiceId = il.InvoiceId
   JOIN Track t ON t.TrackId = il.TrackId
   WHERE YEAR(i.InvoiceDate) = 2013
   GROUP BY t.Name
   ORDER BY TrackSales DESC

-- 26. Provide a query that shows the top 3 best selling artists.

SELECT TOP 3 a.Name ArtistName, COUNT(il.Quantity) SalesPerArtist
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
GROUP BY a.Name
ORDER BY SalesPerArtist DESC;

