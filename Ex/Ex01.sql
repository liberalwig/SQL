//2021.12.15(수) 기본 select문과 단일행 함수: select/form절, where절, order by절, 단일행 함수

/*
select 문
  select 절
  from 절;
*/

--직원테이블 전체 조회
select * 
from employees;

--부서테이블 전체 조회
select * 
from departments;

--원하는 컬럼만 조회
select  employee_id,
        first_name, 
        last_name
from employees;

--예)
select first_name, phone_number, hire_date, salary
from employees;

select  first_name, 
        last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date
from employees;

--출력할 컬럼명 별명적용하기
select  employee_id as empNo,
        first_name as "f-name" ,
        salary as "연 봉"
from employees;

--예)
--as 생략가능
select  first_name as 이름,
        phone_number as 전화번호,
        hire_date as 입사일,
        salary as 급여
from employees;

select  employee_id as 사원번호,
        first_name as "이름",
        last_name as 성,
        salary as 급여,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name, last_name
from employees;

select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' 입사일은 ' || hire_date
from employees;


select first_name || ' ' || last_name name
from employees;


--산술 연산자 사용하기
select  first_name,
        salary as 월급,
        salary*12 as 연봉,
        (salary+300)*12
from employees;

--예) 글자에 12를 곱할 순 없다. 연산자는 숫자에만 적용할 수 있다.
select job_id*12
from employees;

select * from
employees;


--<오후수업>예
select first_name|| '-' ||last_name "성명",
        salary 급여,
        salary*12, 
        (salary*12) + 5000,
        phone_number
from employees;

/*where절 중 비교연산자 사용: 부서번호가 10인 사원의 이름을 구하시오*/
select first_name,
        last_name,
        salary, /*얘가 10번사원이라는 걸 검증하기 어려우므로 가급적 department_id붙임*/
        department_id
from employees
where department_id = 10;
 
--예제
-- 급여가 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name,
        last_name,
        salary
from employees
where salary >= 5000;

// 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name, last_name, hire_date
from employees /*년도/월/일의 순서는 대륙마다 다른데 설정이 가능함. 저장방식은 같고 표현법이 다름*/
where hire_date >= '07/01/01'; /*날짜는 숫자가 아니므로 따옴표 안에 넣어 처리*/

// 이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where first_name = 'Lex'; /*first_name as Lex라고 해서 오류 났음*/

//Done•연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary>=14000 and salary<=17000;

//between연산자로 특정구간 값 출력하기: 위 문제•연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select *
from employees
where salary between 14000 and 17000;

//Done 연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary<=14000 or salary>=17000;

//Done 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date>= '04/01/01' and hire_date<= '05/12/31';

--■ Like 연산자로 비슷한것들 모두 찾기
select first_name, salary
from employees
where first_name like 'L%';

-- 이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';


-- 이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name like '_a%';

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name, last_name
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name, last_name
from employees
where first_name like '__a_';

--■ IN 연산자로 여러 조건을 검사하기. 참고로 이 밑 둘은 일치한다. or는 (,)로 묶일 수 있음
select first_name, last_name, salary
from employees
where first_name = 'Neena' or first_name = 'Lex' or first_name = 'John';

select *
from employees
where first_name in ('Neena', 'Lex', 'John');

-- 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오. 이 밑은 혼자실험하니 일치함
select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name,salary
from employees
where salary = 2100 or salary = 3100 or salary = 4100 or salary = 5100;


/* NULL
• 아무런 값도 정해지지 않았음을 의미 (0이 아님)
• 어떠한 데이터타입에도 사용가능
• not null 이나 primary key 속성에는 사용할 수 없음
•null을 포함한 산술식은 null*/
--null을 곱하면 0이 되는 게 아니라 null이 나온다
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--is null/is not null. [예제] 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, commission_pct
from employees
where commission_pct is not null; /*commission_pct = null;로 입력하지 않도록 주의*/

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where commission_pct is null and manager_id is null;

--OrderBY절: sql developer가 정리해주는 게 아니라 오라클에 정리해달라고 하는 게 order by다
--[예제] 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요

select  department_id, salary, first_name
from employees
order by department_id asc;


-- 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary>=10000
order by salary desc;


-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터
부서번호 급여 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc; and order by salary desc;
