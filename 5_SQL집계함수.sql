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


