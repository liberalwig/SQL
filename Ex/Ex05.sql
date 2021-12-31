--2021.12.17(목)13:46수업-2021.12.30(목)12:15-15:20-20:00/2021.12.31(금)15:10
--join문 

--사원 이름
select employee_id,
        first_name,
        department_id
from employees;

--겹치는 게 없는 아이덴티티 증명해주는 고유한 걸 PK라고 보면 돼
--포린키? F키. column은 11개, row는 107개
select *
from employees;

select *
from departments;

select *
from employees, departments;

--join문 본격
select employees.employee_id,
        first_name, --겹치지 않으므로 'em.first_name'이라 써도 됨. 통일만 잘해줄 것.
        salary,
        department_name,
from employees, departments --from엔 이름 짓기용인 as 쓰면 안됨. 그냥 바로 em, de 이렇게 쓸 것.
where employees.department_id = departments.department_id;--null이 있는 1개의 건이 소거됨

--[예제]  모든 직원이름, 부서이름, 업무명 을 출력하세요
select *
from departements;

select em.first_name, --from에 그냥 em, de, jo를 넣는다면 count해보면 54891이 나올 만큼 잘못됐다는 것임
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
order by em.first_name asc;

--(de)카디전 프로덕트: 곱하기. 대부분 우리가 원하는 결과값이 아닐 가능성 큼.





