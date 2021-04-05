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

--�����Լ�
--round�Լ� : �ݿø�
--round(��,�ڸ���) // ���̺��� ��������ʴ� select�������� DUAL ���̺� ���
desc dual;
--�Ҽ� ���ڸ��� �ݿø� //�ƹ����̺��̻������ʾҴ�.��¶�
select round(123.4567,2)from dual; --123.45
select round(123.4567,1)from dual; --123.4
select round(123.4567,0)from dual;--123 //round(123.4567)�νᵵ ����
select round(123.4567,-1)from dual;--120
select round(123.4567,-2)from dual;--100

--�ø��Լ�
--CEIL(��) : ������ �ø�
select ceil(123.4567) from dual; --124
--�Ҽ� ���ڸ����οø�
--100���ϰ� ceiló�� 100���� ������.
select ceil(123.4567*100) /100 from dual;
--���� �ڸ��ø�
select ceil(123.4567*0.1)*10 from dual;
--���� �ڸ� �ø�
select ceil(123.4567*0.01)*100 from dual;

--�����Լ�
--FLOOR(��) : ������ ����
--ceil�� ����������� ó��
select floor(567.8989*100)/100 from dual;
select floor(567.8989*10)/10 from dual;
select floor(567.8989) from dual;
select floor(567.8989*1)/1 from dual;
select floor(567.8989*0.1)*10 from dual;
select floor(567.8989*0.01)*100 from dual;


--�����Լ�
select trunc(567.8989,-2) from dual;--500
select trunc(567.8989,-1) from dual;--560
select trunc(567.8989,0) from dual;--567
select trunc(567.8989) from dual;--567
select trunc(567.8989,1) from dual;--567.8
select trunc(567.8989,2) from dual;--567.8989

--������ ������ ����
--����� ���̾���. �������� ���̰� ��
select floor(-1.5) from dual; -- -2
select trunc(-1.5) from dual; -- -1

--���밪
select abs(-5) from dual;

-- ��ȣ �Ǻ�
--sign(��) ���� ����� 1 ������ -1 0�̸� 0
select sign(5) from dual;
--������ MOD
select mod(7,2) from dual;
--����
select power(10,2) from dual;

--��¥�Լ�
--���� Ÿ�� date
select sysdate from dual;
--���� Ÿ�� timestamp
select systimestamp from dual;
--�� �� �� �� �� �� ����
--extract(���� from ��¥)
select extract(year from sysdate) as ����⵵,
        extract(month from sysdate)as �����,
        extract(day from sysdate) as ������,
        extract(hour from systimestamp) as ����ð�,
        extract(minute from systimestamp) as �����,
        extract(second from systimestamp) as ������
  from dual;
--��¥����
select sysdate +1 as ����,
        sysdate -1 as ����,
        sysdate +0.5 as ���νð���
from dual;
--��������
--add_months(��¥,N) : n������
select add_months(sysdate,3)as �ﰳ����,
 add_months(sysdate,-3)as �ﰳ����
 from dual;
 --months_between(��¥,��¥) : �� ��¥���� ������
select months_between(sysdate,to_date('2021-01-01'))from dual;

--
 
--����ȭ�Լ�
--��¥��ȯ�Լ�
--to_date(���ڿ�,����)
--yyyy,yy
--mm,m dd,d hh,h 
-- MI,SS
select to_date('2021-04-01'),
        to_date('2021/04/01'),
        to_date('2021/01/04','yyyy/dd/mm'),
        to_date('20201022','yyyymmdd')
from dual;

--to_number(���ڿ�)
select to_number('100') from dual;

select name,kor
  from score
 where kor>='50';

--���ڿ� ��ȯ�Լ�
--to_char(��,����)
--(1)��������
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

--��¥����
select to_char(sysdate,'yyyy. mm. dd'), 
        to_char(sysdate,'year month day'),
        to_char(sysdate,'hh:mi:ss')
  
  from dual;
  
--��Ÿ�Լ�
select *from score;
update score set name=null where trim(mat)=70;
update score set kor=null where trim(name)='paka';

select kor,nvl(kor,0) from score; --null��� 0
select avg(kor) as ���1,
        avg(nvl(kor,0)) as ���2
  from score;
  --nvl2(��,����null�϶�,null�̾ƴҶ�)
select nvl2(kor,eng+mat,kor+eng+mat) from score;
--�б� �Լ�
--decode(ǥ����,����1,���1,����2,���2....,�⺻��)
select decode('��',
                '��','�ɳ���',
                '����','������',
                '����','��ǳ����',
                '�ܿ�','���ο�') 
  from dual;
--case ǥ����
--when �񱳽� then �����
--else ������

--case ���
-- when>=90 then 'a����'

select name,
    (nvl(kor,0) + eng + mat)/3 as ���,
    (case 
        when (nvl(kor,0) + eng + mat)/3 >=90 then 'A����'
        when (nvl(kor,0) + eng + mat)/3 >=80 then 'B����'
        when (nvl(kor,0) + eng + mat)/3 >=70 then 'C����'
        when (nvl(kor,0) + eng + mat)/3 >=60 then 'D����'
        else 'F����'
        end) as ����
        from score;