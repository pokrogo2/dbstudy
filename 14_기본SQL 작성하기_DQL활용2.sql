/*
    보기좋은 쿼리문
    select 바로 직전 혹은 오른쪽 테이블에 주석작성
    select from where group by의 라인을 맞춰줌
    칼럼은 라인당 한 칼럼, 한라인에모음
    칼럼이나 테이블을 대문자로 작성, 소문자로 작성한다면 항상 소문자
    SELECT A,B,C
        FROM TABLE;
    SELECT ASDFASDFASDF
        ,A
        ,B
        ,C
    FROM TABLE T
    WHERE T,A = 'XX';
    GROUP BY A
*/
-- 26. 연봉(salary) 총액과 연봉(salary) 평균을 조회한다.
SELECT
       SUM(salary) AS 연봉총액
     , ROUND(AVG(salary),2) AS 연봉평균
  FROM employees;

-- 27. 최대연봉(salary)과 최소연봉의 차이를 조회한다.
select 
      max(salary) as 최대연봉
    , min(salary) as 최소연봉
  from employees;

-- 28. 직업(job_id) 이 ST_CLERK 인 사원들의 전체 수를 조회한다.
select 
        count(*) as 사원수
  from employees
  where job_id = 'ST_CLERK';

-- 29. 매니저(manager_id)로 근무하는 사원들의 전체 수를 조회한다.
select 
        manager_id
  from employees
  group by manager_id;
  
select 
  count(distinct manager_id) as 매니저수
  from employees;

 

-- 30. 회사 내에 총 몇 개의 부서가 있는지 조회한다.
select 
  count(distinct manager_id) as 매니저수
  from employees;


-- 그룹화 연습

-- << departments 테이블 >>

-- 31. 같은 지역(location_id) 끼리 모아서 조회한다.
select distinct location_id
  from departments;

select location_id
  from departments
group by location_id;

-- 32. 같은 지역(location_id) 끼리 모아서 각 지역(location_id) 마다 총 몇 개의 부서가 있는지 개수를 함께 조회한다.
select
     location_id
    ,count(*) as 부서수
    
  from departments
 group by location_id;

-- 33. 같은 지역(location_id) 끼리 모아서 해당 지역(location_id) 에 어떤 부서(department_name) 가 있는지 조회한다.
--불가능한 쿼리문 모아서 조회가 불가능함

select
     location_id
     ,department_id
  from departments
 group by location_id,department_id;
--억지로 만든쿼리문

-- << employees 테이블 >>

-- 34. 각 부서(department_id)별로 그룹화하여 department_id 와 부서별 사원의 수를 출력한다.
select 
     department_id
    ,count(*) as 사원수
    from employees
    group by department_id;

-- 35. 부서(department_id)별로 집계하여 department_id 와 급여평균을 department_id 순으로 오름차순 정렬해서 출력한다.
select
     department_id
    ,avg(salary) as 급여평균
  from employees
 group by department_id
 order by department_id;

-- 36. 동일한 직업(job_id)을 가진 사원들의 job_id 와 인원수와 급여평균을 급여평균의 오름차순 정렬하여 출력한다.
select
     job_id as 직업
    ,count(*) as 인원수
    ,avg(salary) as 급여평균
  from employees
 group by job_id -- 직업으로 안되는이유 먼저 from을 읽고 select ->order by이므로 order by만 읽을수있다.
 order by job_id; 

-- 37. 직업(job_id)이 SH_CLERK 인 직원들의 인원수와 최대급여 및 최소급여를 출력한다.
select
     count(*)
    ,max(salary)
    ,min(salary)
  from employees
 where job_id ='SH_CLERK'
 group by job_id;

-- 38. 근무 중인 사원수가 5명 이상인 부서의 department_id 와 해당 부서의 사원수를 department_id 의 오름차순으로 정렬하여 출력한다.
select
     department_id
    ,count(*) as 사원수 --그룹바이가 없으면? id별로 묶인 그룹을 셀수없음.
  from employees
 group by department_id
 having count(department_id)>=5
 order by department_id;

-- 39. 평균급여가 10000 이상인 부서의 department_id 와 급여평균을 출력한다.
select
     department_id
    ,avg(salary) as 평균급여
  from employees
 group by department_id
having avg(salary)>=10000;

-- 40. 부서(department_id)마다 같은 직업(job_id)을 가진 사원수를 department_id 순으로 정렬하여 출력한다.
-- 단, department_id 가 없는 사원은 출력하지 않는다.

select
     department_id
    ,count(*) as 사원수
  from employees
 where department_id is not null
 group by department_id
 order by department_id;

--\리뷰 1 모든 사원들의 name(first_name,last_name을 합침) dept_name을 조회하시오

--리뷰 2 서울에서 근무하는 사원들의 emp_no,name을 조회하시오.

--리뷰 3 모든 사원들의 emp_no name dept_name
--리뷰1. 모든 사원들의 name, dept_name
select 
     e.name
    ,d.dept_name
  from department d,employee e
 where d.dept_no = e.depart; --내부조인

select
     e.name
    ,d.dept_name
  from department d inner join employee e
    on d.dept_no = e.depart;
--리뷰2 서울에서 근무하는 사원들의 emp_no name 조회
select
     emp_no
    ,name
  from department d, employee e
 where d.dept_no = e.depart --조인먼저작성
 and d.location = '서울';
 
 select
     emp_no
    ,name
  from department d inner join employee e
  on d.dept_no = e.depart
  where d.loction ='서울';
  --리뷰 3 모든사웓늘의 name,dept_name 조회 부서없는사람도 조회하시오
select 
    e.name
    ,d.dept_name
  from department d,employee e
 where d.dept_no(+) = e.depart; --+가 있는테이블은 일치하는정보만 조회 +없으면 전체

select 
    e.name
    ,d.dept_name
  from department d right outer join employee e
   on d.dept_no = e.depart;
