-- Provide a query that shows the top 3 best selling artists.

SELECT TOP 3 a.Name ArtistName, COUNT(il.Quantity) SalesPerArtist
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
GROUP BY a.Name
ORDER BY SalesPerArtist DESC;
