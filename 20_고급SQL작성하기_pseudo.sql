--시퀀스
--일련번호 생성객체
--주로 기본키(임의로 만든키,인공키)
--currval : 시퀀스가 생성해서 사용할 번호
--nextval : 시퀀스가 생성해야 할 다음번호
--시퀀스 생성
/*create sequence employee_seq
increment by 1 --1씩 번호증가
start with 1000 --시작번호 1000
nomaxvalue --최대값없음
nominvalue --최소값없음
nocycle --번호 순환이 없다.
nocache; --메모리에 캐시 x 항상유지
*/
--employee3테이블에 행삽입
--emp_no는 시퀀스로 입력
insert into employee3(emp_no,name,depart,position,gender,hire_date,salary) values (employee_seq.nextval ,'구창민' , 1 , '과장','M','98-05-01',5000000);

select employee_seq.currval 
    from dual;
    
    select *
    from user_sequences;
    
--rownum = 가상 행번호
--rowId = 데이터가 저장된 물리적 위치정보

select rownum
    , rowid
    , emp_no
    ,name
from employee;
-- 최고 빠른검색은 rowid를 이용
select emp_no
    ,name
 from employee
where rowid='AAAE/6AABAAALCxAAA';--오라클의 방식
    

select emp_no
    ,name
 from employee
where emp_no=1003;

--rownum의 where절 주의
--1을 포함하는 검색만 가능 1,2/1/,1,2,3,4/가능
--2,3,4,5안됨. 1을 포함해야함 
--순서대로 몇 건을 추출하기 위한 목적
select
     emp_no
    ,name
  from employee
 where rownum between 1 and 3;
 --모든 rownum을 사용하기위해서는
 --rownum 에 별명주고 사용해야함.

select rownum as rn
    ,emp_no
    ,name
from employee --실행순서가 from -where -select순이므로 별명이 인식이안댐.
where rn=1;

select e.emp_no
    , e.name
from (select rownum as rn
        , emp_no
        ,name
        from employee) e
    where e.rn =2;
-- 연습문제
-- 1. 다음 테이블을 생성한다.
-- 게시판(글번호, 글제목, 글내용, 글작성자, 작성일자)
-- 회원(회원번호, 아이디, 이름, 가입일자)
DROP TABLE BOARD;
DROP TABLE MEMBERS;

CREATE TABLE BOARD
(
    BOARD_NO NUMBER,
    BOARD_TITLE VARCHAR2(1000),
    BOARD_CONTENT VARCHAR2(4000),
    MEMBER_ID VARCHAR2(30),
    BOARD_DATE DATE
);

CREATE TABLE MEMBERS
(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(30) NOT NULL UNIQUE,
    MEMBER_NAME VARCHAR2(30),
    MEMBER_DATE DATE
);


-- 2. 각 테이블에서 사용할 시퀀스를 생성한다.
-- 게시판시퀀스(1~무제한)
-- 회원시퀀스(100000~999999)
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 100000 MAXVALUE 999999 NOCYCLE NOCACHE;

-- 3. 각 테이블에 적절한 기본키, 외래키, 데이터(5개)를 추가한다.
ALTER TABLE MEMBER ADD CONSTRAINT MEMBERS_PK PRIMARY KEY(MEMBER_NO);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY(BOARD_NO);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_MEMBER_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID);

INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'admin', '관리자', '21/04/01');
INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'tokyo', '도쿄', '21/04/02');
INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'toronto', '토론토', '21/04/03');
INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'tomato', '토마토', '21/04/04');
INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'racer', '레이서', '21/04/05');
INSERT INTO MEMBERS(MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_DATE) VALUES
    (MEMBER_SEQ.NEXTVAL, 'bayaba', '바야바', '21/04/06');

INSERT INTO BOARD(BOARD_NO, BOARD_TITLE, BOARD_CONTENT, MEMBER_ID, BOARD_DATE) VALUES
    (BOARD_SEQ.NEXTVAL, '공지사항', '공지입니다.', 'admin', SYSDATE);
INSERT INTO BOARD(BOARD_NO, BOARD_TITLE, BOARD_CONTENT, MEMBER_ID, BOARD_DATE) VALUES
    (BOARD_SEQ.NEXTVAL, '출석', '출석입니다.', 'bayaba', '21/04/05');
INSERT INTO BOARD(BOARD_NO, BOARD_TITLE, BOARD_CONTENT, MEMBER_ID, BOARD_DATE) VALUES
    (BOARD_SEQ.NEXTVAL, '질문입니다', '여기가 차붐의 나라입니까?', 'tomato', '21/04/06');
INSERT INTO BOARD(BOARD_NO, BOARD_TITLE, BOARD_CONTENT, MEMBER_ID, BOARD_DATE) VALUES
    (BOARD_SEQ.NEXTVAL, '협조', '재활용은 화목일입니다.', 'admin', SYSDATE);
INSERT INTO BOARD(BOARD_NO, BOARD_TITLE, BOARD_CONTENT, MEMBER_ID, BOARD_DATE) VALUES
    (BOARD_SEQ.NEXTVAL, '[필독]건의', '매일 아침마다 차가 너무 밀립니다.', 'racer', '21/04/07');

COMMIT;

SELECT * FROM BOARD;
SELECT * FROM MEMBERS;

-- 4. 게시판을 글제목의 가나다순으로 정렬하고 첫 번째 글을 조회한다.
SELECT b.board_no
     , b.board_title
     , b.board_content
     , b.member_id
     , b.board_date
  FROM (SELECT board_no
             , board_title
             , board_content
             , member_id
             , board_date
          FROM board
         ORDER BY board_title) b
 WHERE ROWNUM = 1;

-- 5. 게시판을 글번호의 가나다순으로 정렬하고 1 ~ 3번째 글을 조회한다.
SELECT b.board_no
     , b.board_title
     , b.board_content
     , b.member_id
     , b.board_date
  FROM (SELECT board_no
             , board_title
             , board_content
             , member_id
             , board_date
          FROM board
         ORDER BY board_no) b
 WHERE ROWNUM <= 3;

-- 6. 게시판을 최근 작성일자순으로 정렬하고 3 ~ 5번째 글을 조회한다.
SELECT a.*
  FROM (SELECT b.board_no
             , b.board_title
             , b.board_content
             , b.member_id
             , b.board_date
             , ROWNUM AS rn
          FROM (SELECT board_no
                     , board_title
                     , board_content
                     , member_id
                     , board_date
                  FROM board
                 ORDER BY board_date DESC) b) a
 WHERE a.rn BETWEEN 3 AND 5;

        


-- 7 가장 먼저 가입한 회원 조회
select
     m.member_no
    ,m.member_id
    ,m.member_name
    ,m.member_date
    from (select member_no
                ,member_id
                ,member_name
                ,member_date
                from members
            order by member_date desc) m
where rownum =1;
-- 8 3번째로 가입한 회원을 조회
select
    m2.member_no
    ,m2.member_id
    ,m2.member_name
    ,m2.member_date
    from(select member_no
                ,member_id
                ,member_name
                ,member_date
                ,rownum as rn
            from (select 
                      member_no
                     ,member_id
                     ,member_name
                    ,member_date
                    from members
                order by member_date) m1)m2--정렬 ,번호
    where m2.rn=3;



-- 9 가장 나중에 가입한 회원조회