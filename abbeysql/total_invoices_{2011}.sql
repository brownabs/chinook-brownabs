--How many invoices were there in 2011?

SELECT COUNT(InvoiceId) Invoices
FROM Invoice
WHERE YEAR(InvoiceDate) = 2011
;
