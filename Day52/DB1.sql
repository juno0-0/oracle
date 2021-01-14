-- 출력해 주는 내용을 화면에 보여주기 위해 환경설정 변경하기
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Fuck you');
    END;
    --put_line : 오라클에서 제공하는 프로시저, 화면에 출력을 함
/

DECLARE -- 선언
    vempno number(4);
    vename varchar2(10);
BEGIN -- 값 넣기
    vempno := 1001;
    vename := '이지은';
    DBMS_OUTPUT.PUT_LINE('    사    번         이    름 ');-- syso같은 것
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('   '|| vempno ||'     '|| vename);
    END;-- 끝
    /-- 실행

-- 스칼라변수 : SQL에서 사용하던 자료형과 거의 유사함
--            숫자인 경우 NUMBER, 문자형인 경우 VARCHAR2
-- ex) vempno number(4);
-- 레퍼런스 변수 : 이전에 선언된 다른 변수 또는 데이터베이스 칼럼에 맞춰 변수를 선언하기 위해 %TYPE속성을 사용
-- ex) vempno 테이블명.칼럼명%TYPE; = vempno의 타입은 테이블명의 칼럼의 타입과 같다.
--     %TYPE속성을 사용하여 선언한 vempno변수는 해당 테이블(emp)의 해당 칼럼(empno)의 자료형과 크기를 그대로 참조해서 정의
-- %ROWTYPE변수 : 특정테이블의 로우단위로 참조해서 래퍼런스 변수 선언
-- ex) vemp emp%rowtype;                
--      테이블 한행 전체에 대한 변수
