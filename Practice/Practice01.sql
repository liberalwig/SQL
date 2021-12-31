/*Practice01/2021.12.16(목)*/

--문제1 미
select first_name as 이름,
        last_name as 이름,
        salary as 월급,
        phone_number as 전화번호,
        hire_date as 입사일,
from employees
order by hire_date asc;

--문제2 미
select
from employees
order by salary desc;
 
--문제3 미
select first_name,
        manager_id,
        commission_rate,
        salary;
from employees
where commission_pct is null and manager_id is null and salary >3000;
 
--문제4 미
select job_title,
        max_salary desc
from employees
where max_salary > 10000;
 
--문제5: Done
select first_name,
        salary,
        nvl(commission_pct, 0)
from employees
where salary between 10000 and 14000
order by salary desc;

--문제6: Done
select first_name,
        salary,
to_char(hire_date, 'YYYY-MM')
from employees
where department_id in(10,90,100);
 
--문제7: Done
select first_name,
        salary
from employees
where first_name like '%S%' or first_name like '%s%'; --first_name like 두 번째여도 써줘야 함

--문제8 미
select department_id

order by department_id ;

--문제9 미
select country_name;


--문제10 미
select first_name,
        salary,
        replace(phone_number, '.', '-'),
        hire_date
from employees
where 




