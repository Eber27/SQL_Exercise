/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

Select p.Name, c.Name 
From products p
Inner Join categories c on c.CategoryID = p.CategoryID
Where c.Name = 'Computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

Select p.Name, p.Price, r.Rating
From products as p
Inner Join reviews as r on p.ProductID = r.ProductID
Where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

Select e.FirstName, e.LastName, sum(s.Quantity) as Total_Sales
From employees as e
Inner Join sales as s on e.EmployeeID = s.EmployeeID
Group by e.EmployeeID
Order by Total_Sales Desc

/* joins: find the name of the department, and the name of the category for Appliances and Games */

Select d.Name as 'Department Name', c.Name as 'Category Name' 
From departments as d
Inner Join categories as c on c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' or c.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 Select p.Name, sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 From products as p
 Inner Join Sales as s on s.ProductID = p.ProductID
 Where p.ProductID = 97;
 
 /* just to verify use ---> select * from sales where ProductID = 97;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

Select p.Name, r.Reviewer, min(r.Rating), r.Comment
From products as p
Inner Join reviews as r on r.ProductID = p.ProductID
Where p.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

Select e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as 'Total Sold'
From sales as s 
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
Group by e.EmployeeID, p.ProductID;