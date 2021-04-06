-- << employees 테이블 >> --

DESC employees;

-- 1. 전체 사원의 모든 칼럼을 조회한다.
select employees.employee_id ,employees.first_name,employees.last_name,employees.email,employees.phone_number from employees; 
select *from employees; --성능이 안좋다.


select e.employee_id,e.first_name,e.last_name,e.email,e.phone_number
from employees e; 
-- 2. 전체 사원의 first_name, last_name, job_id 를 조회한다.
select e.first_name,e.last_name,e.job_id from employees e;

-- 3. 연봉(salary)이 12000 이상되는 사원들의 last_name, salary 를 조회한다.
select e.last_name,e.salary from employees e where e.salary >=12000;


-- 4. 사원번호(employee_id)가 150 인 사원의 last_name, department_id 를 조회한다.
select e.last_name, e.department_id from employees e where e.employee_id=150;

-- 5. 커미션(commission_pct)을 받는 모든 사원들의 last_name, salary, commission_pct 를 조회한다.
select e.last_name,e.salary,e.commission_pct from employees e where e.commission_pct is not null;
select e.last_name,e.salary,e.commission_pct from employees e where nvl(e.commission_pct,0)!=0; --커미션퍼센트가 null이면 0대입

-- 6. 모든 사원들의 last_name, commission_pct 를 조회하되 커미션(commission_pct)이 없는 사원은 0으로 처리하여 조회한다.
select last_name,nvl(commission_pct,0)as commission_pct from employees;


-- 7. 커미션(commission_pct)이 없는 사원들은 0으로 처리하고, 커미션이 있는 사원들은 기존 커미션보다 10% 인상된 상태로 조회한다.
select last_name,commission_pct*1.1 as new_commission_pct 
  from employees
 where commission_pct is not null;
 --nvl2(표현식,notnull,null)
 select last_name,nvl2(commission_pct,commission_pct*1.1,0) as new_commission_pct 
  from employees;

-- 8. 연봉(salary)이 5000 에서 12000 인 범위의 사원들의 first_name, last_name, salary 를 조회한다.
select first_name,last_name,salary from empoyees
 where salary>=5000 and salary<=12000;

-- 9. 연봉(salary)이 5000 에서 12000 사이의 범위가 아닌 사원들의 first_name, last_name, salary 를 조회한다.
select first_name,last_name,salary from empoyees
 where salary<5000 or salary>12000;


-- 10. 직업(job_id)이 SA_REP 이나 ST_CLERK 인 사원들의 전체 칼럼을 조회한다.
select *
  from employees;
 where job_id = 'SA_REP' or job_id = 'ST_CLERK';
 
 select *
  from employees;
 where job_id in('SA_REP' ,'ST_CLERK');
-- 11. 연봉(salary)이 2500, 3500, 7000 이 아니며 직업(job_id) 이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select last_name 
  from emplyees
 where (salary !=2500 and salary!=3500 and salary !=7000)) 
   and job_id in('SA_REP','ST_CLERK');

-- 12. 상사(manager_id)가 없는 사람들의 last_name, job_id 를 조회한다.
select last_name,job_id
  from emloyees
 where manager_id is null;
/*
    와일드 카드
    1.모든 문자를 대체할 수 있는 만능문자
    종류  글자수 상관x 만능문자 %
    한글자 대체하는 만능문자 _
    와일드카드 연ㅅ나자 like
    예시
    마동석, 마요네즈 : 마%
    백설공주,평강공주 칠공주 : %공주
    아이언맨 맨드라미 슈퍼맨 배트맨 : %맨%
*/

-- 13. 성(last_name)에 u 가 포함되는 사원들의 employee_id, last_name 을 조회한다.
select employee_id,last_name
  from employees
where last_name like '%u%';

select employee_id,last_name
  from employees
where lower(last_name) like  '%u%';


-- 14. 전화번호(phone_number)가 650 으로 시작하는 사원들의 last_name, phone_number 를 조회한다.
select last_name,phone_number
from employees
where phone_number like '650%';

-- 15. 성(last_name)의 네 번째 글자가 a 인 사원들의 last_name 을 조회한다.
select last_name from employees where last_name like '___a%';

-- 16. 성(last_name) 에 a 또는 e 가 포함된 사원들의 last_name 을 조회한다.
select last_name from employees where last_name like '%a%'or last_name like '%e%';

-- 17. 성(last_name) 에 a 와 e 가 모두 포함된 사원들의 last_name 을 조회한다.
select last_name from employees where last_name like '%a%'and last_name like '%e%';

-- 18. 2008/02/20 ~ 2008/05/01 사이에 고용된(hire_date) 사원들의 last_name, employee_id, hire_date 를 조회한다.
select last_name,employee_id,hire_date
 from employees
 where hire_date between '2008/02/20' and '2008/05/01';

-- 19. 2004년도에 고용된(hire_date) 모든 사원들의 last_name, employee_id, hire_date 를 조회한다.
select last_name,employee_id,hire_date
 from employees
 where hire_date between '2004/01/01' and '2004/12/31';
 
 select last_name,employee_id,hire_date
 from employees
 where extract(year from hire_date)=2004;

select last_name,employee_id,hire_date
 from employees
 where hire_date like '04%';


-- 20. 부서(department_id)를 조회하되 중복을 제거하여 조회한다.
select distinct department_id
from employees;

-- 21. 직업(job_id)이 ST_CLERK 가 아닌 사원들의 부서번호(department_id)를 조회한다.
-- 단, 부서번호가 NULL인 값은 제외하고 부서번호의 중복을 제거한다.
select distint department_id
from employees
where job_id != 'ST_CLERK'
and department_id is not null;

-- 22. 커미션(commission_pct)을 받는 사원들의 실제 커미션(commission = salary * commission_pct)을 구하고,
-- employee_id, first_name, job_id 와 함께 조회한다.
select employee_id,first_name,job_id , salary * commission_pct as commission
from employees
where commission_pct is not null;
/*
 정렬
 order by 칼럼 asc
                desc
                구문의 맨마지막에
*/

-- 23. 가장 오래 전에 입사(hire_date)한 직원부터 최근에 입사한 직원 순으로 last_name, hire_date 를 조회한다.
select last_name,hire_date 
from employees order by hire_date asc;

-- 24. 부서번호(department_id)가 20, 50 인 부서에서 근무하는 모든 사원들의 부서번호의 오름차순으로 조회하되,
-- 같은 부서번호 내에서는 last_name 의 알파벳순으로 조회한다.
select *
from employees
where department_id in(20,50) order by department_id,last_name;

-- 25. 커미션(commission_pct)을 받는 모든 사원들의 last_name, salary, commission_pct 을 조회한다.
-- 연봉이 높은 사원을 먼저 조회하고 같은 연봉의 사원들은 커미션이 높은 사원을 먼저 조회한다.
select last_name,salary,commission_pct
from employees
where commission_pct is not null 
order by salary desc,commission_pct desc;




