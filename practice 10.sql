
select * 
from student;
select *
from score;
select * 
from hakjum;
select *
from department;

--1
select s.studno 학번, s.name 이름, c.total 점수, h.grade 학점
from student s, score c, hakjum h
where s.studno = c.studno and c.total between h.min_point and max_point
order by total desc;

--2
select s.studno 학번, s.name 이름, c.total 점수, h.grade 학점
from student s, score c, hakjum h
where  s.deptno1 in (101, 102)
    and s.studno = c.studno 
    and c.total between h.min_point and max_point
order by total desc;

--3
SELECT s.name, s.grade, p.name, p.deptno, d.dname
FROM student s, professor p, department d
WHERE s.profno not in 301
    and s.profno = p.profno
    and p.deptno = d.deptno
ORDER BY grade desc, deptno;




