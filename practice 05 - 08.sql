SELECT empno, 
        ename, 
        TO_CHAR(hiredate,'YYYY-MM-DD'), 
        TO_CHAR( sal*12+comm , '$999,999') "sal", 
        TO_CHAR((sal*12+comm)*1.15, '$999,999' ) "15%인상"
FROM emp
WHERE comm IS NOT NULL;

SELECT profno, name, pay, bonus, TO_CHAR(pay*12+NVL(bonus,0),'999,999') total
FROM professor
WHERE deptno = 201;

SELECT empno, ename, comm, NVL2(comm,'Exist','Null') NVL2
FROM emp
WHERE deptno = 30;

select 
        empno,
        ename,
        comm,
        sal*12+comm total,
        sal*12 +NVL(comm,0) total2,
        sal*12 +NVL2(comm,comm,0) total3,
        NVL2(comm,sal*12+comm,sal*12) total4
FROM emp
WHERE deptno = 30;

--1
SELECT deptno, name, DECODE( deptno, 101, DECODE(name,'Audie Murphy','BEST!',null), null)
FROM professor;

--2
SELECT deptno, name, DECODE( deptno, 101, DECODE(name,'Audie Murphy','BEST!','GOOD!'), null)
FROM professor;

--3
SELECT deptno, name, DECODE( deptno, 101, DECODE(name,'Audie Murphy','BEST!','GOOD!'), 'N/A')
FROM professor;

--4
select *
from student;

SELECT name, jumin,DECODE( substr(jumin,7,1), 1 , '남자', 2,'여자') 성별
FROM student
WHERE deptno1= 101;

--5
SELECT name, tel, DECODE( substr(tel,1,instr(tel,')',1)-1), 02 , '서울', 031,'경기', 051, '부산', 052, '울산', 055, '경남','etc') 지역명
FROM student
WHERE deptno1= 101;

--1
SELECT name, jumin, birthday,
    CASE
        WHEN TO_CHAR(BIRTHDAY,'MM') BETWEEN 1 AND 3 THEN '1분기'
        WHEN TO_CHAR(BIRTHDAY,'MM') BETWEEN 4 AND 6 THEN '2분기'
        WHEN TO_CHAR(BIRTHDAY,'MM') BETWEEN 7 AND 9 THEN '3분기'
        WHEN TO_CHAR(BIRTHDAY,'MM') BETWEEN 10 AND 12 THEN '4분기'
    END AS 분기
FROM student;

--2
SELECT  empno, ename, sal, 
    CASE
        WHEN SAL BETWEEN 1 AND 1000 THEN 'Level 1'
        WHEN SAL BETWEEN 1001 AND 2000 THEN 'Level 2'
        WHEN SAL BETWEEN 2001 AND 3000 THEN 'Level 3'
        WHEN SAL BETWEEN 3001 AND 4000 THEN 'Level 4'
        WHEN SAL >= 4001  THEN 'Level 5'
    END AS 레벨
FROM emp;
 
        