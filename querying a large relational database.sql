/*a. Get all the details from the person table including email ID, phone
number and phone number type
*/

select p.*, e.EmailAddress, pp.PhoneNumber,pnt.Name as PhoneNumberType
from Person.Person p
Left join Person.EmailAddress e on p.BusinessEntityID = e.BusinessEntityID
left join Person.PersonPhone pp on p.BusinessEntityID = pp.BusinessEntityID
left join Person.PhoneNumberType pnt on pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID;

/*b. Get the details of the sales header order made in May 2011 
*/

select * from Sales.SalesOrderHeader
where Year(OrderDate) = 2011 and month(OrderDate) = 5;

/* c. Get the details of the sales details order made in the month of May
2011
*/

select * from  Sales.SalesOrderDetail sod 
inner join Sales.SalesOrderHeader soh  
on sod.SalesOrderID = soh.SalesOrderID
where Year(OrderDate) = 2011 and month(OrderDate) = 5;

/*
(d) Get the total sales made in May 2011
*/

select sum(TaxAmt) TotalSales 
from Sales.SalesOrderHeader
where Year(OrderDate) = 2011 and month(OrderDate) = 5;


/*
(e) Get the total sales made in the year 2011 by month, ordered by increasing sales
*/

select Month(OrderDate) MonthOrder, sum(TaxAmt) TotalSales 
from Sales.SalesOrderHeader
where Year(OrderDate) = 2011 
group by month(OrderDate) 
order by TotalSales desc;
