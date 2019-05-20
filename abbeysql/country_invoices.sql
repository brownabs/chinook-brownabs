--Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT Count(InvoiceId) Invoices, BillingCountry
FROM Invoice
GROUP BY BillingCountry;

