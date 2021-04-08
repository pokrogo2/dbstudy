--인덱스

--빠른 검색을 위해서 특정 칼럼에 설정하는 색인
--검색속도가 높아지지만 ,삽입/갱신/삭제 등 변화가생길시 갱신때메 성능하락
--기본키pk와 unique칼럼은 자동으로 인덱스설정

--고유인덱스
--department 테이블 dept_name칼럼에 고유인덱스 idx_name설정
create unique index idx_dept_name on department(dept_name);

--비고유 인덱스 생성(인덱스 부착 칼럼에 중복을 허용)
--employee테이블 name칼럼에 비고유 인덱스 idx_name을 설정
create index idx_name on employee(name);

--인덱스 조회
--사용자가 작성한 인덱스 목록:
desc user_indexes;

select index_name,uniqueness
    from user_indexes
    where table_name='DEPARTMENT';

select index_name,uniqueness
    from user_indexes
    where table_name='EMPLOYEE';
--인덱스 삭제
drop index idx_dept_name;
drop index idx_name;