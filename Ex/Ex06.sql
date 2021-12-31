--2021.12.20(월)수업-2021.12.31(금)16:20-23:04/EQUIjoin, LeftRightFullOuterJoin, SelfJoin

/*EQUI Join[등가 join]: employees테이블에 departments테이블의 일부를 가져오고 싶을 경우 
<1>양 테이블 모두에 있는 row에만 적용 가능-null값이 있는 시엔 가져올 수 없음
<2>'=' 로 겹치는 컬럼을 매개로 두 테이블을 이어줌
*/
select first_name f_name,
        salary,
        de.department_id, --어느 de_id인지 모르니까 맨 앞에 em인지 de인지 특정해줄 것. de든 em이든 같을 것이므로 결과는 동일
        de.department_name
from employees em, departments de--from란이 먼저 취급됨, 따라서 select을 from 위에 놓고 본다 하더라도 select에 넣는 de들은 앞에 특정해 줘야 함
where em.department_id = de.department_id; --컬럼명이 같다고 해서 늘 같은 정보값을 넣은 컬럼인 건 아니므로 주의.null값1개빠짐

select first_name,
        salary,
        department_id
from employees;

select *
from departments;

--[예제]  모든 직원이름, 부서이름, 업무명 을 출력하세요
select em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.employee_id = de.employee_id
and em.job_id = jo.job_id;

/*OUTER Join
: Left Join, Right Join, Full Join: null값이 있어서 누락이 있는 걸 방지하기 위해, EQUI대신 쓰기 위해 한 테이블을 기준 삼는 join문. 예를 들어 부서 없는 직원 누락되니까.
','을 빼고+'where'을 빼고 'on'을 붙임 좌측에 있는 테이블을 기준으로 작업해주세요: left outer join/우측에 있는 테이블을 기준으로 작업해주세요: right outer join */
--Left Outer Join
select em.first_name,
        em.salary,
        em.department_id,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

--null값이 있는지를 확인하기 위해서로 체크해둠: KimberelyGrant 1개가 null이구나
select *
from employees em
where em.department_id is null;

select *
from employees em, departments de
where em.department_id = de.department_id(+)
and de.department_id is null;

--위와 동일한데 where문으로 작성: on대신 where, where절에서는 부족한 걸 채우는 쪽에 (+)추가. 이 하위는 오라클에서만 적용됨."이쪽은 null이 있더라도 더해주세요"
select em.first_name,
        em.salary,
        em.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id(+);


--Right Outer Join: 그 부서에 해당하는 사람 정보가 없음에도 존재하는 부서를 기준으로 소환정렬. 예를 들어 부서는 과거에 존재했지만 이제 거기에 해당하는 직원은 없는 경우 history를 남기는 경우.
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

select em.first_name,
        em.salary,
        em.department_id,
        de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id;

--Right Outer Join=>Left Outer Join
--Right Outer Join을 상대적으로 사람들이 편하게 생각하는 Left Outer Join으로 바꿔보기. 결과는 당연히 같겠으나 순서를 바꿔줘서 편하게 하기.
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from departments de left outer join employees em
on em.department_id = de.department_id;

select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where de.department_id = em.department_id(+);


--Full Outer Join: department_id가 null인 Kimberely도 넣고 싶을 경우 양쪽을 다 기준 삼을 수 있음. 부서/부서명 없어도 모든 부서/부서명 표현하고 싶은 경우.
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em full outer join departments de 
on em.department_id = de.department_id --양 항 모두에 (+)를 쓰는 문법은 존재 안 함.
order by de.department_id asc;


--Self Join: employees테이블, departments테이블 join문과 비교. Self Join문이야말로 테이블 별명alias이 없으면 안됨.
--employee_id와 manager_id가 같은 경우가 있다. 어떤 직원은 누군가의 매니저일 수 있으므로
--<1>매니저의 이름, 휴대폰번호, 이메일을 나타내고 싶다
/*select *
from employees em, employees em;이 경우 당연히 오류 가 남. 같은 테이블이더라도 이름을 달리해서 다른 테이블화하여 메모리에 올리는 작업 요망.*/

select em.employee_id, --참고로 관계형데이터베이스에서 self-join이 아니면서 양측에 같은 컬럼이 두 번 있는 건 원칙적으론 좋지 못한 설계임
        em.first_name,
        em.salary,
        em.phone_number,
        em.manager_id,
        man.employee_id,
        man.first_name, --자기 매너저의 이름: 이 회사에서 매니저는 18명이구나
        man.phone_number,
        man.email
from employees em, employees man
where em.manager_id = man.employee_id;

--아무 상관 없는 급여와 location_id가 동일할 경우라 할 지라도, 급여가 3100인데 location_id가 3100이면 아래처럼 출력이 됨.
select em.employee_id,
        em.first_name,
        em.salary,
        lo.location_id,
        lo.city
from employees em, locations lo
where em.salary = lo.location_id;
