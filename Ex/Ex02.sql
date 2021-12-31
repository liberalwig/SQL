/*2021.12.16(목)10:32 단일행 함수*/ 
--문자 함수 INITCAP(컬럼명)
select email,
        initcap(email) "Email2",
        department_id
from employees
where department_id =100;

--문자함수: Lower(컬럼명)/Upper(컬럼명)
select    first_name l_first_name,
    lower(first_name) u_first_name,
    upper(first_name)
from employees
where department_id = 100;

--문자함수: Substr(컬럼명, 시작위치, 글자수)
select first_name,
        substr(first_name, 2,3),
        substr(first_name, -3,2)
from employees
where department_id = 100;

--문자함수 -Lpad(컬럼명, 자리수, '채울 문자')/Rpad(
select  first_name,
        lpad(first_name, 7, '*'),
        rpad(first_name, 10, '*')
from    employees;

--문자함수 Replace(컬럼명, 문자1, 문자2)/글자수가 초과되어도 무방하며 특정문자를 내가 정한 특정문자열로 바꿔줄 뿐
select first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

--숫자함수: Round(숫자, 출력을 원하는 자리수): 반올림
select round (123.346, 2)"r2", --컬럼명을 소문자로 적기 위해서는 ""을 r2바깥에 씌워주자 
        round (123.845, 0) "r0",
        round (128.656, -1) "r-1"
from dual; --가상의 테이블개념인 dual을 쓸 수 있다

--숫자함수: Trun(숫자, 출력을 원하는 자리수): 버림
select trunc(123.348, 2)"r2",
        trunc(123.346, 0)"r0",
        trunc(129.456, -1)"r-1"
from dual;

--날짜함수: Sysdate()
select sysdate
from dual;

select sysdate,
        hire_date,
        months_between(sysdate, hire_date),
        trunc(months_between(sysdate, hire_date), 0)
from employees
where department_id = 100;

--To_char(숫자, 출력 모양): 숫자->문자열
select first_name,
        salary,
        salary*12, --본급여에 달러 단위를 붙이고 싶을 경우엔 금액을 문자열로 전환한 후에 달러표시를 덧붙임
        to_char(salary*12, '99999'),
        to_char(salary*12, '00000099999'),--자리수를 맞추되 빈 자리는 0으로 채워라
        to_char(salary*12, '$999999'),
        to_char(salary*12, '999999.99'),
        to_char(salary*12, '999,999'),
        to_char(salary*12, '999,999,999')
from employees
where department_id = 100;

--변환함수: to_char(날짜, '출력모양'): 날짜->문자형으로 변환하기
select sysdate,
    to_char(sysdate, 'DD'),
    hire_date,
    to_char(hire_date, 'YYYY')
from employees;

select sysdate,
        to_char(sysdate),
        to_char(sysdate, 'YYYY"년"-MM"월"-DD"일"-(DY) HH24:MI:SS'),
        
        to_char(sysdate, 'MM-DD-YYYY'),
        to_char(sysdate, 'HH'),
        to_char(sysdate, 'MI'), --달을 가리키는 MM아님 숙지
        to_char(sysdate, 'SS')
from dual;

--일반함수_NVL(컬럼명, null일 때 값)/NV:내가 이 커리문 쓸 때만 null을 0으로 바꾸고 자료를 바꾸지는 않는다
select  first_name,
        commission_pct,
        nvl(commission_pct, 0),
        NVL2(commission_pct, 100, 0)
from employees;


select *
from departments;

select *
from employees;

select









