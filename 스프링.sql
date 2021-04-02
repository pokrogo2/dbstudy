--국가
create table nation
(
    nation_code number(3) ,
    nation_name varchar2(30),
    nation_rank number,
    nation_curr_rank number,
    nation_parti_person number,
    nation_parti_event number
    );
    --종목
create table event
(   
    event_code number(5),
    event_name varchar2(30),
    event_info varchar2(1000),
    event_first_year number(4)
    );
    --선수
create table player
(
    player_code number(5),
    nation_code number(3),
    event_code number(5),
    player_age number(3),
    player_rank number
    );
--일정
create table schedule
(
    nation_code number(3),
    event_code number(5),
    schedule_info varchar2(1000),
    schedule_begin date,
    schedule_end date
    );
    
alter table nation add constraint nation_pk primary key (nation_code);
alter table event add constraint event_pk primary key (event_code);
alter table player add constraint player_pk primary key(player_code);
alter table player add constraint player_event_fk foreign key (event_code)references event(event_code);
alter table player add constraint player_nation_fk foreign key (nation_code) references nation(nation_code);
alter table schedule add constraint schedule_nation_fk foreign key (nation_code) references nation(nation_code);
alter table schedule add constraint schedule_event_fk foreign key (event_code)references event(event_code);
alter table schedule add constraint schedule_pk primary key(nation_code,event_code);





--제약조건의 삭제
--alter table 테이블 drop constraint 조건;

alter table player drop constraint player_nation_fk;
alter table schedule drop constraint schedule_nation_fk;
alter table nation drop constraint nation_pk; --nation pk를 참고하는 외래키를 먼저지워야한다.
alter table player drop constraint player_event_fk;
alter table schedule drop constraint schedule_event_fk;

alter table event drop constraint event_pk; --event pk를 참조하는 외래키를 지워야함.

alter table player drop constraint player_pk;
alter table schedule drop constraint schedule_pk;

--제약조건의 확인
--제약조건을 저장하고있는 DD(DATA Dictionary):USER_CONSTRAINTS

DESC user_constraints;
select constraint_name,table_name from user_constraints;


select constraint_name,table_name from user_constraints where table_name='PLAYER';

--제약조건의 비 활성화


alter table player disable constraint player_nation_fk;
alter table player enable constraint player_nation_fk;









