DROP TABLE CUSTOMER;
DROP TABLE BANK;
CREATE TABLE BANK
(
    BANK_CODE VARCHAR2(20) ,
    BANK_NAME VARCHAR2(30)

    );
    
    CREATE TABLE CUSTOMER(
    NO NUMBER ,
    NAME VARCHAR2(30) NOT NULL,
    PHONE VARCHAR2(30) ,
    AGE NUMBER ,
    AGE2 NUMBER ,
    BANK_CODE VARCHAR2(20)

    );

    --Į���� �߰�
    --alter table ���̺� Į���� Ÿ�� [��������]
    --1.bank���̺� bank_phone Į���߰�
    alter table bank add bank_phone varchar2(15);
    
    
    --���̺� ����Ȯ��
    DESC bank;
    DESC customer;
    --Į���� ����
    --alter table ���̺� modifyĮ���� Ÿ��;
    --1. bank���̺��� bank_nameĮ���� varchar2(15)�� ����
    alter table bank modify bank_name varchar2(15);
    --2.customer ���̺��� ageĮ���� number(3)���� ����
    alter table customer modify age number(3);
    
    --3.customer ���̺��� phoneĮ���� not null�� ����
    alter table customer modify phone varchar2(30) not null;
    
    --4.customer ���̺��� phoneĮ���� null�μ���
    alter table customer modify phone varchar2(30);
    
    --Į������
    --alter table ���̺� drop column Į����;
    --1.bank ���̺���  bank_phone Į���� �����Ѵ�.
    alter table bank drop column bank_phone;
    
    --Į���� �̸�����
    --alter table ���̺� rename column �⺻Į���� to �ű�Į����;
    --1.customer ���̺��� phoneĮ������ contack���� �����Ѵ�.
    alter table customer rename column phone to contact;
    
        --���̺� ����
    --ALTER ���̺��� �⺻
--    
--    ALTER TABLE BANK ADD CONSTRAINT BANK_PK PRIMARY KEY (BANK_CODE);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_PK PRIMARY KEY(NO);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_UQ UNIQUE (PHONE);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_CK CHECK(AGE BETWEEN 0 AND 100);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_BANK_FK FOREIGN KEY(BANK_CODE) REFERENCES BANK(BANK_CODE);
    