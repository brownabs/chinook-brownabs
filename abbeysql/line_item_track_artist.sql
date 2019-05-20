-- Provide a query that includes the purchased track name AND artist name with each invoice line item

SELECT   i.InvoiceLineId, i.UnitPrice, t.Name TrackName, art.Name ArtistName
From InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album ab ON t.AlbumId = ab.AlbumId
JOIN Artist art ON ab.ArtistId = art.ArtistId
