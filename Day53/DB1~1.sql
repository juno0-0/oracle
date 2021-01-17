SET SERVEROUTPUT ON;

-- PL/SQL�� SELECT������ emp���̺��� �����ȣ�� �̸��� ����ϱ�
DECLARE
    -- Reference ������ %TYPE ���� ���� 
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    SELECT empno, ename INTO v_empno, v_ename FROM emp WHERE ename = '������';
    DBMS_OUTPUT.PUT_LINE('  '||v_empno||'   '||v_ename);
END;
/

SELECT * FROM emp;

-- �������� job, mgr, deptno
DECLARE
    v_ename emp.ename%TYPE;
    v_job emp.job%TYPE;
    v_mgr emp.mgr%TYPE;
    v_deptno emp.deptno%TYPE;
BEGIN
    SELECT ename, job, mgr, deptno INTO v_ename, v_job, v_mgr, v_deptno FROM emp WHERE ename = '������';
    DBMS_OUTPUT.PUT_LINE(v_ename||'  '||v_job||'  '||v_mgr||'  '||v_deptno);
END;
/

-- �μ���ȣ�� �μ��� �˾Ƴ���
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
    VDNAME := '�渮��';
    END IF;
    
    IF(VDEPTNO = 20) THEN
    VDNAME := '�λ��';
    END IF;
    
    IF(VDEPTNO = 30) THEN
    VDNAME := '������';
    END IF;
    
    IF(VDEPTNO = 40) THEN
    VDNAME := '�����';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(' ���  �̸�  �μ��� ');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE(' '||VEMPNO||'  '||VENAME||'  '||VDNAME);
END;
/
    
-- �������ϱ�
-- Ŀ�̼��� �޴� ������ �޿�*12 + comm
-- Ŀ�̼��� ���� �ʴ� ������ �޿�*12
DECLARE
    vename emp.ename%TYPE;
    vsal emp.sal%TYPE;
    vcomm emp.comm%TYPE;
    vysal number(10) := NULL;
BEGIN
    SELECT ename, sal, comm 
    INTO vename, vsal, vcomm
    FROM emp
    WHERE ename = '����';
    
    IF(vcomm is not null) THEN
    vysal := vsal*12+vcomm;
    ELSE
    vysal := vsal*12;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('�̸�  �޿�  ����');
    DBMS_OUTPUT.PUT_LINE('--------------');
    DBMS_OUTPUT.PUT_LINE(vename||'  '||vsal||'  '||vysal);
END;
/

DECLARE
    VEMP EMP%ROWTYPE;
    ANNSAL NUMBER(7,2);
BEGIN
    SELECT * INTO VEMP FROM EMP WHERE ENAME = '����';
    
    IF(VEMP.COMM IS NULL) THEN
    ANNSAL := VEMP.SAL * 12;
    ELSE
    ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('���  �̸�  ����');
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
    VDNAME := '�渮��';
    ELSIF(VDEPTNO = 20) THEN
    VDNAME := '�λ��';
    ELSIF(VDEPTNO = 30) THEN
    VDNAME := '������';
    ELSE
    VDNAME := '�����';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(' ���  �̸�  �μ��� ');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE(' '||VEMPNO||'  '||VENAME||'  '||VDNAME);
END;
/
    
-- FOR LOOP��
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

-- S_EMP���̺� �����
create table s_emp
as
select * from emp;

select * from s_emp;

-- s_emp���� ������ ������ �����̸� �޿��� 10%�λ�, �ƴϸ� 5%�λ�
DECLARE
    vemp s_emp%ROWTYPE;
    vdeptno s_emp.deptno%TYPE;
    vpercent number(2);
BEGIN
    SELECT deptno INTO vdeptno FROM dept WHERE dname LIKE '%����%';
    SELECT * INTO vemp FROM s_emp WHERE ename = '������';
    IF(vemp.deptno = vdeptno) THEN
        vpercent := 10;
    ELSE
        vpercent := 5;
    END IF;
    UPDATE s_emp SET sal = sal + sal * (vpercent/100) WHERE ename = '������';
    commit;
END;
/

select * from s_emp;

-- ���� ���ν��� �����ϱ�
CREATE OR REPLACE PROCEDURE DEL_ALL
IS 
BEGIN
    DELETE FROM emp01;
    COMMIT;
END;
/
-- ���� ���ν��� �����ϱ�
EXECUTE DEL_ALL;
-- ���� ���ν��� ��ȸ�ϱ�
DESC user_source;
SELECT * FROM user_source where name = 'DEL_ALL';
-- ���� ���ν��� �Ű�����
CREATE OR REPLACE PROCEDURE DEL_ENAME(VENAME EMP01.ENAME%TYPE)
IS
BEGIN
    DELETE FROM EMP01 WHERE ENAME LIKE VENAME;
    COMMIT;
END;
/
EXECUTE DEL_ENAME('%��%');
EXECUTE DEL_ENAME('�ȼ���');
EXECUTE DEL_ENAME('%��%');
select * from emp01;

-- IN �Ű�����, DEFAULT
CREATE OR REPLACE PROCEDURE DEL_ENAME(
    VENAME IN EMP01.ENAME%TYPE)
    
-- OUT �Ű�����
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
-- ���� ����
VARIABLE VAR_ENAME VARCHAR2(15);
VARIABLE VAR_SAL NUMBER;
VARIABLE VAR_JOB VARCHAR2(9);
-- ���� ���ν��� ����
EXECUTE SEL_EMPNO(1001, :VAR_ENAME, :VAR_SAL, :VAR_JOB); 
-- �ٿ�� ������ ���� ���
print var_ename
print var_sal
print var_job

    

