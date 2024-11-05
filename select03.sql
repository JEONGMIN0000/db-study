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



