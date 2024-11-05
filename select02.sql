단일행 함수

임시로 사용하는 테이블 dual
select * from dual;

select ename, INITCAP('ABCDE'), INITCAP(ename) -- Abcde Smith
from emp;

select LOWER(name), UPPER(name) --smith SMITH
from student;

select LENGTH('abcdef'), LENGTHB('abcdef'), -- 6 6
        LENGTH('점심'), LENGTHB('점심') -- 2 6
from dual; 

select *
from emp --이름 5글자 이상인 사람들
where LENGTH(ename) >= 5;

select '아침' || '점심', CONCAT('아침', '점심') -- 아침점심
from dual;

select '아침' || '점심'  || '저녁',  CONCAT( CONCAT('아침', '점심') , '저녁') -- 아침점심저녁
from dual;

--SUBSTR(대상, 시작지점, 자리수)
select
    SUBSTR('abcdef', 1, 3 ), -- abc
    SUBSTR('abcdef', 3, 5 ), -- cdef
    SUBSTR('abcdef', -5, 2 ) -- bc
from dual;

select
    name, 
    SUBSTR(jumin, 3, 4 ) Birthday, -- 1023
    SUBSTR(jumin, 3, 4 )-1  "Birthday-1" -- 1022
from student
where deptno1 = 101;

--INSTR(대상, 찾는, 시작, 몇번째[1] ) --기본값이 1 
select
    INSTR('2024/11/04 10/45/45', '/', 1), -- 5
    INSTR('2024/11/04 10/45/45', '/', 6), -- 8
    INSTR('2024/11/04 10/45/45', '/', 1, 4), -- 17
    INSTR('2024/11/04 10/45/45', '/', 6, 2), -- 14
    INSTR('2024/11/04 10/45/45', '/', 1, 5), -- 0
    INSTR('2024/11/04 10/45/45', '/', 16, 2) -- 0
from dual;

select name, tel, INSTR(tel, ')')
from student
where deptno1 = 201;

select 
    LPAD('문자', 10,'*'),
    LPAD(123, 5,0),
    LPAD(33, 3,0)
from dual;

select 
    LPAD(id, 10,'*'), -- ****75true
    RPAD(id, 10,'*') -- 75true****
from student;

select LPAD(ename, 9, 123456789) --1234SMITH
from emp;

-- TRIM -> 불필요한 요소 제거
-- 공백제거용
select LTRIM('abcd','a'), -- bcd
    RTRIM('abcd','d'), -- abc
    RTRIM('abcd','b'), -- abcd 
    LTRIM('abcd','d'), -- abcd
    LTRIM(' abcd '), -- abcd공백 
    RTRIM(' abcd '), -- 공백abcd
    TRIM(' abcd ') -- abcd
from dual;

select
    REPLACE('abcde', , ),
    REPLACE('', , )
from dual;

----
SELECT 
    ROUND(1.66,1), --1.7
    TRUNC(1.456,2), --1.45
    TRUNC(1.4567,0), --1
    TRUNC(123.4567,-1), --120
    MOD(15,4), --3
    CEIL(123.13), --124
    FLOOR(123.1333), --123
    POWER(3,5) --243
FROM dual;

select
    rownum, -- 행번호
    CEIL(rownum/3), -- 가장 가까운 수 중 큰 정수 
    empno,
    ename
from emp;


SELECT
        null,
        SYSDATE, --현재날짜시간 
        SYSTIMESTAMP, --24/11/04 17:02:41.460000000 +09
        MONTHS_BETWEEN('2024-01-05','2024-03-05'),-- -2
        MONTHS_BETWEEN('2024-03-05','2024-01-05'), --2
        ADD_MONTHS(SYSDATE, 3), -- 11/4 -> 3개월후
        LAST_DAY(SYSDATE), --
        NEXT_DAY(SYSDATE,'수'), -- 11/6
        NEXT_DAY(SYSDATE,'토') -- 11/9
FROM dual;

SELECT
        ROUND(SYSDATE),
        TRUNC(SYSDATE),
        TRUNC(123.113,1),
        TRUNC(SYSDATE, 'MM'), -- 24/11/01 --YEAR MONTH DAY
        TRUNC(SYSDATE, 'YY'), -- 24/01/01
        ADD_MONTHS(SYSDATE, 1),
        SYSDATE + 3,
        SYSDATE - 3,
        SYSDATE + 7,
        --다음달의 첫날
        ADD_MONTHS(TRUNC(SYSDATE,'MM'),1),
        TRUNC(ADD_MONTHS(SYSDATE,1),'MM'),
        LAST_DAY(SYSDATE)+1,
        --전월의 마지막날
        TRUNC(SYSDATE,'MM')-1,
        LAST_DAY(ADD_MONTHS(SYSDATE,-1))
FROM dual;

----------------
SELECT 2 + '2' --4 --자동형변환 
FROM dual;

SELECT 2 || '123a' --2123a
FROM dual;

SELECT 
        TO_CHAR(123),
        TO_CHAR(590493.238),
        TO_CHAR(502.23),
        SYSDATE,
        TO_CHAR(SYSDATE), --날짜 ->문자
        TO_CHAR(SYSDATE, 'YYYY'),
        TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'DD'),
        TO_CHAR(SYSDATE, 'YYYYMMDD'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT 
        SYSDATE,
        TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'),
        TO_CHAR(SYSDATE, 'HH24:MI:SS'),
        TO_CHAR( ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT 
    TO_CHAR(1234, '999999'),
    TO_CHAR(1234, '099999'),
    TO_CHAR(1234, '$99999'),
    '$' || 1234,
    TO_CHAR(1234, '99999.99'),
    TO_CHAR(1234, '99,999')
FROM dual;

SELECT 
        TO_DATE('2024-06-02')+3,
        TO_DATE('2024/06/02')+3,
        TO_DATE('24/06/02')+3,
        TO_DATE('20240602')+3,
        LAST_DAY('2024-08-05'),
        TO_DATE('24:06:02')+3,
        TO_CHAR(SYSDATE,'YYYY/MM/DD'),
        TO_DATE('2024-01-05','YYYY-MM-DD'),
        TO_DATE('2024,01,05','YYYY,MM,DD'),
        TO_DATE('12/10/20','MM/DD/YY')
FROM dual;

--NVL
SELECT 
        sal,
        comm,
        sal*12+comm,
        sal*12+NVL(comm,0)
FROM emp;

SELECT
        NVL(null,0),
        NVL2(123,'있다','없다'),
        NVL2(NULL,'있다','널이다')
FROM dual;

--DECODE

SELECT
        DECODE(10, 10, '같다', '다르다'),
        DECODE(10, 20, '같다', '다르다'),
        DECODE(10, 20, '같다'), --DECODE(10, 20, '같다', NULL)
        DECODE(10, 20, '같다', NULL),
        DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', '아니다'),
        DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다'),
        DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', NULL),
        DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다')
FROM dual;

SELECT 
    deptno, name,
    DECODE(deptno, 101, '컴공', '다른과'),
    DECODE(deptno, 101, '컴공', 'ETC'),
    DECODE(deptno, 101, '컴공'),
    DECODE(deptno, 101, '컴공', null)
FROM student;

SELECT 
    deptno, name,
    DECODE(deptno, 101, '컴공',102, '멀미',103,'소웨', 'etc')
FROM professor;

--CASE

--grade 
--학년 1 2 3 
SELECT  grade || '학년'
FROM student;

--1 2 저학년 3 4 고학년
SELECT 
    DECODE(GRADE, 1,'저학년',2,'저학년', 3, '고학년', 4, '고학년') 학년구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE
        WHEN grade IN (1, 2) THEN '저학년' 
         WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
FROM student;









