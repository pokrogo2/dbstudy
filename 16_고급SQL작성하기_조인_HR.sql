-- 1. 부서의 위치(location_id)가 1700 인 사원들의 employee_id, last_name, department_id, salary 를 조회한다.
-- 사용할 테이블 (departments, employees)
select
     e.employee_id
    ,e.last_name
    ,e.department_id
    ,e.salary
 from employees e inner join departments d --employees 테이블이 driving테이블, department가 driven
 on e.department_id = d.department_id
 where d.location_id = 1700;

select
     e.employee_id
    ,e.last_name
    ,e.department_id
    ,e.salary
 from employees e , departments d
 where e.department_id = d.department_id
 and d.location_id = 1700;
-- 2. 부서명(department_name)이 'Executive' 인 부서에 근무하는 모든 사원들의 department_id, last_name, job_id 를 조회한다.
-- 사용할 테이블 (departments, employees)
select
     d.department_id
    ,e.last_name
    ,e.job_id
  from  departments d,employees e 
 where  d.department_id(+)=e.department_id
 and d.department_name = 'Executive';

-- 3. 기존의 직업(job_id)을 여전히 가지고 있는 사원들의 employee_id, job_id 를 조회한다.
-- 사용할 테이블 (employees, job_history)
select
     e.employee_id
    ,e.job_id
  from employees e inner join job_history j
  on e.employee_id = j.employee_id
 where e.job_id = j.job_id;

-- 4. 각 부서별 사원수와 평균연봉을 department_name, location_id 와 함께 조회한다.
-- 평균연봉은 소수점 2 자리까지 반올림하여 표현하고, 각 부서별 사원수의 오름차순으로 조회한다.
-- 사용할 테이블 (departments, employees)
select
     d.department_name
    ,d.location_id
    ,count(e.employee_id) as 사원수
    ,round(avg(e.salary),2) as 평균연봉
  from departments d ,employees e
  where e.department_id = d.department_id
  group by d.department_name,d.location_id
  order by count(e.employee_id); --사원수로 바꿔도됨.

-- 5. 도시이름(city)이 T 로 시작하는 지역에서 근무하는 사원들의 employee_id, last_name, department_id, city 를 조회한다.
-- 사용할 테이블 (employees, departments, locations)
select
     e.employee_id
    ,e.last_name
    ,e.department_id
    ,l.city
  from locations l inner join departments d
  on l.location_id = d.location_id inner join employees e
  on d.department_id = e.department_id
  where l.city like 'T%';
  
  select
     e.employee_id
    ,e.last_name
    ,e.department_id
    ,l.city
  from locations l,departments d,employees e
  where l.location_id = d.location_id
  and d.department_id = e.department_id
  and l.city like 'T%';
 

-- 6. 자신의 상사(manager_id)의 고용일(hire_date)보다 빨리 입사한 사원을 찾아서 last_name, hire_date, manager_id 를 조회한다. 
-- 사용할 테이블 (employees)
--상사의 고용일(manager_id) 을 알아내고 나employee_id의 고용일을 알아내야함.
-- 조건 : e.manager_id = m.employee_id
-- manager_id 담당 테이블 m
-- employee_id 담당 테이블 e
-- manager고용일 m.hire_date
--employee 고용ㅇ일 e.hire_date
--일반조건 : e.hire_date<m.hire_date
select
     e.last_name as 내이름
    ,e.hire_date as 나의고용일
    ,e.manager_id
    ,m.last_name as 상사이름
    ,m.hire_date as 상사입사일
  from employees e join employees m
    on m.employee_id = e.manager_id
 where e.hire_date < m.hire_date;




-- 7. 같은 소속부서(department_id)에서 나보다 늦게 입사(hire_date)하였으나 나보다 높은 연봉(salary)을 받는 사원이 존재하는 사원들의
-- department_id, full_name(first_name 과 last_name 사이에 공백을 포함하여 연결), salary, hire_date 를 full_name 순으로 정렬하여 조회한다.
-- 사용할 테이블 (employees)
--나 me
--남 you
select
     me.department_id as 부서번호
    ,me.first_name || ' ' || me.last_name as 내이름
    ,me.salary as 내급여
    ,you.first_name || ' ' || you.last_name as 니이름
    ,you.salary as 니급여
  from employees me join employees you
  on me.department_id = you.department_id
 where me.hire_date < you.hire_date
  and me.salary <you.salary
  order by 부서번호,내이름;
    

-- 8. 같은 소속부서(department_id)의 다른 사원보다 늦게 입사(hire_date)하였으나 현재 더 높은 연봉(salary)을 받는 사원들의
-- department_id, full_name(first_name 과 last_name 사이에 공백을 포함하여 연결), salary, hire_date 를 full_name 순으로 정렬하여 조회한다.
-- 사용할 테이블 (employees)


select
     me.department_id as 부서번호
    ,me.first_name || ' ' || me.last_name as 내이름
    ,me.salary as 내급여
    ,you.first_name || ' ' || you.last_name as 너이름
    ,you.salary as 너급여
from employees me join employees you
    on me.department_id = you.department_id
    where me.hire_date>you.hire_date
    and me.salary> you.salary
    order by 부서번호,내이름;
