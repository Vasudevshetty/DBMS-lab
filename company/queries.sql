use company;

select "Make a list of all project no for projects that involve an empoloyee whose last name is Scott, either as a workers as a manager of the dept that controls the project" as question;
select distinct p.pno from project p
join works_on w on p.pno = w.pno 
join employee e on w.ssn = e.ssn 
where e.ename like '%Scott'
union
select distinct p.pno from project p 
join department d on d.dno = p.dno
join employee e on e.ssn = d.mgrssn
where e.ename like '%Scott';

select "Show resulting salaries if every empoyee working on Iot project is given 10% rise" as question;
update employee
set salary = salary * 1.10
where ssn in (select ssn from works_on where pno = (select pno from project where pname = 'IoT'));
select * from employee e;

select "Find the sum of the salaries of all employees of accounts dept as well as the max, min, and average salary in this dept" as question;
select sum(salary) as totalSalary, max(salary) as maxSalary, min(salary) as minSalary, avg(salary) as avgSalary
from employee where dno = (select dno from department where dname = 'Accounts');

select "Retrive the name of each employee who works on all the projects controleld by department no 5 (use not exists operator)" as question;
select e.ename from employee e
where not exists (
    select p.pno from project p
    where p.dno = 5
    and not exists (
        select 1
        from works_on w
        where w.ssn = e.ssn and w.pno = p.pno
    )
);

select "For each dept that has morethan 5 employee, reterive the dept no and the no of its employees who are making more than 600000" as question;
select dno, count(*) as numEmployees
from employee
where salary > 600000
group by dno 
having count(*) > 5;

