-- Provide a query that shows the most purchased Media Type.

SELECT TOP 1
 SUM(i.Quantity) as timesPurchased, m.Name
FROM Track t
JOIN InvoiceLine i on i.TrackId = t.TrackId
JOIN MediaType m on m.MediaTypeId = t.MediaTypeId
group by m.Name
order by timesPurchased desc
