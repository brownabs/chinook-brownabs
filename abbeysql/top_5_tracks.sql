-- Provide a query that shows the top 5 most purchased songs.

SELECT TOP 5 t.Name,
 SUM(i.Quantity) as timesPurchased
FROM Track t
JOIN InvoiceLine i 
on i.TrackId = t.TrackId
group by t.Name
order by timesPurchased desc
