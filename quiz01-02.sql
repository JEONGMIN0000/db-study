--1
select studno 번호, name 이름, id 아이디
from student
where height>=160 and height <=175
union all
select profno, name, id
from professor
where bonus IS NULL
  AND deptno IN (101, 102, 103, 201);
    
--2
select '이름 :' || name 이름, '아이디 :' || id 아이디, '주민번호 :' || SUBSTR(jumin, 1, 6)|| '-' || SUBSTR(jumin, 7, 7) 주민번호  
from student;