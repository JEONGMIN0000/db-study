CREATE TABLE  T_MENU_12(

    id NUMBER(3) primary key,
    name VARCHAR2(128) NOT NULL,
    price NUMBER(10),
    type VARCHAR2(64),
    d_date DATE
    
);


INSERT INTO T_MENU_12 VALUES(1, '싸이버거', 6000, '완전식품', SYSDATE);
INSERT INTO T_MENU_12 VALUES(2, '콩나물비빔밥', 7000, '탄수화물', SYSDATE);
INSERT INTO T_MENU_12 VALUES(3, '닭가슴살', 3000, '단백질', SYSDATE);
INSERT INTO T_MENU_12 VALUES(4, '베트남쌀국수', 8000, '탄수화물', SYSDATE);
INSERT INTO T_MENU_12 VALUES(5, '라면', 2000, '밀가루', SYSDATE);

select * from  T_MENU_12;

UPDATE T_MENU_12
SET price = 8500
WHERE name = '베트남쌀국수';


SELECT *
--DELETE
FROM T_MENU_12
WHERE name = '라면';