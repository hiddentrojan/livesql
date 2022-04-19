--Creating Table

create table emp1 (empid int, name varchar(10), dept_name varchar(10));

--Inserting Records into the Table

insert into emp1 values(1,'Dubey','IT');
insert into emp1 values(2,'Charu','HR');
insert into emp1 values(3,'Gupta','security');

--Displaying The Table

select * from emp1;

--Creating Log Table

create table log_file(update_date date, Operation varchar(10),old_empid int, new_empid int,old_name varchar(10),new_name varchar(10), old_dept_name varchar(10),new_dept_name varchar(10));

--Creating a Trigger

create or replace trigger trg_emp
after insert or update or delete on emp1
for each row --applying for each row changes
declare
opr varchar(10);
begin
if inserting then 
opr:='insert';
dbms_output.put_line('Insert operation is performed on table');
elsif updating then 
opr:='update';
dbms_output.put_line('Update operation is performed on table');
elsif deleting then
opr:='delete';
dbms_output.put_line('Delete operation is performed on table');
end if;
insert into log_file values(sysdate,opr,:old.empid,:new.empid,:old.name,:new.name,:old.dept_name,:new.dept_name);
end;

--Inserting Value in the table

insert into emp1 values(4,'Kriti','Portal');

--Performing delete operation

delete from  emp1 where empid=3

--Displaying all the tables
select * from emp1;
select * from log_file;
