--2021.12.22(수)16:30_DCL
--2021.12.23(목)10:11수업-2022.1.06(목)01:10

/***************************
            DCL
****************************/ 
create user webdb identified by  1234; --계정 생성
grant resource connect to webdb; --계정 접속권한 부여
alter user webdb identified by webdb; --계정 비밀번호 변경
drop user webdb cascade; --계정 삭제
/***************************
            DDL
1. Create
: webdb계정에 book테이블 만들기
****************************/ 
--공통 방식: 개발자컴퓨터로 쿼리문 작성->ctrl+enter: Oracle안에 있는 webdb에 날려 table book을 생성함.
create table book ( --괄호 안에는 내가 정한 이름을 씀. 함수같은 게, 구별 시에는 콤마(,)를 사용함.
    book_id number(5),
    title VARCHAR2(50),
    author varchar2(10),
    pub_date date
    );
    
select * --이걸로 확인
from book;
    
/***************************
            DDL
2. Alter add
: 컬럼 추가
****************************/
--book테이블에 pubs 컬럼 추가
alter table book add(pubs varchar2(50));  

select *
from book;
    
/***************************
            DDL
3. Alter Modify, Alter Renmae, Alter Drop, Rename, Drop 
****************************/    
--book테이블 컬럼 속성 변경
alter table book modify(title varchar2(100));
alter table book rename column title to subject;

--컬럼 삭제
alter table book drop (author);

--테이블명 변경
rename book to article;

--테이블 삭제
drop table article;
    
/***************************
제약조건Constraints
****************************/    
--Not Null: null값 입력 불가하게 함

--Unique: 중복값 입력 불가하게 함. (null값은 허용함)

--Primary Key: Not Null + Unique. 데이터들의 유일성을 보장하는 컬럼에 설정함. 테이블당 1개만 설정 가능함.

--Foreign Key


--■ author 테이블 만들기
create table author (
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    
    primary key(author_id)
);
select * from author;
select * from all_tables; --옆을 출력하면 Owner컬럼맨마지막에 있는 webdb에 우리가 만든 게 있음

--■ book 테이블 만들기: PK와 FK
CREATE TABLE book (
    book_id NUMBER(10),
    title VARCHAR2(100) NOT NULL,
    pubs VARCHAR2(100),
    pub_date DATE,
    author_id NUMBER(10),

    PRIMARY KEY(book_id),
    CONSTRAINT book_fk FOREIGN KEY (author_id)
    REFERENCES author(author_id)
);


/***************************
            DML
1. Insert
****************************/    
--insert: 작가[author]테이블에 데이터 추가
1. 묵시적 방법
insert into author
values(1, 
    '박경리', 
    '<토지> 작가');

insert into author
values(3, '기안84', '웹툰 작가');

2. 명시적 방법
insert into author (author_id, author_name)
values(2, '이문열');

select * from author; 

--2021.12.23(목)13:36수업-2022.01.06(목)03:45
--update: 작가 테이블 정보 수정
--■ 조건을 만족하는 레코드를 변경
update author
set author_name = '김경리',
    author_desc = '<토지>작가'
where author_id = 1; --and,or 둘다 사용이 가능하며 where절은 PK값 넣으면 실수 없음

--delete: 작가 테이블 정보 삭제. 한 row전체를 삭제, row중 한 칼럼의 데이터를 삭제(=null값이 되게 함)하는 건 update임
--■ 조건을 만족하는 레코드를 삭제: where절 없음
delete from author;

delete from author --delete from author까지만 입력할 시 전체가 다 지워지니 주의
where author_id = 1;




--2021.12.23(목)14:00수업-2022.01.10(일)17:25
/***************************
            SEQUENCE
****************************/   
--은행 대기 번호표 출력 기계 만드는 회사처럼
create sequence seq_author_id
increment by 1 --몇 씩 올라갈 건가
start with 1 --몇에서 시작할 건가
nocache; --cache가 없어도 껐다 켜도 하나 씩 올라간다(?)

update author
set author_name = '이문열',
    author_desc = '<삼국지> 작가'
where author_id = 2; --and,or 둘다 사용이 가능하며 where절은 PK값 넣으면 실수 없음

update author
set author_name = '강풀'
    author_desc = '웹툰 작가'
where author_id = 3;

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회
select seq_author_id.nextval
from dual;

--시퀀스 삭제
drop sequence seq_author_id;


/***************************
        SYSDATE: 현재시간 입력
****************************/  
insert into board
values(1, '게시판 제목', '본문 내용', 'Sysdate);

