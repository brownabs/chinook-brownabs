--What are the respective total sales for each of those years?

SELECT sum(Total) Totalsales, count(InvoiceId) InvoiceTotal, Year(InvoiceDate) Year
 FROM Invoice
WHERE Year(InvoiceDate) = '2009' 
or Year(InvoiceDate) = '2011'
 GROUP by Year(InvoiceDate)
