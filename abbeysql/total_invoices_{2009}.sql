--How many Invoices were there in 2009 

SELECT COUNT(InvoiceId) Invoices
FROM Invoice
WHERE YEAR(InvoiceDate) = 2009
;
