use company;

select "Creating view that shows name and dept name and location of all employees" as description;
create or replace view employeeDetails as 
select e.ename, d.dname as deptName, dl.dloc as deptLocation
from employee e
join department d on e.dno = d.dno
join dlocation dl on d.dno = dl.dno;

select "Create a trigger that prevents a project from being deleted if it is currently being worked by any employee" as description;
delimiter // 
create trigger preventProjectDeletion
before delete on project
for each row
begin
    declare projectCount int;
    select count(*)
    into projectCount
    from works_on
    where pno = OLD.pno;
    if projectCount > 0 then
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a project currently being worked on';
    end if;
end//
delimiter;