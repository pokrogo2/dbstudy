CREATE TABLE department
(
    dept_no NUMBER,
    dept_name VARCHAR2(10),
    location VARCHAR2(10)
);
CREATE TABLE employee
(
    emp_no NUMBER,
    name VARCHAR2(10),
    depart NUMBER,
    position VARCHAR2(10),
    gender VARCHAR2(1),
    hire_date DATE,
    salary NUMBER
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY(dept_no);
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY(emp_no);
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY(depart) REFERENCES department(dept_no);


INSERT INTO department 
    (dept_no, dept_name, location) 
VALUES 
    (1, '영업부', '대구');
INSERT INTO department(dept_no, dept_name, location) VALUES (2, '인사부', '서울');
INSERT INTO department(dept_no, dept_name, location) VALUES (3, '총무부', '대구');
INSERT INTO department(dept_no, dept_name, location) VALUES (4, '기획부', '서울');

INSERT INTO employee 
    (emp_no, name, depart, position, gender, hire_date, salary)
VALUES
    (1001, '구창민', 1, '과장', 'M', '95-05-01', 5000000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1002, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1003, '이은영', 2, '부장', 'F', '90-09-01', 5500000);
INSERT INTO employee(emp_no, name, depart, position, gender, hire_date, salary) VALUES (1004, '한성일', 2, '과장', 'M', '93-04-01', 5000000);

COMMIT;


--카테전 곱
select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
    ,e.hire_date
    ,e.salary
    from employee e,department d;

select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
    ,e.hire_date
    ,e.salary
  from employee e
 cross join department d;
    
--내부조인
--inner join

select 
     emp_no
    ,dept_name
    ,name
    ,position
    ,hire_date
    ,salary
  from employee e inner join department d
   on e.depart = d.dept_no;

select 
     emp_no
    ,dept_name
    ,name
    ,position
    ,hire_date
    ,salary
  from employee e , department d
 where e.depart = d.dept_no;
 
alter table employee disable constraint employee_department_fk;    
--'참조무결성'
insert into employee(emp_no,name,depart,position,gender,hire_date,salary) values(1005,'김미나',5,'사원','F','2018-05-01',1800000);

    
--모든사원의 no,name,position dept_name출력
select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
  from employee e left outer join department d
  on e.depart = d.dept_no;
    
select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
  from employee e , department d
 where e.depart = d.dept_no(+);

select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
  from department d right outer join employee e
  on e.depart = d.dept_no;
    
    
select
     e.emp_no
    ,e.name
    ,d.dept_name
    ,e.position
  from department d , employee e
  where e.depart = d.dept_no(+);
    
/*
 dept_no 사원수
 1          2
 2          2
 3          0
 4          0
*/
-- 모든 depart
select
     d.dept_no
    ,count(e.depart)
  from department d left outer join employee e
 on  d.dept_no = e.depart
 group by d.dept_no;
 

