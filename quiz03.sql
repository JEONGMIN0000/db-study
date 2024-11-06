select empno 사번, name 이름, birthday 생년월일, hobby 취미, pay 급여, pay*1.5 성과급, 
      DECODE(emp_type, 'Perment employee', 'Perment family', 'Permanent employee', 'Permanent family') 직원분류, 
      replace(emp_type,'employee', 'family'),
        tel,
        case
            when pay > 35000000 and pay <= 45000000 then '하'
            when pay > 45000000 and pay <= 60000000 then '중'
            when pay > 60000000 then '상'
            when pay <= 35000000 then '화이팅'
        end as 급여수준
from emp2
where 
    TO_CHAR(birthday,'YY')between 70 and 79
    and
    substr(tel,1,instr(tel,')',1)-1) in ('02', '031')
;
    
select *
from emp2;