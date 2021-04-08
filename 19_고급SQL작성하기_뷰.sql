--뷰
--1.기존 테이블을 이용해서 생성한 가상테이블
--2.디스크 대신 데이터 사전에만 등록된다.
--뷰 생성연습

CREATE VIEW TEST_VIEW AS (SELECT emp_no, name FROM employee);



create view test_view2 as(select * from employee
                            where position = '과장');
                            
select * from test_view;
select * from test_view2;

create view depart_view as(select e.emp_no,e.name,d.dept_name,e.position from department d right outer join employee e 
                            on e.depart =d.dept_no);
select * from depart_view;
drop view depart_view;