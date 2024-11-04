--1
select name 이름, substr(jumin,1,2) 년도, substr(jumin,3,2) 월, substr(jumin,5,2) 일
from student;

--2
select name, tel, instr(tel, ')') 괄호위치
from student
where deptno1 = 201;

--3
select name, tel, instr(tel, 3)
from student
where deptno1 = 101;

--4
select name, tel, substr(tel,1,instr(tel, ')')-1)
from student
where deptno1 = 201;

--1
select ename, replace(ename,substr(ename,3,2),'--') replace
from emp
where deptno =20;

--2
select name, replace(jumin, substr(jumin,7,7),'-/-/-/-') "주민번호뒷자리숨김"
from student
where deptno1 = 101;

--3
select name, tel, replace(tel,substr(tel,instr(tel,')')+1,3),'***') replace
from student
where deptno1 = 102; 

--3심화
select name, tel, 
    INSTR(tel,')') 괄호위치,
    INSTR(tel,'-') 빼기위치,
    INSTR(tel,'-') - INSTR(tel,')') - 1 가운데자리수갯수,
    SUBSTR(tel,INSTR(tel,')')+1,(INSTR(tel,'-') - INSTR(tel,')') - 1)) 가운데자리, 
    SUBSTR(tel,1,instr(tel,')')) || RPAD('*',INSTR(tel,'-') - INSTR(tel,')') - 1 ,'*') ||  SUBSTR(tel,-5,5) replace
from student
where deptno1 = 102; 

--4
select name, tel, replace(tel, substr(tel,instr(tel,'-',2)+1,4),'****') replace 
                    --replace(tel, substr(tel,-4,4),'****')
from student
where deptno1 = 101;

--1
SELECT studno, name, TO_CHAR(birthday,'yyyy-mm-dd') birthday
FROM student
where TO_CHAR(birthday,'MM')=01;

--2
select empno, ename, hiredate
from emp
where TO_CHAR(hiredate,'MM')<=03;


