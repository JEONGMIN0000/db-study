--join 01

select *
from emp;

select *
from dept;

--조인기준 deptno 가 같은 

--select empno, ename, dname, loc, d.deptno
select e.empno, e.ename, d.dname, d.loc, d.deptno
--select *
from emp e, dept d
where e.deptno = d.deptno;


select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

select *
from emp e, dept d;
--where e.deptno = d.deptno;


--student <-profno-> professor
select *
from student;

select COUNT(*)
FROM student;

select *
from professor;

SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

SELECT *
FROM student s INNER JOIN professor p
ON s.profno = p.profno;

--INNER JOIN  vs OUTER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno(+);
--WHERE s.profno(+) = p.profno;
--WHERE p.profno = s.profno(+);

SELECT *
FROM student s LEFT OUTER JOIN professor p
--FROM student s RIGHT OUTER JOIN professor p
--FROM professor p  LEFT OUTER JOIN student s
ON s.profno = p.profno;


---

select *
from student;

select *
from professor;

select *
from department;


select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    AND
    s.deptno1 = d.deptno
;


select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from 
    student s 
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;


--학생의 학과이름
select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    AND
    s.deptno1 = d.deptno    --student 학과번호 = department 학과번호
;

select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    AND
    p.deptno = d.deptno    --professor 학과번호 = department 학과번호
;


--교수학과이름, 학생학과이름
SELECT 
    s.name, 
    s.deptno1,
    d.dname, 
    s.profno,
    p.profno,
    p.name,
    p.deptno,
    d2.dname
from student s, professor p, department d, department d2
where s.profno = p.profno
    AND s.deptno1 = d.deptno
    AND p.deptno = d2.deptno;



select *
from customer;

select *
from gift;

-- 1~65000~100000

select c.gname, c.point, g.gname
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end;


select *
from student;

select *
from score;

select *
from hakjum;



--INNER JOIN
select *
from student s, professor p
where s.profno = p.profno;

--OUTER JOIN
select *
from student s, professor p
where s.profno = p.profno(+);

select *
from student s, professor p
where p.profno = s.profno(+);
--where s.profno(+) = p.profno;

select *
from student;

select *
from professor;

select *
from emp;


--내 사번, 내이름, 내 상사의 사번, 상사의 이름
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;


select * from emp2;