SET SERVEROUTPUT ON;

-- PL/SQL의 SELECT문으로 emp테이블에서 사원번호와 이름을 출력하기
DECLARE
    -- Reference 변수의 %TYPE 변수 선언 
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    SELECT empno, ename INTO v_empno, v_ename FROM emp WHERE ename = '이지은';
    DBMS_OUTPUT.PUT_LINE('  '||v_empno||'   '||v_ename);
END;
/

SELECT * FROM emp;

-- 아이유의 job, mgr, deptno
DECLARE
    v_ename emp.ename%TYPE;
    v_job emp.job%TYPE;
    v_mgr emp.mgr%TYPE;
    v_deptno emp.deptno%TYPE;
BEGIN
    SELECT ename, job, mgr, deptno INTO v_ename, v_job, v_mgr, v_deptno FROM emp WHERE ename = '아이유';
    DBMS_OUTPUT.PUT_LINE(v_ename||'  '||v_job||'  '||v_mgr||'  '||v_deptno);
END;
/

-- 부서번호로 부서명 알아내기
DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
    VDEPTNO EMP.DEPTNO%TYPE;
    VDNAME VARCHAR2(20) := NULL;
BEGIN
    SELECT EMPNO, ENAME, DEPTNO
    INTO VEMPNO, VENAME, VDEPTNO
    FROM EMP
    WHERE EMPNO = 1001;
    
    IF(VDEPTNO = 10) THEN
    VDNAME := '경리부';
    END IF;
    
    IF(VDEPTNO = 20) THEN
    VDNAME := '인사부';
    END IF;
    
    IF(VDEPTNO = 30) THEN
    VDNAME := '영업부';
    END IF;
    
    IF(VDEPTNO = 40) THEN
    VDNAME := '전산부';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(' 사번  이름  부서명 ');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE(' '||VEMPNO||'  '||VENAME||'  '||VDNAME);
END;
/
    
-- 연봉구하기
-- 커미션을 받는 직원은 급여*12 + comm
-- 커미션을 받지 않는 직원은 급여*12
DECLARE
    vename emp.ename%TYPE;
    vsal emp.sal%TYPE;
    vcomm emp.comm%TYPE;
    vysal number(10) := NULL;
BEGIN
    SELECT ename, sal, comm 
    INTO vename, vsal, vcomm
    FROM emp
    WHERE ename = '김사랑';
    
    IF(vcomm is not null) THEN
    vysal := vsal*12+vcomm;
    ELSE
    vysal := vsal*12;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('이름  급여  연봉');
    DBMS_OUTPUT.PUT_LINE('--------------');
    DBMS_OUTPUT.PUT_LINE(vename||'  '||vsal||'  '||vysal);
END;
/

DECLARE
    VEMP EMP%ROWTYPE;
    ANNSAL NUMBER(7,2);
BEGIN
    SELECT * INTO VEMP FROM EMP WHERE ENAME = '김사랑';
    
    IF(VEMP.COMM IS NULL) THEN
    ANNSAL := VEMP.SAL * 12;
    ELSE
    ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번  이름  연봉');
    DBMS_OUTPUT.PUT_LINE('--------------');
    DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'  '||VEMP.ENAME||'  '||ANNSAL);
END;
/

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
    VDEPTNO EMP.DEPTNO%TYPE;
    VDNAME VARCHAR2(20) := NULL;
BEGIN
    SELECT EMPNO, ENAME, DEPTNO
    INTO VEMPNO, VENAME, VDEPTNO
    FROM EMP
    WHERE EMPNO = 1001;
    
    IF(VDEPTNO = 10) THEN
    VDNAME := '경리부';
    ELSIF(VDEPTNO = 20) THEN
    VDNAME := '인사부';
    ELSIF(VDEPTNO = 30) THEN
    VDNAME := '영업부';
    ELSE
    VDNAME := '전산부';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(' 사번  이름  부서명 ');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE(' '||VEMPNO||'  '||VENAME||'  '||VDNAME);
END;
/
    
-- FOR LOOP문
BEGIN
    FOR N IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/

DECLARE 
    N NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N+1;
        IF (N>5) THEN
            EXIT;
        END IF;
    END LOOP;
END;
/

DECLARE
    TOTAL NUMBER := 0;
BEGIN
    FOR N IN 1..100 LOOP
        TOTAL := TOTAL + N;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TOTAL);
END;
/

DECLARE
    N NUMBER := 1;
    TOTAL NUMBER := 0;
BEGIN
    WHILE N<=5 LOOP
        TOTAL := TOTAL+1;
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(TOTAL);
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/

select * from emp;
select * from dept;

-- S_EMP테이블 만들기
create table s_emp
as
select * from emp;

select * from s_emp;

-- s_emp에서 김사랑의 업무가 영업이면 급여를 10%인상, 아니면 5%인상
DECLARE
    vemp s_emp%ROWTYPE;
    vdeptno s_emp.deptno%TYPE;
    vpercent number(2);
BEGIN
    SELECT deptno INTO vdeptno FROM dept WHERE dname LIKE '%영업%';
    SELECT * INTO vemp FROM s_emp WHERE ename = '이지은';
    IF(vemp.deptno = vdeptno) THEN
        vpercent := 10;
    ELSE
        vpercent := 5;
    END IF;
    UPDATE s_emp SET sal = sal + sal * (vpercent/100) WHERE ename = '이지은';
    commit;
END;
/

select * from s_emp;

-- 저장 프로시저 생성하기
CREATE OR REPLACE PROCEDURE DEL_ALL
IS 
BEGIN
    DELETE FROM emp01;
    COMMIT;
END;
/
-- 저장 프로시저 실행하기
EXECUTE DEL_ALL;
-- 저장 프로시저 조회하기
DESC user_source;
SELECT * FROM user_source where name = 'DEL_ALL';
-- 저장 프로시저 매개변수
CREATE OR REPLACE PROCEDURE DEL_ENAME(VENAME EMP01.ENAME%TYPE)
IS
BEGIN
    DELETE FROM EMP01 WHERE ENAME LIKE VENAME;
    COMMIT;
END;
/
EXECUTE DEL_ENAME('%이%');
EXECUTE DEL_ENAME('안성기');
EXECUTE DEL_ENAME('%기%');
select * from emp01;

-- IN 매개변수, DEFAULT
CREATE OR REPLACE PROCEDURE DEL_ENAME(
    VENAME IN EMP01.ENAME%TYPE)
    
-- OUT 매개변수
CREATE OR REPLACE PROCEDURE SEL_EMPNO(
    VEMPNO IN EMP.EMPNO%TYPE,
    VENAME OUT EMP.ENAME%TYPE,
    VSAL OUT EMP.SAL%TYPE,
    VJOB OUT EMP.JOB%TYPE)
IS
BEGIN
    SELECT ENAME, SAL, JOB INTO VENAME, VSAL, VJOB FROM EMP WHERE EMPNO = VEMPNO;
END;
/    
-- 변수 선언
VARIABLE VAR_ENAME VARCHAR2(15);
VARIABLE VAR_SAL NUMBER;
VARIABLE VAR_JOB VARCHAR2(9);
-- 저장 프로시저 실행
EXECUTE SEL_EMPNO(1001, :VAR_ENAME, :VAR_SAL, :VAR_JOB); 
-- 바운드 변수의 값을 출력
print var_ename
print var_sal
print var_job

    

