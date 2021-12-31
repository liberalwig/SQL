--2021.12.30(월)15:12-2021.12.31(금)23:05/SingleRow SubQuery

--SubQuery: 
--[예제]‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
select salary --우선 Den에 대한 정보를 얻자.
from employees
where first_name = 'Den';

select first_name, --Den의 salary가 11000인 걸 위에서 알았으므로 where절에 변화를 줘서 아래처럼 구해냄.
        salary
from employees
where salary >= 11000;

select first_name,--그러나 위처럼 질문이 두 개가 되지 않고 한 번에 마치기 위해 아래를 배움+Den의 salary인 11000이 변화할 수 있으므로 기준을 Den삼아 한 번에 해내야 함
        salary,
        phone_number,
        department_id
from employees
where salary > (select salary --salary이외의 부가정보가 있을 필요는 없음
                from employees 
                where first_name = 'Den'); --11000에 해당하는 Query문 모두를 넣으면 작동함. 헷갈리지 않게 정렬 잘하기.

--[예제] 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary) 
                from employees);
                

--[예제]  평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
select first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);
                
                
