--2021.12.16(목)15:32 그룹함수--

--오류: 107개와 1개를 함께 표현해줄 수 없다는 문제가 있다
select avg(salary), first_name 
from employees;

--그룹함수_avg():
select round(avg(salary), 2)
from employees;

--그룹함수_count()
select count(*), --*을 쓴다는 건, null값의 테이블도 포함시켜 전체 row갯수를 구한다는 것
        count(commission_pct), --컬럼명을 쓴다는 건, 유효한 것만 포함시킨다는 것
        count(department_id)
from employees;

select count(*) --줄줄이 데이터가 궁금했다면 select 다음에 *만 놓았겠지
from employees
where salary > 16000;

--부서번호가 100번인 사람의 갯수
select count(*)
from employees
where department_id = 100;

--그룹함수_sum()
select sum (salary), count(*), avg(salary)
from employees
where salary > 16000;

select sum (salary), count(*), avg(salary)
from employees;

--그룹함수 avg(): null은 항상 조심하자. 일지매 예시 참고하기.
select count (*),
        sum(salary),
        sum(salary),
        avg(salary)
from employees;

select count(*),
        sum(salary),
        avg(nvl(salary), 0)
from employees;

--그룹함수_max()/min()
select * count(*)
from employees;

select count(*),
        max(salary),
        min(salary)
from employees;

/************
*groub by절
************/
select avg(salary),department_id
from employees
group by department_id;
