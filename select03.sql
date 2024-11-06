--복수행 함수

COUNT(대상) 갯수

select count(*)
from emp;

select count(empno), count(*)
from emp;

select count(job), count(mgr), count(hiredate), count(comm) 
--select *
from emp;

SELECT count(*)
FROM emp
WHERE comm IS NOT NULL;

select SUM(sal), COUNT(*)
from emp;

--10번, 20번 부서 다니는애들 총 몇명? 총 급여 얼마?
select COUNT(*), SUM(sal)
from emp
WHERE deptno IN (10, 20);


select 
    AVG(height),
    MAX(height),
    MIN(height),
    STDDEV(height),
    VARIANCE(height)
    /*,
    height,
    NVL(height, 130)*/
from student;


--student 평균 키! 
--전체 평균키 X , 각 학년별 평균 키!


select AVG(height)
from student;

select '1학년' 학년, AVG(height) 평균키
from student
where grade=1
UNION ALL
select '2학년', AVG(height)
from student
where grade=2
UNION ALL
select '3학년', AVG(height)
from student
where grade=3
UNION ALL
select '4학년', AVG(height)
from student
where grade=4;


SELECT...
FROM...
WHERE...
GROUP BY
ORDER BY

--GROUP BY 특정 컬럼을 기준으로 그룹지어서 계산
--GROUP BY 에 명시된 컬럼은 같이 조회 가능
select grade, avg(height)
from student
group by grade;

select studno, avg(height)
from student
group by studno;


select grade, avg(height) height
from student
where grade IN (1,2,3)
group by grade
order by height;
--order by grade desc;



SELECT...
FROM...
WHERE...
GROUP BY
HAVING 
ORDER BY


select deptno, AVG(sal)
from emp
--where AVG(sal) >= 2000
group by deptno
having AVG(sal) >= 2000
;

1) 급여가 1500 이상인 직원들만 대상으로, 부서별 평균 급여

select deptno, AVG(sal)
from emp
where sal >= 1500
group by deptno
;

2) 부서별 평균 급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기
select deptno, AVG(sal)
from emp
group by deptno
having AVG(sal) >= 1500
;

--
student 각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

select grade, AVG(weight)
from student
group by grade
having AVG(weight) >= 65
;

--
student 4학년을 제외하고
각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

select grade, AVG(weight)
from student
where grade <> 4
group by grade
having AVG(weight) >= 65
;


select deptno, job, ROUND(AVG(sal), 1)
from emp
group by deptno, job;

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job);

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by CUBE(deptno, job);

select *
from emp
where job = 'SALESMAN' and deptno = 30;


group by ROLLUP(deptno, job);
1) deptno, job 그룹화
2) deptno 그룹화 계
3) () 그룹화 계

group by ROLLUP( (deptno, job) );
1) (deptno, job) 그룹화
2) () 그룹화 계

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by ROLLUP( (deptno, job) );

group by ROLLUP(deptno, job, mgr);
1) deptno, job, mgr 그룹
2) deptno, job 계
3) deptno 계
4) () 계

group by ROLLUP(deptno, (job, mgr) );
1) deptno, job, mgr 그룹
2) deptno 계
3) () 계


select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job, mgr);

select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, (job, mgr) );


--RANK DENSE RANK

순위 RANK() OVER (order by 정렬기준)
그룹단위 순위 RANK() OVER (PARTITION BY 기준 order by 정렬기준)
            --             group by

SELECT 
    ename,
    sal,
    RANK() OVER (ORDER BY sal desc),
    DENSE_RANK() OVER (ORDER BY sal desc)
FROM emp;
--order by sal;

SELECT 
    name,
    height,
    RANK() OVER (order by height desc) 순위1,
    DENSE_RANK() OVER (order by height desc) 순위2,
    grade,
    RANK() OVER (partition by grade order by height desc) 순위3,
    DENSE_RANK() OVER (partition by grade order by height desc) 순위4
FROM student
order by grade, height desc;

