--Provide a query that includes the purchased track name with each invoice line item

SELECT il.InvoiceLineId, il.InvoiceId, il.TrackId InvoiceTrackId, il.UnitPrice, il.Quantity, t.Name TrackName, t.TrackId TrackId
FROM InvoiceLine il
JOIN Track t ON t.TrackId = il.TrackId
ORDER BY il.InvoiceId;
