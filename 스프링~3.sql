
    
create table department(
    dept_no number primary key,
    dept_name varchar2(15) not null,
    location varchar2(15) not null
);
    
create table employee(
    emp_no number primary key,
    name varchar2(20) not null,
    depart number references department(dept_no),
    position varchar2(20),
    gender char(2),
    hire_date DATE,
    salary number
);
    insert into department values(1,'������','�뱸');
insert into department values(2,'�λ��','����');
insert into department values(3,'�ѹ���','�뱸');
insert into department values(4,'��ȹ��','����');

    insert  INTO employee VALUES (1001, '��â��', 1, '����', 'M', '95-05-01', 5000000);
   insert INTO employee VALUES (1002, '��μ�', 1, '���', 'M', '17-09-01', 2500000);
   insert INTO employee VALUES (1003, '������', 2, '����', 'F', '90-09-01', 5500000);
   insert INTO employee VALUES (1004, '�Ѽ���', 2, '����', 'F', '93-04-01', 5000000);

--����
    update department set location ='��õ' where dept_name ='������';
    update department set location ='��õ' where dept_no =1;
    
    --����� ������ ������ 10%�λ��Ͻÿ�
    update employee set salary = salary*1.1 where position ='����' or  position='����';
    update employee set salary = salary*1.1 where position in('����','����');
    
    --�ѹ��� >�Ѱ� , �뱸 > ���� , 
    update department set location = '����' ,dept_name ='�Ѱ���' where dept_no=3;
    
    --����
    --��� employee�� ����
    delete from employee; --�߸������ϸ� rollback���� ��Ұ���
    truncate table employee; --�����Ի��� ��ҺҰ���
    
    delete from department where dept_no =4;
    
    
    