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

-- 8. How many Invoices were there in 2009 and 2011?

SELECT NumberOfInvoices, InvoiceYear
FROM (
    SELECT COUNT(i.InvoiceId) NumberOfInvoices,
            Year(i.InvoiceDate) InvoiceYear
            FROM Invoice i
            GROUP BY Year(i.InvoiceDate)
) AS Aggregate
WHERE Aggregate.InvoiceYear = '2011'
OR Aggregate.InvoiceYear = '2009'
;

-- 9. What are the respective total sales for each of those years?

SELECT sum(Total) Totalsales, count(InvoiceId) InvoiceTotal, Year(InvoiceDate) Year
 FROM Invoice
WHERE Year(InvoiceDate) = '2009' 
or Year(InvoiceDate) = '2011'
 GROUP by Year(InvoiceDate)

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.

SELECT  InvoiceId,
 count(InvoiceId) as TotalInvoice
 FROM InvoiceLine
 group by InvoiceId

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

-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

 SELECT count(pt.TrackId) TRACS, pt.PlaylistId, p.Name
FROM Playlist p
JOIN PlaylistTrack pt on p.PlaylistId = pt.PlaylistId
group by pt.PlaylistId, p.Name

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.Name Track, a.Title AlbumName, g.Name Genre, mt.Name MediaType
FROM Track t
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId

-- 17.  Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT il.InvoiceId,
 count(il.InvoiceId) as TotalInvoice, i.CustomerId, i.InvoiceDate, i.BillingAddress, i.BillingCity
FROM Invoice i 
JOIN InvoiceLine il on i.InvoiceId = il.InvoiceId
 group by il.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress, i.BillingCity,
 i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total

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

-- 19. Which sales agent made the most in sales in 2009?

SELECT TOP 1 e.EmployeeId, SUM(i.Total) as Totalsales, e.FirstName + ' ' + e.LastName as FULLNAME
FROM Invoice i 
JOIN Customer c on i.CustomerId = c.CustomerId
JOIN Employee e on c.SupportRepId = e.EmployeeId
WHERE YEAR(i.InvoiceDate) ='2009'
GROUP by e.EmployeeId,  e.LastName, e.FirstName 
ORDER by Totalsales desc 

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

-- 21.  Provide a query that shows the count of customers assigned to each sales agent.

SELECT e.FirstName + ' ' + e.LastName as FULLNAME, count(c.CustomerId) as CustomerTotal
FROM Employee e 
Left JOIN Customer c on e.EmployeeId = c.SupportRepId
where e.Title = 'Sales Support Agent'
group by e.FirstName, e.LastName

-- 22. Provide a query that shows the total sales per country.

SELECT BillingCountry Country, SUM(Total) TotalSales
FROM Invoice
GROUP BY BillingCountry;

-- 23. Which country's customers spent the most?

SELECT TOP 1
 SUM(i.Quantity) as timesPurchased,
 ie.BillingCountry
FROM Track t
JOIN InvoiceLine i on i.TrackId = t.TrackId
JOIN Invoice ie on ie.InvoiceId = i.InvoiceId
group by ie.BillingCountry
order by timesPurchased desc


-- 24. Provide a query that shows the most purchased track of 2013

SELECT TOP 1 t.Name TrackName, COUNT(il.TrackId) TrackSales
   FROM InvoiceLine il
   JOIN Invoice i ON i.InvoiceId = il.InvoiceId
   JOIN Track t ON t.TrackId = il.TrackId
   WHERE YEAR(i.InvoiceDate) = 2013
   GROUP BY t.Name
   ORDER BY TrackSales DESC
   
-- 25. Provide a query that shows the top 5 most purchased songs.

SELECT TOP 5 t.Name,
 SUM(i.Quantity) as timesPurchased
FROM Track t
JOIN InvoiceLine i 
on i.TrackId = t.TrackId
group by t.Name
order by timesPurchased desc

-- 26. Provide a query that shows the top 3 best selling artists.

SELECT TOP 3 a.Name ArtistName, COUNT(il.Quantity) SalesPerArtist
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
GROUP BY a.Name
ORDER BY SalesPerArtist DESC;

-- 27. Provide a query that shows the most purchased Media Type.

SELECT TOP 1
 SUM(i.Quantity) as timesPurchased, m.Name
FROM Track t
JOIN InvoiceLine i on i.TrackId = t.TrackId
JOIN MediaType m on m.MediaTypeId = t.MediaTypeId
group by m.Name
order by timesPurchased desc

