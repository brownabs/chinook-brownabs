--Which country's customers spent the most?

SELECT TOP 1
 SUM(i.Quantity) as timesPurchased,
 ie.BillingCountry
FROM Track t
JOIN InvoiceLine i on i.TrackId = t.TrackId
JOIN Invoice ie on ie.InvoiceId = i.InvoiceId
group by ie.BillingCountry
order by timesPurchased desc
