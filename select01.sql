1. 조회 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;

select * from dept;
* : 전체 ALL

테이블 구조 확인 (describe)
DESC 테이블명;

조회 데이터 리터럴 활용
SELECT '문자', 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 as "컬럼별칭",
        컬럼명 "컬럼별칭",
        컬럼명 컬럼별칭
FROM 테이블명;


select * from dept; --dept 테이블에 있는 모든 컬럼을 조회

select * from dept2;

select * from emp;

select mgr, sal from emp; -- emp 테이블에서 mrg, sal 컬럼을 조회

--가독성
SELECT *
FROM emp;

SELECT empno,
        ename,
        job
FROM emp;

DESC emp; --emp 테이블의 구조를 보여달라

SELECT empno, ename, '그냥문자',999 FROM emp;

SELECT  '그냥''문자"',999, q'[여기안에다가 1203'aksjd'dkkd]' FROM emp;

SELECT ename AS "이름",
        empno "사번", 
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급"
FROM emp;

-----------

중복값 제거
DISTINCT

|| 연결 연산자


select * from emp;

select DISTINCT job 
from emp; --job 중복제거 조회

select DISTINCT deptno 
from emp;

select DISTINCT (deptno) 
from emp;

select DISTINCT deptno, job
from emp;

SELECT '나는' || '배가고프다' FROM dept;

select DEPTNO || DNAME AS "부서번호이름",
        DEPTNO || DNAME  "부서번호이름",
        DEPTNO || DNAME 부서번호이름
from dept;

select DEPTNO+10,
    DEPTNO+20,
    DEPTNO+30
from dept;

select DEPTNO+ DEPTNO+DEPTNO
from dept;

SELECT name|| '''s ID : ' || id || ',weight is ' || weight || 'kg' AS "ID AND WEIGHT"
FROM student;

SELECT ename || '(' || job || ')' || ename || '''' || job || '''' AS "NAME AND JOB"
FROM emp;

SELECT ename || '''s sal is $' || sal  AS "NAME AND SAL"
FROM emp;

---------

WHERE  조건
찾고 싶은 조건(결과 필터링)

SELECT ..
FROM ..
WHERE ..

select * 
from emp; --comm 성과급

--성과급 지급 대상인 사람들만 
select * 
from emp
where comm is not null; 

select distinct deptno  from emp;

--부서번호 20번에 속한 사람들만
select * 
from emp
where deptno = 20; 

--부서번호 20번에 속한 사람들 이름과 급여
select ename, sal
from emp
where deptno = 20; 

--emp테이블 급여가 2000보다 적게 받는 사람들
select *
from emp
where sal < 2000; 


--emp테이블 직업이 CLERK 인 사람들만
select *
from emp
where JOB ='CLERK';

--emp테이블 직업이 CLERK 이 아닌 사람들만
select *
from emp
where JOB <>'CLERK';
--where JOB != 'CLERK';

--emp테이블 급여가 2000~ 3000인 사람들만
select *
from emp
where sal >= 2000 AND sal <=3000;

--student 테이블에서 1학년과 3학년만 조회 (1 or 3)
select *
from student
--where grade 1 or grade =3;
where grade IN(1,3);

--student 테이블에서 1학년과 3학년만 제외하고 조회 
select *
from student
--where grade IN(2,4);
where grade NOT IN(1,3);
-- where grade <> 1 and grade != 3;

--------
LIKE 패턴 검색
    LIKE
        % _
        % : 아무거나 아무갯수 0~n개
        _ : 그 위치에 한 개
        
select * 
from emp 
where ename LIKE '%MI%'; -- ~MI MI~ ~MI~
--where ename LIKE 'MI%;' -- MIND MOM MOUNTAIN
--where ename = 'WARD';

select * 
from emp 
where ename LIKE '_MI'; -- 3글자 2~3번쨰가 MI
where ename LIKE '_MI__'; -- 5글자 2~3번쨰가 MI
where ename LIKE '_MI%'; -- N개~글자수 2~3번쨰가 MI

-- <  <= > >=

select *
FROM emp
--WHERE hiredate < '1981-05-01' ; --과거
WHERE hiredate > '1981-05-01' ; --미래
--WHERE hiredate = '81/05/01' ;

--날짜에서 큰 수는? 더 최근 / 미래 , 작은수? 더 과거

SELECT *
FROM student;

-------------
 정렬 ORDER BY
 *정렬을 사용하지 않으면 순서보장 x
 
 SELECT ...
 FROM ...
 WHERE...
 ORDER BY ...
 
 SELECT ...
 FROM ...
 ORDER BY ...
 ;
 
 select * 
 from student 
 ORDER BY name; --name 기준 오름차순 정렬 (기본)
 
 select * 
 from student 
 ORDER BY name DESC; --name 기준 내림차순 정렬
 
 select * 
 from student 
 ORDER BY grade DESC; 
 
select * 
 from student 
 ORDER BY birthday; 
 
select * 
 from student 
 ORDER BY birthday DESC; 
 
select * 
from student 
where grade IN(1,2,3) --1,2,3학년만
order by grade,  height DESC; -- 학년 오름차순, 키 내림차순 정렬

select * 
from student 
where grade IN(1,2,3) --1,2,3학년만
order by 2,1;

--emp 테이블 사전기준 이름순 정렬.

SELECT *
FROM emp 
ORDER BY ename;


--emp 테이블 부서번호 별 정렬 + 급여가 높은 순서대로
SELECT *
FROM emp
ORDER BY deptno, sal desc;

--emp 급여가 2000이 넘는 사람들 중 급여가 높은 순서대로
SELECT *
FROM emp
WHERE sal >= 2000
ORDER BY sal desc;

--student 테이블 1학년을 제외하고, 나이가 어린순서대로
SELECT *
FROM student
WHERE grade NOT IN (1)
ORDER BY birthday desc;

-------------
집합 연산자
UNION 합집합(중복제거)
UNION ALL 합집합(중복x)
INTERSECT 교집합
MINUS 차집합

    조건 (제약)
        1. 컬럼 갯수 동일
        2. 컬럼 데이터형 동일
        3. 컬럼명은 상관없음

--학생들 중에 101번 학과 학생들과 102번 학과 학생들 조회
select *
from student
where deptno1 IN (101, 102);

select *
from student
where deptno1 =101
UNION ALL
select *
from student
where deptno1=102;

-- 각 테이블 조회 결과 갯수/ 타입이 일치하는 형태로 만들어서 결합
select studno, name, deptno1 -- 숫자 / 문자 / 숫자 3개
from student
where deptno1 =101
UNION ALL
select profno, name, deptno -- 숫자 / 문자 / 숫자 3개
from professor
where deptno=101;

select studno, name, deptno1 -- 숫자 / 문자 / 숫자 3개
from student
where deptno1 =101
UNION ALL
select profno, name, 0 -- 숫자 / 문자 / 숫자(인위적으로 숫자형태 갯수 맞추기) 3개
from professor
where deptno=101;

--select studno, name, deptno1, null -- 숫자 / 문자 / 숫자 / 문자(인위적으로 숫자형태 갯수 맞추기) 4개
select studno idno, name, deptno1 deptno, '' email -- 숫자 / 문자 / 숫자 / 문자(인위적으로 숫자형태 갯수 맞추기) 4개
from student
where deptno1 =101
UNION ALL
select profno, name, deptno, email -- 숫자 / 문자 / 숫자 / 문자 4개
from professor;

select studno, name, deptno1, '학생' divtype-- 숫자 / 문자 / 숫자 3개
from student
where deptno1 =101
UNION ALL
select profno, name, deptno, '교수' -- 숫자 / 문자 / 숫자 3개
from professor
where deptno=101;

select studno, name, deptno1, 'STD' divtype-- 숫자 / 문자 / 숫자 3개
from student
where deptno1 =101
UNION ALL
select profno, name, deptno, 'PRF' -- 숫자 / 문자 / 숫자 3개
from professor
where deptno=101;

select studno, name, deptno1, 1 divtype-- 숫자 / 문자 / 숫자 3개
from student
where deptno1 =101
UNION ALL
select profno, name, deptno, 2 -- 숫자 / 문자 / 숫자 3개
from professor
where deptno=101;

select *
from student
where deptno1 =101
INTERSECT
select *
from student
where deptno2 = 201;


select *
from student
where deptno1 =101 AND deptno2 = 201;


select *
from emp
where job = 'SALESMAN' AND comm > 400;
MINUS 
select *
from emp --그동안 포상받은 직원목록  emp_cele
where hiredate < '1982-01-01';






