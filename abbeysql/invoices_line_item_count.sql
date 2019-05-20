--Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT il.InvoiceId,
 count(il.InvoiceId) as TotalInvoice, i.CustomerId, i.InvoiceDate, i.BillingAddress, i.BillingCity
FROM Invoice i 
JOIN InvoiceLine il on i.InvoiceId = il.InvoiceId
 group by il.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress, i.BillingCity,
 i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total
