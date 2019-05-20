--How many Invoices were there in 2009 

SELECT COUNT(InvoiceId) Invoices
FROM Invoice
WHERE YEAR(InvoiceDate) = 2009
;

--How many Invoices were there in 2009 and 2011

select NumberOfInvoices, InvoiceYear
FROM (
    select COUNT(i.InvoiceId) NumberOfInvoices,
            Year(i.InvoiceDate) InvoiceYear
            from Invoice i
            group by Year(i.InvoiceDate)
) as Aggregate
where Aggregate.InvoiceYear = '2011'
or Aggregate.InvoiceYear = '2009'
;
