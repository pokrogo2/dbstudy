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

    --칼럼의 추가
    --alter table 테이블 칼럼명 타입 [제약조건]
    --1.bank테이블에 bank_phone 칼럼추가
    alter table bank add bank_phone varchar2(15);
    
    
    --테이블 구조확인
    DESC bank;
    DESC customer;
    --칼럼의 수정
    --alter table 테이블 modify칼럼명 타입;
    --1. bank테이블의 bank_name칼럼을 varchar2(15)로 수정
    alter table bank modify bank_name varchar2(15);
    --2.customer 테이블의 age칼럼을 number(3)으로 수정
    alter table customer modify age number(3);
    
    --3.customer 테이블의 phone칼럼을 not null로 수정
    alter table customer modify phone varchar2(30) not null;
    
    --4.customer 테이블의 phone칼럼을 null로수정
    alter table customer modify phone varchar2(30);
    
    --칼럼삭제
    --alter table 테이블 drop column 칼럼명;
    --1.bank 테이블의  bank_phone 칼럼을 삭제한다.
    alter table bank drop column bank_phone;
    
    --칼럼의 이름변경
    --alter table 테이블 rename column 기본칼럼명 to 신규칼럼명;
    --1.customer 테이블의 phone칼럼명을 contack으로 수정한다.
    alter table customer rename column phone to contact;
    
        --테이블 변경
    --ALTER 테이블이 기본
--    
--    ALTER TABLE BANK ADD CONSTRAINT BANK_PK PRIMARY KEY (BANK_CODE);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_PK PRIMARY KEY(NO);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_UQ UNIQUE (PHONE);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_CK CHECK(AGE BETWEEN 0 AND 100);
--    ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_BANK_FK FOREIGN KEY(BANK_CODE) REFERENCES BANK(BANK_CODE);
    