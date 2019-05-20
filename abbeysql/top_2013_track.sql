--Provide a query that shows the most purchased track of 2013

SELECT TOP 1 t.Name TrackName, COUNT(il.TrackId) TrackSales
    FROM InvoiceLine il
    JOIN Invoice i ON i.InvoiceId = il.InvoiceId
    JOIN Track t ON t.TrackId = il.TrackId
    WHERE YEAR(i.InvoiceDate) = 2013
    GROUP BY t.Name
    ORDER BY TrackSales DESC
