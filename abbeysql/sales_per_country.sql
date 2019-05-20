--Provide a query that shows the total sales per country.

SELECT BillingCountry Country, SUM(Total) TotalSales
FROM Invoice
GROUP BY BillingCountry;
