--Practice06: 2022.01.09(일)19:38

--1. author table 생성
create table author(
    author_id number(10) primary key,
    author_name varchar2(100) not null,
    author_desc varchar2(500)
    );

--2. book table 생성
create table book(
    book_id number(5),
    title varchar2(50),
    pubs varchar2(20),
    pub_date date,
    author_id number(5),
    primary key(book_id), --pk로 사용할 컬럼 지정
    constraint book_fk foreign key(author_id) --book의 fk인 author_id를 
    references author(author_id) --author의 pk인 author_id와 연결시킨다.
);

--3.author의 pk sequence 생성
create sequence seq_author_id 
increment by 1 
start with 1  
nocache;


--4. author 테이블에 값 입력(이문열/박경리/유시민/기안84/강풀/김영하)
insert into author
values(seq_author_id.nextval,'이문열','경북 영양');

insert into author
values(seq_author_id.nextval,'박경리','경상남도 통영');

insert into author
values(seq_author_id.nextval,'유시민','17대 국회의원');

insert into author
values(seq_author_id.nextval,'기안 84','기안동 84년생');

insert into author
values(seq_author_id.nextval,'강풀','온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval,'김영하','알쓸신잡');



--5. book의 pk sequence 생성
create sequence seq_book_id
increment by 1
start with 1
nocache;



--6. book 테이블에 값 입력(영웅/삼국지/토지/유시민글쓰기/패션왕/순정만화/오직두사람/26년)
insert into book
values(seq_book_id.nextval,'우리들의 일그러진 영웅','다림','1998/02/22',1);

insert into book
values(seq_book_id.nextval,'삼국지','민음사','2002/03/01',1);

insert into book
values(seq_book_id.nextval,'토지','마로니에북스','2012/08/15',2);

insert into book
values(seq_book_id.nextval,'유시민의 글쓰기 특강','생각의 길','2015/04/01',3);

insert into book
values(seq_book_id.nextval,'패션왕','중앙북스(books)','2012/02/22',4);

insert into book
values(seq_book_id.nextval,'순정만화','재미주의','2011/08/03',5);

insert into book
values(seq_book_id.nextval,'오직 두 사람','문학동네','2017/05/04',6);

insert into book
values(seq_book_id.nextval,'26년','재미주의','2012/02/04',5);

--7. author 테이블과 book 테이블 join
select  bk.book_id,
        bk.title,
        bk.pubs,
        bk.pub_date,
        ath.author_id,
        ath.author_name,
        ath.author_desc
from book bk, author ath
where bk.author_id = ath.author_id;

--8. table 저장
commit;

--9. book table 삭제
drop table book;
drop sequence seq_book_id;

--10. author table 삭제
drop table author;
drop sequence seq_author_id;

--11. 확인
select * from author;
select * from book;

--12. 커밋한 곳으로 돌아가는 rollback
rollback;