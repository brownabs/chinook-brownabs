-- Provide a query that shows the invoices associated with each sales agent. 
--The resultant table should include the Sales Agent's full name

SELECT
   concat (e.FirstName, ' ', e.LastName) SalesAgent,
   i.InvoiceId,
   i.InvoiceDate,
   i.BillingAddress,
   i.BillingCity,
   i.BillingState,
   i.BillingCountry,
   i.BillingPostalCode,
   i.Total
FROM Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId = c.CustomerId
ORDER BY e.LastName;
