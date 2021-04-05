--1.집계함수

--drop table score;
create table score
(
    kor number(3),
    eng number(3),
    mat number(3)
    );
    
    insert into score (kor,eng,mat)values (10,80,70);
    insert into score (kor,eng,mat)values (20,90,60);
    insert into score (kor,eng,mat)values (30,40,50); 
    insert into score (kor,eng,mat)values (100,90,70);
    insert into score (kor,eng,mat)values (100,90,90);
    
    --국어점수의 합계를 구한다
select sum(kor) from score; --칼럼이 1개인 테이블생성
select sum(kor) 합계 from score;--칼럼이름
select sum(kor) as 국어점수합계 from score; --별명


--모든점수합계
select sum(mat) +sum(eng)+sum(kor)합계 from score;
--국어 평균, 영어 최댓값, 수학 최솟값

select avg(kor)as 국어평균 from score;
select max(eng) as 영어최대 from score;
select min(mat) as 수학최소 from score;

--name칼럼 추가하고 적당한 이름을 삽입하시오
-- 국어 점수중 임의로 2개를 null로 수정하시오
alter table score add name varchar2(10);

update score set name = 'dopa  ' where kor =10;
update score set name = '   paka   ' where kor = 20;
update score set name = '  insec   ' where eng=40;

select count(name) from score;
select count(kor) from score;
select count(*) from score;

--대소문자 관련
select initcap(name) from score;
select upper(name) from score;
select lower(name) from score;

--문자열 길이 반환
select length(name)from score;
--문자열의 일부 반환 함수
select substr(name,2,3) from score;
--시작이 1 2~3글자 반환
--문자열에서 특정 문자의 포함된 위치 반환
select instr(name,'p') from score;  --없으면 0반환
select instr(upper(name),'p') from score;


select lpad(name,10,'*')from score;
select rpad(name,10,'*') from score;
--모든 name을 오른쪽 맞춤해서 출력
select lpad(name,10,' ') from score;



--모든 name을 다음과 같이 출력
-- do***
select rpad(substr(name,1,2),length(name),'*')from score;
--7 문자열 연결함수
--연산자 ||는 or이 아니라, 연결 연산자
select name || ' ' || kor || ' ' || eng||' ' ||mat from score; 
select concat(concat (name, ' '),kor)from score;
--불필요한 문자열 제거 함수 좌우만가능
--공백제거위주
select ltrim(name) from score;
select length(ltrim(name)) from score;
select rtrim(name) from score;
select length(rtrim(name)) from score;
select trim(name) from score;
select length(trim(name)) from score;

--다음 데이터 삽입
--80,80,90,james bond
insert into score(kor,eng,mat,name) values (80,80,80,'james bond');
--아래와 같이 출력
-- first_name last_name
-- james        bond

select
    substr(name,1,instr(name,' ')-1) as first_name,
    substr(name,instr(name,' ')+1) as last_name
    from
    score;

--숫자함수
--round함수 : 반올림
--round(값,자릿수) // 테이블을 사용하지않는 select문에서는 DUAL 테이블 사용
desc dual;
--소수 두자리로 반올림 //아무테이블이사용되지않았다.라는뜻
select round(123.4567,2)from dual; --123.45
select round(123.4567,1)from dual; --123.4
select round(123.4567,0)from dual;--123 //round(123.4567)로써도 같다
select round(123.4567,-1)from dual;--120
select round(123.4567,-2)from dual;--100

--올림함수
--CEIL(값) : 정수로 올림
select ceil(123.4567) from dual; --124
--소수 두자릿수로올림
--100곱하고 ceil처리 100으로 나눈다.
select ceil(123.4567*100) /100 from dual;
--십의 자리올림
select ceil(123.4567*0.1)*10 from dual;
--백의 자리 올림
select ceil(123.4567*0.01)*100 from dual;

--내림함수
--FLOOR(값) : 정수로 내림
--ceil과 같은방식으로 처리
select floor(567.8989*100)/100 from dual;
select floor(567.8989*10)/10 from dual;
select floor(567.8989) from dual;
select floor(567.8989*1)/1 from dual;
select floor(567.8989*0.1)*10 from dual;
select floor(567.8989*0.01)*100 from dual;


--절삭함수
select trunc(567.8989,-2) from dual;--500
select trunc(567.8989,-1) from dual;--560
select trunc(567.8989,0) from dual;--567
select trunc(567.8989) from dual;--567
select trunc(567.8989,1) from dual;--567.8
select trunc(567.8989,2) from dual;--567.8989

--내림과 절삭의 차이
--양수는 차이없음. 음수에서 차이가 남
select floor(-1.5) from dual; -- -2
select trunc(-1.5) from dual; -- -1

--절대값
select abs(-5) from dual;

-- 부호 판별
--sign(값) 값이 양수면 1 음수면 -1 0이면 0
select sign(5) from dual;
--나머지 MOD
select mod(7,2) from dual;
--제곱
select power(10,2) from dual;

--날짜함수
--현재 타입 date
select sysdate from dual;
--현재 타입 timestamp
select systimestamp from dual;
--년 월 일 시 분 초 추출
--extract(단위 from 날짜)
select extract(year from sysdate) as 현재년도,
        extract(month from sysdate)as 현재월,
        extract(day from sysdate) as 현재일,
        extract(hour from systimestamp) as 현재시간,
        extract(minute from systimestamp) as 현재분,
        extract(second from systimestamp) as 현재초
  from dual;
--날짜연산
select sysdate +1 as 내일,
        sysdate -1 as 어제,
        sysdate +0.5 as 열두시간후
from dual;
--개월연산
--add_months(날짜,N) : n개월후
select add_months(sysdate,3)as 삼개월후,
 add_months(sysdate,-3)as 삼개월후
 from dual;
 --months_between(날짜,날짜) : 두 날짜사이 개월수
select months_between(sysdate,to_date('2021-01-01'))from dual;

--
 
--형변화함수
--날짜변환함수
--to_date(문자열,형식)
--yyyy,yy
--mm,m dd,d hh,h 
-- MI,SS
select to_date('2021-04-01'),
        to_date('2021/04/01'),
        to_date('2021/01/04','yyyy/dd/mm'),
        to_date('20201022','yyyymmdd')
from dual;

--to_number(문자열)
select to_number('100') from dual;

select name,kor
  from score
 where kor>='50';

--문자열 변환함수
--to_char(값,형식)
--(1)숫자형식
select to_char(123),
        to_char(123,'9999999'),
        to_char(123,'0000000'),
        to_char(1234,'9,999'),
        to_char(12345,'9,999'),
        to_char(12345,'99,999'),
        to_char(3.14,'9.999'),
        to_char(3.14,'9.99'),
        to_char(3.14,'9.9')
  from dual;

--날짜형식
select to_char(sysdate,'yyyy. mm. dd'), 
        to_char(sysdate,'year month day'),
        to_char(sysdate,'hh:mi:ss')
  
  from dual;
  
--기타함수
select *from score;
update score set name=null where trim(mat)=70;
update score set kor=null where trim(name)='paka';

select kor,nvl(kor,0) from score; --null대신 0
select avg(kor) as 평균1,
        avg(nvl(kor,0)) as 평균2
  from score;
  --nvl2(값,값이null일때,null이아닐때)
select nvl2(kor,eng+mat,kor+eng+mat) from score;
--분기 함수
--decode(표현식,조건1,결과1,조건2,결과2....,기본값)
select decode('봄',
                '봄','꽃놀이',
                '여름','물놀이',
                '가을','단풍놀이',
                '겨울','눈싸움') 
  from dual;
--case 표현식
--when 비교식 then 결과값
--else 나머지

--case 평균
-- when>=90 then 'a학점'

select name,
    (nvl(kor,0) + eng + mat)/3 as 평균,
    (case 
        when (nvl(kor,0) + eng + mat)/3 >=90 then 'A학점'
        when (nvl(kor,0) + eng + mat)/3 >=80 then 'B학점'
        when (nvl(kor,0) + eng + mat)/3 >=70 then 'C학점'
        when (nvl(kor,0) + eng + mat)/3 >=60 then 'D학점'
        else 'F학점'
        end) as 학점
        from score;