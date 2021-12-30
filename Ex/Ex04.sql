--2021.12.17(금)10:02수업-2021.12.30(목)10:02(스트림 기술로 개발자컴퓨터와-오라클을 연결함. 쓰레드 기술이 없다면 다른 개발자는 접속을 못 함
-- Group by절
select department_id, avg(salary)
from employees --<1>자동완성이 안 될 땐 ;가 중간에 있지 않나 살피기 <2>블록지정하면 한 부분에 대한 결과값만 볼 수 있음
group by department_id --"department_id로 그룹을 지어줘"
order by department_id; --order by는 에너지가 많이 드는 작업이므로 불필요할 시 안 쓰는 게 좋음

select department_id, count(*), avg(salary) --숫자가 아닌 문자열 job_id를 여기에 쓰면 그룹번호와 일치 안 하므로 오류남
from employees
group by department_id;


--아래는 department_id로 먼저 그룹 짓고 그 다음에 job_id로 그룹지으라는 뜻
select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id;

select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id --group by를 안 쓰고 order by만 쓰니까 안 나옴.
order by department_id asc, job_id desc; --이렇게 de는 오름차순으로 먼저 하고 다음 jo은 내림차순으로가 가능

--where절에는 그룹함수를 쓸 수 없다. '얼마 이상'이런 건 되는데 '연봉의 합계가 얼마 이상'이런 함수는 불가능함
--이에 대한 해결책은 바로 밑의 having절
--[예제]  연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
--개인 누구가 얼마 받는진 안 중요하고 저 부서가 얼마 받는지가 중요하므로 grby de가 생각 나야해
select department_id, count(*)/*얘네가 몇 명인지*/, sum(salary)
from employees
where salary > 20000 
group by department_id;

--Having절: 그룹함수 전용 절
select department_id, count(*), sum(salary)
from employees 
group by department_id
having sum(salary) >= 20000 --where절과 having절같은 조건은 ','로 안 쓰고 'and'나 'or'
and  department_id = 100;
--from/where/group by/having/select/order by을 이 순서로 잘 운용해야 하고 java에서 합 구하려 하고 그러면 안됨


--Case~End문: 간단한if문 형식
select employee_id,
        first_name,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1        
            when job_id = 'SA_REP' then salary + salary * 0.2
            when job_id = 'ST_CLERK' then salary + salary * 0.3
        end bonus --컬럼명을 쓰는 란
from employees;

/*[예제]  직원의 이름, 부서, 팀을 출력하세요. 팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’, 
60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요. */
select first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
        when department_id >= 60 and department_id <= 100 then 'B-TEAM'
        when department_id >= 110 and department_id <= 150 then 'C-TEAM'
        else '팀없음'
        end as team
from employees;

