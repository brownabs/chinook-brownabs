--Provide a query showing the Invoices of customers who are from Brazil. 
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country

SELECT i.InvoiceId, i.InvoiceDate, i.BillingCountry,  c.firstName + ' ' + c.lastName FullName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE BillingCountry = 'Brazil'
