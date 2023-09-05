--- 1, Generate a list of salespeople and sort it in descending order by hire date. Show the first name, last name, hire date, and salary for each salesperson.

SELECT *
FROM salesperson
ORDER BY SHireDate DESC;

--- 2, Generate a list of customers whose last name begins with the letter “M.” Show the first and last names of these customers.  Sort the list of customers in descending order by last name.

SELECT CFirstName, CLastName
FROM customers
WHERE CLastName LIKE 'M%'
ORDER BY CLastName DESC;


--- 3, Generate a list of customers with annual incomes greater than $80,000 who purchased cars from salesperson “Katie.” Show the first name, last name, and annual income of each of these customers.

SELECT CFirstName, CLastName, AnnualIncome
FROM customers
JOIN Encounter ON customers.CustomerID = Encounter.CustomerID
JOIN salesperson ON Encounter.SalesID = salesperson.SalesID
WHERE AnnualIncome >'80000'
AND SFirstName = 'Katie'; 

--- 4, Which customers purchased vehicles from salesperson “Dudley” despite having a “Poor,” “Very Poor,” or “Extremely Poor” credit rating? Show the first name, last name, and credit description for these customers.

SELECT CFirstName, CLastName, CreditDescription
FROM customers
JOIN creditrating ON customers.CreditID = creditrating.CreditID
JOIN Encounter ON customers.CustomerID = Encounter.CustomerID
JOIN salesperson ON Encounter.SalesID = salesperson.SalesID
WHERE CreditDescription IN ('Poor','Very Poor','Extremely poor')
AND SFirstName = 'Dudley';


--- 5, Salesperson Colin recently had an encounter with a customer who he would like to contact again. Unfortunately, Colin can’t remember if the customer’s last name was “Hansen” or “Hanson.” Construct a query to help Colin find the correct customer.

SELECT CFirstName, CLastName
FROM customers
JOIN Encounter ON customers.CustomerID = Encounter.CustomerID
JOIN salesperson ON Encounter.SalesID = Encounter.SalesID
WHERE SFirstName = 'Colin'
AND  CLastName LIKE 'Hansen' OR CLastName LIKE 'Hanson'
GROUP BY CFirstName, CLastName;

--- 6, Construct a query to count how many encounters resulted in the customer declining to make a purchase. Use the COUNT function. (Hint:a customer can have many encounters)
 
 SELECT Encounter.CustomerID, COUNT(Encounter.CustomerID) AS num_declined_purchase
 FROM Encounter
 LEFT JOIN Customers ON Encounter.CustomerID = customers.customerID  AND Encounter.Purchase = 'FALSE'
 GROUP BY Encounter.CustomerID;

 --- 7, Customers with low annual income or poor credit ratings often have trouble qualifying for credit. A new, local credit agency may be better able to serve this market segment than the current options can. The manager would like to talk to few of them.
  SELECT *
  FROM customers
  JOIN creditrating ON customers.CreditID = creditrating.CreditID
  WHERE CreditDescription IN ('Poor');

  --- 8, Generate a query to find the average income of customers who purchased a car on their interaction.

  SELECT AVG(customers.Annualincome) AS average_income_of_car_purchase
  FROM customers
  JOIN Encounter ON customers.CustomerID = Encounter.CustomerID
  WHERE Encounter.Purchase = 1;

  --- 9, Construct a query to show customers with an annual income greater that $100,000 who have a credit rating of "Fair", "Poor", "Very Poor", or "Extremely Poor". Show customer's first name, last name, credit description, and annual income.

  SELECT CFirstName, CLastName, creditrating.CreditDescription, customers.AnnualIncome
  FROM customers
  JOIN creditrating ON customers.CreditID = creditrating.CreditID
  WHERE AnnualIncome > 100000
  AND creditrating.CreditDescription IN ('Fair', 'Poor','Very Poor', 'Extremely Poor');







  select * 
  from salesperson
  order by SHireDate desc;



  select CFirstName,CLastName
  from customers
  where CLastName like 'M%'
  order by CLastName desc


  select CFirstName, CLastName, AnnualIncome
  from customers
  join Encounter on customers.CustomerID = Encounter.CustomerID
  join salesperson on Encounter.SalesID = salesperson.SalesID
  where AnnualIncome>80000
  and SFirstName = 'Katie'


  select CFirstName, CLastName, CreditDescription
  from customers
  join creditrating on customers.CreditID = creditrating.CreditID
  join Encounter on customers.CustomerID = Encounter.CustomerID
  join salesperson on Encounter.SalesID = salesperson.SalesID
  where CreditDescription in ('poor','very poor','extremely poor')
  and SFirstName = 'Dudley';

  select CFirstName, CLastName
  from customers
  join Encounter on customers.CustomerID = Encounter.CustomerID
  join salesperson on Encounter.SalesID = salesperson.SalesID
  where SFirstName = 'colin'
  and CLastName = 'hansen' or CLastName = 'hanson'


  select Encounter.CustomerID, count (Encounter.CustomerID) as declined_purchase
  from Encounter
  LEFT JOIN Customers on Encounter.CustomerID = Customers.CustomerID
  and encounter.purchase = 'false'
  group by Encounter.CustomerID

  select *
  from customers
  join creditrating on customers.CreditID = creditrating.CreditID
  where CreditDescription in ('poor')


  select AVG(customers.Annualincome) AS average_income_of_car_purchase
  FROM customers
  JOIN Encounter ON customers.CustomerID = Encounter.CustomerID
  WHERE Encounter.Purchase = 1;


    SELECT CFirstName, CLastName, creditrating.CreditDescription, customers.AnnualIncome
  FROM customers
  JOIN creditrating ON customers.CreditID = creditrating.CreditID
  WHERE AnnualIncome > 100000
  AND creditrating.CreditDescription IN ('Fair', 'Poor','Very Poor', 'Extremely Poor')



  