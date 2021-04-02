drop table lecture;
drop table enroll;
drop table student;
drop table course;
drop table professor;
create table professor(
    professor_no number primary key,
    professor_name varchar2(10),
    professor_lecture varchar2(10)
);
create table student(
    student_num number primary key,
    student_name varchar2(10),
    student_address varchar2(100),
    student_grade number,
    professor_no number references professor(professor_no)
);
create table course(
    coures_no number primary key,
    coures_name varchar2(10),
    coures_score number
);
create table enroll(
    enroll_no number primary key,
    student_no number references student(student_num),
    course_no number references course(coures_no),
    enroll_date date
);
create table lecture(
    lecture_no number,
    professor_no number references professor(professor_no),
    enroll_no number references enroll(enroll_no),
    lecture_name varchar2(10),
    lecture_room varchar2(15)
);
alter table lecture add constraint lecture_pk primary key (lecture_no);
insert into professor values (10,'교수1','java');
insert into professor values (20,'교수2','c');
insert into professor values (30,'교수3','c++');
insert into student values(10101,'james','qwer-asdf',3,10);
insert into student values(10202,'paka','jayees',4,20);
insert into student values(10303,'dopa','fate',5,30);
insert into course values(1,'lol',100);
insert into course values(2,'batground',95);
insert into course values(3,'overwatch',90);
insert into enroll values(100,10101,1,'2011-03-01');
insert into enroll values(200,10202,2,'2017-10-15');
insert into enroll values(300,10303,3,'2015-8-22');

insert into lecture values(9,10,100,'자바','미디어1');
insert into lecture values(8,20,200,'c','미디어2');
insert into lecture values(7,30,300,'c++','미디어3');