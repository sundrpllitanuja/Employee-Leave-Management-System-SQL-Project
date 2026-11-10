create database proj;
use proj;
#FOREIGN KEY (DEPT_ID) REFERENCES DEPTS (DEPT_ID);

create table Departments (department_id int primary key,department_name varchar(50));
create table Employees (employee_id int primary key,department_id int, foreign key(department_id) references departments(department_id),employee_name varchar(50),phone_num varchar(15),email varchar(30));
create table Managers (manager_id int primary key,manager_name varchar(30));
create table Leave_types (leave_type_id int primary key,leave_type_name varchar(30));
create table Leave_requests (leave_req_id int primary key,employee_id int,manager_id int, leave_type_id int ,start_date date,end_date date,total_days int,status varchar(30),reason varchar(50),foreign key (leave_type_id) references leave_types(leave_type_id),foreign key (employee_id) references employees(employee_id),foreign key (manager_id) references managers(manager_id));
INSERT INTO Departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance'), (4,'Sales'), (5,'Administration');
INSERT INTO Employees VALUES
(101,1,'Aarav','9876500001','aarav@mail.com'),
(102,2,'Bhavya','9876500002','bhavya@mail.com'),
(103,3,'Charan','9876500003','charan@mail.com'),
(104,4,'Divya','9876500004','divya@mail.com'),
(105,5,'Esha','9876500005','esha@mail.com'),
(106,2,'Farhan','9876500006','farhan@mail.com'),
(107,1,'Gopi','9876500007','gopi@mail.com'),
(108,3,'Hari','9876500008','hari@mail.com'),
(109,4,'Isha','9876500009','isha@mail.com'),
(110,5,'John','9876500010','john@mail.com');
INSERT INTO Managers VALUES
(1,'Ramesh'),(2,'Priya'), (3,'Kiran'), (4,'Sneha'), (5,'Arun');
INSERT INTO Leave_Types VALUES
(1,'Casual Leave'),
(2,'Sick Leave'),
(3,'Earned Leave'),
(4,'Maternity Leave'),
(5,'Unpaid Leave');
INSERT INTO Leave_Requests VALUES
(1001,101,1,1,'2026-07-01','2026-07-03',3,'Approved','Personal work'),
(1002,102,2,2,'2026-07-02','2026-07-04',3,'Pending','Fever'),
(1003,103,3,3,'2026-07-05','2026-07-06',2,'Approved','Vacation'),
(1004,104,4,1,'2026-07-07','2026-07-08',2,'Rejected','Family function'),
(1005,105,5,5,'2026-07-10','2026-07-12',3,'Approved','Personal'),
(1006,106,2,2,'2026-07-11','2026-07-11',1,'Pending','Medical'),
(1007,107,1,1,'2026-07-13','2026-07-15',3,'Approved','Travel'),
(1008,108,3,3,'2026-07-16','2026-07-20',5,'Approved','Vacation'),
(1009,109,4,2,'2026-07-18','2026-07-19',2,'Rejected','Sick'),
(1010,110,5,1,'2026-07-21','2026-07-22',2,'Pending','Personal');

show tables;
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Managers;
SELECT * FROM Leave_Types;
SELECT * FROM Leave_requests;


##########_________TASKS__________#########
#1. List all leave requests.
select * from leave_requests;

#2. Display leave request with employee name.
select l.*,employee_name e from leave_requests l join employees e on l.employee_id=e.employee_id; #l.* all from leave req

#3. Show approved leave requests
select * from leave_requests where status = 'Approved';

#4. Show pending leave requests
select * from leave_requests where status = 'pending';

#5. Employees currently on leave.
select e. employee_name,l.start_date,l.end_date from employees e join leave_requests l on e.employee_id =l.employee_id where 
l.status='approved' and curdate() between start_date and end_date;

#6. Count leave requests department-wise.
select d.department_name,count(l.leave_req_id) from departments d join employees e on  d.department_id=e.department_id join leave_requests l on l.employee_id=e.employee_id group by department_name;

#7. Count leave requests by status.
select status,count(leave_req_id) as total_requests from leave_requests group by status; #count,avg,max,min aggregate func

#8. Average leave days by department.
select d.department_name,avg(l.total_days) from departments d join employees e on  d.department_id=e.department_id join leave_requests l on l.employee_id=e.employee_id group by department_name;

#9. Employee with maximum leave days.
select e.employee_name,sum(l.total_days)as total_leave_days from employees e join leave_requests l on e.employee_id= l.employee_id group by e.employee_id,e.employee_name order by total_leave_days desc limit 1;#orderby high to low

#10. Department with maximum leave requests.
 select d.department_name,count(l.leave_req_id) as total_requests from departments d join employees e on d.department_id = e.department_id join leave_requests l on l.employee_id=e.employee_id group by d.department_id,d.department_name order by total_requests desc limit 1;

#11. Employees with more than 2 leave requests.
select e.employee_id, e.employee_name from Employees e join Leave_requests l on e.employee_id = l.employee_id where l.leave_req_id >=2;

#12. Employees who never applied for leave.
select * from employees where employee_id not in(select employee_id from leave_requests);

#13. Latest 5 leave requests.
select * from leave_requests order by start_date desc limit 5;

#14. Leave requests in last 30 days.
select * from leave_requests where start_date >= curdate();

#15. Display employee names in uppercase and lowercase.
select employee_name,upper(employee_name) as emp_upper,lower(employee_name) as emp_lower from employees;

#16. Show first 3 characters of employee names.
select distinct employee_name,substring(employee_name, 1, 3) as First_Three_Characters from Employees;

#17. Calculate leave duration.
select leave_req_id,employee_id,start_date,end_date,datediff(end_date, start_date) + 1 as Leave_Duration from Leave_Requests;

#18. Generate Leave Reference (EL-1001).

#19. Leave types used more than 5 times.
select leave_type_id,count(*) as Leave_req from leave_requests group by leave_type_id having count(*)>5;

#20. Manager-wise approved leave count.
select m.manager_name,count(l.leave_req_id) as Approved_Leaves from Managers m join Leave_Requests l on m.manager_id = l.manager_id
and l.status = 'Approved' group by m.manager_id, m.manager_name;

#21. Employees whose leave exceeds department average.
select employee_name, department_id, total_days from Employees e join Leave_Requests l on e.employee_id = l.employee_id where total_days >
(select avg(l2.total_days)from Leave_Requests l2 join Employees e2 on l2.employee_id = e2.employee_id 
where e2.department_id = e.department_id);

#22. Show monthly leave statistics.
select monthly.Leave_Month,monthly.Total_Requests,monthly.Total_Leave_Days
from (select month(start_date) AS Leave_Month,count(*) AS Total_Requests,sum(total_days) AS Total_Leave_Days
from Leave_Requests group by month(start_date)) as monthly;

#23. Longest leave taken.
select e.employee_name,l.leave_req_id,l.total_days from Employees e join Leave_Requests l on e.employee_id = l.employee_id order by l.total_days desc limit 1;

#24. Remaining leave balance.
#25. Open leave requests.
select * from leave_requests where status = "pending";

#26. Rejected leave requests.
select * from leave_requests where status = "rejected";

#27. Create a view for approved leaves.
create view approved_leaves as select * from leave_requests where status ='approved';
select * from approved_leaves;

#28. Create a view for pending leaves.
create view pending_leaves as select * from leave_requests where status ='pending';
select * from pending_leaves;

#29. Transaction to approve leave request.
set sql_safe_updates =0;
start transaction;
update leave_requests set status='approved' where status='pending';
select * from leave_requests;
rollback;

#30. Transaction to cancel leave request and restore balance.
start transaction;
update leave_requests set status='cancelled' where  leave_req_id =1002;
select * from leave_requests;
commit;

#31. Create a stored procedure to display all leave requests handled by a particular manager
call leave_req_approved_by_manager(2);

#32. Create a stored procedure to calculate the total number of leave days taken by an employee.
call leaves_taken_by_an_emp(104);

#33. Create a trigger on the Leave_Requests table.










