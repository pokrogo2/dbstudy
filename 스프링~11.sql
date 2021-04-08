--서브쿼리
--쿼리문 내부에 다른 쿼리문을 포함하는것

--단일행 서브쿼리
--서브쿼리의 결과가 1개인 쿼리
--단일행 서브쿼리 연산자 = != > >= < <=
--문제 1 평균 급여보다 더높은 급여를 받는 사원들의 정보를 조회하시오.

select
     name
    ,position
    ,salary
 from employee
 where salary> (select avg(salary)from employee);
 
 -- 문제 2 사원번호가 1001인사원과 같은 직급을 가진 사원들의 정보를 조회하시오.
 select
     name
    ,position
 from employee
 where position= (select position 
                    from employee 
                   where emp_no =1001);
 
 --문제 3. 가장 급여가 높은 사원과 낮은 사원을 조회하시오.
select name
    , position
    , salary
    from employee
 where salary = (select max(salary) from employee)
    or salary = (select min(salary) from employee);
 --다중행 서브쿼리
--서브쿼리의 결과가 여러개인 쿼리
--다중행 서브쿼리 연산자 in any all exists
--문제 1. 부서번호가 1인 부서에 존재하는 직급과 같은 직급을 가지고 있는 모든 사원을 조회하시오.
select
     name
    ,depart
    ,position
 from employee
  where position in(select position from employee where depart =1);
--문제 2 구창민과 같은 부서에서 근무하는 사원조회
select 
     name
     ,depart
     ,position
    from employee
    where depart in (select depart from employee where name='구창민');
 
 --문 3 부서번호가 1인 부서에서 근무하는 사원들의 모든 급여보다 큰 급여를 받는 사원들 조회
select name
    ,depart
    ,salary
 from employee
 where salary >all(select salary from employee where depart=1);
 
 --스칼라 서브쿼리
 
-- 1. select절에서 사용하는 서브쿼리다
-- 2. 단일행 서브쿼리

--문제 1. 모든 사원들의 평균연봉
select (select avg(e.salary) as 평균연봉 from employee e)
    , (select count(d.dept_no) from department d) as 부서수
    from dual;
 --인라인 뷰
 -- from절에서 사용하는 서브쿼리
 -- 일종의 임시테이블
 -- 인라인 뷰에서 select한 칼럼만 메인쿼리에서 사용
 
 --문제  부서번호가 1 인 사원조회 이름순으로 정렬
 select depart
    ,name
    from employee
    where depart =1
    order by name;
--인라인 뷰
select depart
    ,name
from (select depart,name from employee order by name) e
where e.depart =1;

--create 문과 서브쿼리

--서브쿼리의 결과를 이용해 새로운 테이블생성
--데이터를 포함할수도있고 제외할수도있다.
desc employee;
--문제 1 employee 테이블의 구조와 데이터를 모두 복사해 새로운 employee2생성
--pk나 fk 같은제약조건은 복사 x
create table employee2
 as (select EMP_NO ,
NAME ,
DEPART ,
POSITION ,
GENDER ,
HIRE_DATE ,
SALARY  from employee);
 --employee3
 create table employee3
 as (select EMP_NO ,
NAME ,
DEPART ,
POSITION ,
GENDER ,
HIRE_DATE ,
SALARY  from employee
    where 1=2); --아무 데이터도 조회 x