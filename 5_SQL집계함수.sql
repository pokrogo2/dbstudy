--1.�����Լ�

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
    
    --���������� �հ踦 ���Ѵ�
select sum(kor) from score; --Į���� 1���� ���̺����
select sum(kor) �հ� from score;--Į���̸�
select sum(kor) as ���������հ� from score; --����


--��������հ�
select sum(mat) +sum(eng)+sum(kor)�հ� from score;
--���� ���, ���� �ִ�, ���� �ּڰ�

select avg(kor)as ������� from score;
select max(eng) as �����ִ� from score;
select min(mat) as �����ּ� from score;

--nameĮ�� �߰��ϰ� ������ �̸��� �����Ͻÿ�
-- ���� ������ ���Ƿ� 2���� null�� �����Ͻÿ�
alter table score add name varchar2(10);

update score set name = 'dopa  ' where kor =10;
update score set name = '   paka   ' where kor = 20;
update score set name = '  insec   ' where eng=40;

select count(name) from score;
select count(kor) from score;
select count(*) from score;

--��ҹ��� ����
select initcap(name) from score;
select upper(name) from score;
select lower(name) from score;

--���ڿ� ���� ��ȯ
select length(name)from score;
--���ڿ��� �Ϻ� ��ȯ �Լ�
select substr(name,2,3) from score;
--������ 1 2~3���� ��ȯ
--���ڿ����� Ư�� ������ ���Ե� ��ġ ��ȯ
select instr(name,'p') from score;  --������ 0��ȯ
select instr(upper(name),'p') from score;


select lpad(name,10,'*')from score;
select rpad(name,10,'*') from score;
--��� name�� ������ �����ؼ� ���
select lpad(name,10,' ') from score;



--��� name�� ������ ���� ���
-- do***
select rpad(substr(name,1,2),length(name),'*')from score;
--7 ���ڿ� �����Լ�
--������ ||�� or�� �ƴ϶�, ���� ������
select name || ' ' || kor || ' ' || eng||' ' ||mat from score; 
select concat(concat (name, ' '),kor)from score;
--���ʿ��� ���ڿ� ���� �Լ� �¿츸����
--������������
select ltrim(name) from score;
select length(ltrim(name)) from score;
select rtrim(name) from score;
select length(rtrim(name)) from score;
select trim(name) from score;
select length(trim(name)) from score;

--���� ������ ����
--80,80,90,james bond
insert into score(kor,eng,mat,name) values (80,80,80,'james bond');
--�Ʒ��� ���� ���
-- first_name last_name
-- james        bond

select
    substr(name,1,instr(name,' ')-1) as first_name,
    substr(name,instr(name,' ')+1) as last_name
    from
    score;


