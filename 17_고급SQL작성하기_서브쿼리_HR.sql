-- 1. 모든 사원의 LAST_NAME, SALARY, 본인이 근무하는 부서의 평균연봉(SALARY)을 조회하시오.
select
     you.last_name 
    ,you.salary 
    ,(select round(avg(me.salary)) 
        from employees me 
        where me.department_id = you.department_id) as 평균 --동일한 테이블 두개를 놓고 보는것
    from employees you;
  
-- 2. 부서(DEPARTMENT_ID)별로 DEPARTMENT_ID, DEPARTMENT_NAME, 평균연봉을 조회하시오.
select
     d.department_id
    ,d.department_name
    ,(select round(avg(e.salary))
        from employees e
        where e.department_id = d.department_id) as 평균
  from departments d;
-- 3. 모든 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME 을 조회하시오.
select e.employee_id
     ,e.last_name
     ,(select d.department_name
        from departments d
        where d.department_id = e.department_id) as 부서명
    from employees e;

-- 4. 평균연봉 이상의 연봉을 받는 사원들의 정보를 조회하시오.
select
     last_name
    ,salary
  from employees
 where salary>=(select avg(salary) from employees);

-- 5. Patrick Sully 와 같은 부서에 근무하는 모든 사원정보를 조회하시오.
--fisrt name patrick
--last name sully
--patrick sully의 부서 알아내기
select first_name
    , last_name
    , department_id
    from employees
    where department_id in(select department_id from employees
                            where first_name = 'Patrick'
                            and last_name = 'Sully');

-- 6. 부서번호가 20인 사원들 중에서 평균연봉 이상의 연봉을 받는 사원정보를 조회하시오.
select last_name
    , salary
    , department_id
from employees
where department_id = 20
 and salary>=(select avg(salary)from employees);

-- 7. 'PU_MAN'의 최대연봉보다 더 많은 연봉을 받은 사원들의 정보를 조회하시오.
--다중행
select
    last_name
    ,salary
    ,job_id
    from employees
    where salary> all(select salary from employees where job_id = 'PU_MAN');

select
    last_name
    ,salary
    ,job_id
    from employees
    where salary > (select max(salary)
                    from employees
                    where job_id = 'PU_MAN');

-- 8. 사원번호가 131인 사원의 JOB_ID와 SALARY가 모두 일치하는 사원들의 정보를 조회하시오.
select last_name
        ,job_id
        ,salary
    from employees
  where job_id = (select job_id from employees where employee_id =131)
  and salary = (select salary from employees where employee_id=131);
  
select last_name
        ,job_id
        ,salary
    from employees
  where (job_id,salary) = (select job_id,salary from employees where employee_id =131);

-- 9. LOCATION_ID가 1000~1900인 국가들의 COUNTRY_ID와 COUNTRY_NAME을 조회하시오.
select
    country_id
    ,country_name
    from countries
    where country_id in(select
    distinct country_id
    from locations
    where location_id between 1000 and 1900);


-- 10. 부서가 'Executive'인 모든 사원들의 정보를 조회하시오.
--서브쿼리 부서 이름이ㅣ executive인부서들의 department_id
-- 서브쿼리의 WHERE 절에서 사용한 DEPARTMENT_NAME은 PK, UQ가 아니므로 서브쿼리의 결과는 여러 개이다.
select last_name
    , department_id
    from employees
    where department_id in(select 
    department_id
    from departments
    where department_name='Executive');

-- 11. 부서번호가 30인 사원들 중에서 부서번호가 50인 사원들의 최대연봉보다 더 많은 연봉을 받는 사원들을 조회하시오.
select last_name
    , salary
from employees
where department_id = 30
and salary> (select max(salary) from employees where department_id=50);
              

-- 12. MANAGER가 아닌 사원들의 정보를 조회하시오.
-- MANAGER는 MANAGER_ID를 가지고 있다.
select employee_id
     , last_name
     from employees 
     where employee_id not in (select distinct manager_id
    from employees where manager_id is not null); --널값안됨.

-- 13. 근무지가 'Southlake'인 사원들의 정보를 조회하시오.
--서브쿼리 근무지가 city가 southlake 인 location_id 를 locations에서 조회
--서브쿼리2 모든사원들의 location_id (employees와 departments의 조인)

select employee_id
     , last_name
from employees
where (
select location_id
    from departments d inner join employees e
    on d.department_id = e.department_id) in (select location_id
                                                from locations
                                                where city = 'Southlake');

select employee_id
     ,last_name
  from locations l , departments d, employees e
  where l.location_id = d.location_id
  and d.department_id = e.department_id
  and l.citry = 'Southlake';
-- 14. 부서명의 가나다순으로 모든 사원의 정보를 조회하시오.
select employee_id
    ,last_name
from employees e
order by(select d.department_name from departments d where d.department_id = e.department_id);

-- 15. 가장 많은 사원들이 근무하고 있는 부서의 번호와 근무하는 인원수를 조회하시오.
--근무중인 부서의 사원수
--최대인원이 근무하는 사원수
select department_id
    ,count(*) as 부서별사원수
    from employees
    group by department_id
having count(*) = (select max(count(*)) from employees
                    group by department_id);
