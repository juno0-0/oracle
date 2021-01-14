-- DBMS_OUTPUT을 화면에 출력
SET SERVEROUTPUT ON;

DECLARE
    myVar1 NUMBER(3);
    myVar2 NUMBER(5,2) := 3.14;
    myVar3 NVARCHAR2(20) := '이지은 키 -->';
BEGIN
    myVar1 := 5;
    DBMS_OUTPUT.PUT_LINE(myVar1);
    DBMS_OUTPUT.PUT_LINE(myVar1 + myVar2);
    SELECT height INTO myVar1 FROM userTbl WHERE userName = '이지은';
    DBMS_OUTPUT.PUT_LINE(myVar3 || TO_CHAR(myVar1);
END;
/

-- 결과가 소수점으로 길게 나오게 된다.
SELECT AVG(amount) AS "평균 구매 개수" FROM buyTBL;

-- AVG(amount) 결과를 CAST 함수에 의해 NUMBER(3)로 바꿔라
SELECT CAST(AVG(amount) AS NUMBER(3)) AS "평균 구매 개수" FROM buyTBL;

-- 2020$12$12를 DATE 형식으로 바꿔라 
SELECT CAST('2020$12$12' AS DATE) FROM DUAL;

-- 정수형을 문자형으로 바꿔서 연결
SELECT CAST(price AS CHAR(5))|| 'X' || CAST(amount AS CHAR(4)) || '=' AS "단가 X 수량"ㅡ
    price*amount AS "구매액"
    FROM buyTBL;
