--2021.12.23(목)10:11수업-2022.1.06(목)01:10

/***************************
1. Create: webdb계정에 book테이블 만들기
****************************/ 
--공통 방식: 개발자컴퓨터로 쿼리문 작성->ctrl+enter: Oracle안에 있는 webdb에 날려 table book을 생성함.
create table book ( --괄호 안에는 내가 정한 이름을 씀. 함수같은 게, 구별 시에는 콤마(,)를 사용함.
    book_id number(5),
    title VARCHAR2(50),
    author varchar2(10),
    pub_date date
    );