

create table Praveen_Emp(Id int Primary key,First_name varchar(40),Last_name varchar(40),Salary Decimal(8,2),Department_id int,Year_of_joining date,Year_of_Relieving date);

insert into Praveen_Emp values(1,'Praveen','Ganapathy',15000.00,1,'12/09/2022','12/09/2024');
insert into Praveen_Emp values(2,'Tharun','Kandha',16000.00,2,'12/09/2021','12/09/2023');
insert into Praveen_Emp values(3,'Ram','Janani',14000.00,3,'12/09/2020','12/09/2024');
insert into Praveen_Emp values(4,'Jeeva','Senthil',17000.00,10,'12/09/2019','12/09/2020');
insert into Praveen_Emp values(5,'Gokul','Ramani',19000.00,20,'12/09/2018','12/09/2020');
insert into Praveen_Emp values(6,'Arun','Pandi',10000.00,30,'12/09/2017','12/09/2021');
insert into Praveen_Emp values(7,'Susin','Dheeran',11000.00,30,'12/09/2005','12/09/2020');
insert into Praveen_Emp values(8,'Karuppu','vadivel',12000.00,30,'12/09/2001','12/09/2010');
insert into Praveen_Emp values(9,'Jack','Jones',13000.00,50,'12/09/2002','12/09/2012');
insert into Praveen_Emp values(10,'Sunil','Shetty',22000.00,90,'12/09/2004','12/09/2010');
insert into Praveen_Emp values(11,'Priya','Balan',18000.00,90,'12/09/2001','12/09/2011');
insert into Praveen_Emp values(12,'Karthick','Krishnan',21000.00,90,'12/09/2008','12/09/2015');
insert into Praveen_Emp values(13,'Khan','Shetty',20000.00,90,'12/05/2010','12/09/2015');
insert into Praveen_Emp values(14,'Hrithik','Krishnan',25000.00,90,'12/05/2015','12/09/2015');
insert into Praveen_Emp values(15,'Sam',null,10000.00,30,'12/05/2010','12/09/2015');
insert into Praveen_Emp values(16,'Salim',null,17000.00,30,'12/05/2015','12/09/2015');


select * from Praveen_Emp

--1.Write a query to display all the name which starts with S

select * from Praveen_Emp where First_name Like 'S%';

--2.Write a query to display all the name starts with S and ends with character n.

select * from Praveen_Emp where First_name Like 'S%' and First_name Like '%n';

--3.Write a query to display all the employees who are all working for department 90 and their name must starts with ‘S’.

select First_name from Praveen_Emp where Department_id=90 and  First_name Like 'S%';

--4.Display all the department id which contain 2 as 2nd character.
select Department_id from Praveen_Emp where Department_id Like '_2';


--5.Write a query to display all the employees who are all working in department 10,20,50 and 90.

select First_name from Praveen_Emp where Department_id in (10,20,50,90);

--6.Write a query to display who are all getting salary between 5000 and 7000.

select * from Praveen_Emp where Salary between 5000 and 7000;

--7.Display First_name, salary, department_id and manager_id of the employee who don't have manager

select p.First_name,p.Salary,p.Department_id,d.Manager_id from Praveen_Emp p join Prav_Dpts d on p.Department_id=d.Department_id where d.Manager_id=null;

--8.Display all the records in employees table and sort the first name in ascending order.
select * from Praveen_Emp order by First_name;

--9.Display first name, department id and salary from employees table and sort the records ( sort department id in ascending order and salary in descending order) 
select First_name,Department_id,Salary from Praveen_Emp order by Department_id ASC, Salary DESC;

--10.Display first three characters from first name.
SELECT SUBSTRING(First_name,1,3) 
     FROM Praveen_Emp ;

--11.Display last two character from last name.
SELECT Right(Last_name,2) as
Ln from
Praveen_Emp ;

--12.Display all the first name and position of a in that name (first occurrence of a).
select First_name,Charindex('A',First_name)as position from Praveen_Emp

--13. Write a query to select maximum salary from employees table
select max(Salary) from Praveen_Emp

--14.Write a query to select second maximum salary from employees table.
select max(Salary) as salary from Praveen_Emp where Salary <(select max(Salary) from Praveen_Emp)

--15.Display average salary in the department 90
select avg(Salary) As Average_Salary from Praveen_Emp where Department_id=90

--16.Display number of employees joined in each year into department 30.
select Count(*)as countofyear,year(Year_of_joining)as yearofjoining
from Praveen_Emp where Department_id =30 group by year(Year_of_joining);

--17.Display average salary for employees who did a job in the past.
SELECT Year_of_joining, AVG(Salary) AS
AVERAGE_SALARY FROM Praveen_Emp GROUP BY Year_of_joining ;

--18..Display the month in which more than 5 employees joined in any department
select Count(*) as Count,datename (month,Year_of_joining)as month from Praveen_Emp
group by datename(month,Year_of_joining)having count (Id)>3

--19.Display employee last name, starting date for all jobs from 2000 to 2005.
select Last_name ,Year_of_joining from Praveen_Emp where year( Year_of_joining) between 2000 and 2005;

--20.Display years in which more than 10 employees joined.
select count(Year_of_joining) as count
from Praveen_Emp
where (year(Year_of_joining))>10

--21.Display employee ID for jobs with average salary more than 10000.
select Id , avg(Salary) as AVGSALARY
from Praveen_Emp
group by Id
having avg(Salary)>10000


--23.Display employees who joined in the current year.
select Id from Praveen_Emp where Year_of_joining>=01/01/2017;

--24.Display first name in upper case and last name in lower case.
select upper(First_name) as FIRST_NAME, lower(Last_name) as Last_name from Praveen_Emp;

--25.Display the length of first name for employees where last name contain character ‘b’ after 3rd position. 

--26.Display first name and experience of the employees.
select First_name,Datediff(year,Year_of_joining,Year_of_Relieving)as Exp from Praveen_Emp;

--27.Display employees who joined in the month of May. 
SELECT 
FROM Praveen_Emp 
where (month(Year_of_joining))=5;

SELECT CONVERT(varchar, getdate(), 23)
select FIRST_NAME , 

--28.write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
select Id,First_name,Last_name  from Praveen_Emp where Salary > (select avg(Salary) from Praveen_Emp );

--29.Difference between primary key and Foreign key with exmple.


--30.Repalce ‘null’ value to ‘AAA’
select isnull(Last_name,'AAA') from Praveen_Emp;

--31.Create View table for ID,FIRST_NAME,LAST_NAME, DEPARTMENT_ID,DEPARTMENT_NAME.
CREATE VIEW View1 AS
SELECT Id, First_name,Last_name,Department_id
FROM Pra 
select * from View1;

--32.Create SYNONYMS for EMPLOYEE table.
CREATE SYNONYM P 
FOR Praveen_Emp;  
select * from P;

--33.Create a procedure for who are joined between 2 dates.


--34.Create a procedure for insert a rows in Department table.
CREATE TABLE Prav_Dpts
(
Department_id INT PRIMARY KEY,
Manager_id INT,
Department_name VARCHAR(50)
)

insert into Prav_Dpts values(1,21,'Devloper');
insert into Prav_Dpts values(2,43,'HR');
insert into Prav_Dpts values(3,22,'Testing');

CREATE PROCEDURE ins
AS
insert into Prav_Dpts values(10,44,'Marketing');

Exec ins;

select * from Prav_Dpts;

--35.write a query for convert ‘2006-12-30 00:38:54.840’ to 20061230003854 

select replace(convert(varchar, '2006-12-30',101),'-','') + replace(convert(varchar, '00:38:54',108),':','');