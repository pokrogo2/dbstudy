
    
create table department(
    dept_no number primary key,
    dept_name varchar2(15) not null,
    location varchar2(15) not null
);
    
create table employee(
    emp_no number primary key,
    name varchar2(20) not null,
    depart number references department(dept_no),
    position varchar2(20),
    gender char(2),
    hire_date DATE,
    salary number
);
    insert into department values(1,'영업부','대구');
insert into department values(2,'인사부','서울');
insert into department values(3,'총무부','대구');
insert into department values(4,'기획부','서울');

    insert  INTO employee VALUES (1001, '구창민', 1, '과장', 'M', '95-05-01', 5000000);
   insert INTO employee VALUES (1002, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
   insert INTO employee VALUES (1003, '이은영', 2, '부장', 'F', '90-09-01', 5500000);
   insert INTO employee VALUES (1004, '한성실', 2, '과장', 'F', '93-04-01', 5000000);

--수정
    update department set location ='인천' where dept_name ='영업부';
    update department set location ='인천' where dept_no =1;
    
    --과장과 부장의 월급을 10%인상하시오
    update employee set salary = salary*1.1 where position ='과장' or  position='부장';
    update employee set salary = salary*1.1 where position in('과장','부장');
    
    --총무부 >총괄 , 대구 > 광주 , 
    update department set location = '광주' ,dept_name ='총괄팀' where dept_no=3;
    
    --삭제
    --모든 employee를 삭제
    delete from employee; --잘못삭제하면 rollback으로 취소가능
    truncate table employee; --빠르게삭제 취소불가능
    
    delete from department where dept_no =4;
    
    
    