--subquery

select *
from emp;

--사번이 7844인 사원과 같은 부서 사람들 조회
select *
from emp
where deptno = (select deptno
                    from emp
                    where empno = 7844);
                    
select deptno
from emp
where empno = 7844;


select * from emp2;

select * from dept2;

select *
from dept2
where area = 'Pohang Main Office';


select *
from emp2
where deptno IN (select dcode
                from dept2
                where area = 'Pohang Main Office');
                
            --IN ( 0001, 1003, 1006, 1007);

select *
from emp2
where deptno = &dno;

select *
from emp2
where deptno = :dno;


select *
from emp2
where deptno IN (select dcode
                from dept2
                where area = 'Pohang Main Office');

select dcode
from dept2
where area = 'Pohang Main Office'
AND dcode = 1003;

select *
from emp2
where EXISTS (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);
                
                
--다중컬럼
select *
from student
where (grade, weight) IN ( select grade, MAX(weight)
                            from student
                            group by grade );

select *
from student
where (weight) IN ( select MAX(weight)
                            from student
                            group by grade );



select *
from emp2 e1
where e1.pay >=  (select AVG(e2.pay)
                  from emp2 e2
                  where e2.position = e1.position);


select *
from emp2;

select *
from dept2;

--join
select e.name, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;


--subquery
select dname
from dept2
where dcode = 1006;

select 
    name,
    (select dname
        from dept2 
        where dcode = deptno) dname
        -- where dcode > deptno) dname 다중행 결과를 만들어서 X
from emp2;

select dname
        from dept2 
        where dcode > 1010;
        
        
select empno, ename, job, '직원'
from emp;


select empno, ename, job, mgr, sal, comm, deptno
from emp;

select sal, mgr
from (
        select empno, ename, job, mgr, sal
        from emp) ;

select * from dept;

emp테이블과 dept테이블을 조회하여 부서번호와 부서별 최대급여 및 부서명을 출력하세요

-- groupby집계 -> join
select e.deptno, e.max_sal, d.dname
from (select deptno, MAX(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno;

--join -> groupby 

select deptno, max(sal), dname
from (select e.sal, e.deptno, d.dname
        from emp e, dept d
        where e.deptno = d.deptno )
group by deptno, dname;





