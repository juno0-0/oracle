CREATE SEQUENCE dept_deptno_seq
    START WITH 10
    INCREMENT BY 10;

-- ������ ����
DESC user_sequences;
-- DB�� ������ ��Ȳ
SELECT * FROM user_sequences WHERE SEQUENCE_NAME in('DEPT_DEPTNO_SEQ');
-- nextval : ���� ��
SELECT dept_deptno_seq.NEXTVAL FROM DUAL;
-- currval : ���� ��
SELECT dept_deptno_seq.CURRVAL FROM DUAL;
CREATE SEQUENCE sample_seq;
SELECT sample_seq.CURRVAL FROM DUAL;--�����Ͱ� �̵��� ������, ���۰��� ���༭ �ƹ��͵� ����Ű�� �ʾƼ� ����

-- Ȱ���ϱ�
-- 1010 -> 1020 ~ 1500
CREATE SEQUENCE emp_seq
    START WITH 1010
    INCREMENT BY 10
    MAXVALUE 1500;
    
CREATE TABLE emp01(
    empno number(4) PRIMARY KEY,
    name varchar2(10),
    hiredate date);
    
SELECT * FROM user_constraints WHERE table_name IN('EMP01');

INSERT INTO emp01 VALUES(emp_seq.nextval, 'ȫ�浿', sysdate);

SELECT * FROM emp01;

ALTER SEQUENCE emp_seq
    INCREMENT BY 100
    MAXVALUE 1600
    CYCLE;
    
INSERT INTO emp_seq VALUES(emp_seq.nextval, 'ȫ�浿', sysdate);

ALTER SEQUENCE emp_seq
    MAXVALUE 2000;

SELECT * FROM user_sequences WHERE SEQUENCE_NAME in('EMP_SEQ');

desc user_ind_columns;
select * from user_ind_columns WHERE index_name = 'IDX_EMP01_ENAME';

CREATE TABLE emp01
AS
SELECT * FROM emp;
-- emp, emp01 �ε��� Ȯ��
SELECT * FROM user_ind_columns WHERE table_name IN('EMP','EMP01');
-- emp01�� ������ ����
INSERT INTO emp01 SELECT * FROM emp01;
INSERT INTO emp01 (empno, ename) VALUES(2222,'iu');
SET TIMING OFF -- �ð��� ���� ��
SELECT distinct empno, ename FROM emp01 WHERE ename = 'iu';

SELECT count(*) FROM emp01;

-- �ε��� ����
CREATE INDEX idx_emp01_ename
    ON emp01(ename);
    
-- �ε��� ����
DROP INDEX idx_emp01_ename;

-- �ε��� ���� �� ����, ����, ���� �ð�
-- ���� 0.027 ���� 0.336
-- �ε��� ������ �� ����, ����, ���� �ð�
-- ���� 0.031 ���� 0.068
INSERT INTO emp01 (empno, ename) VALUES(2131, '������');
UPDATE emp01 SET empno = 7777 WHERE ename = '������';

-- ���������� ���̺� �����
CREATE TABLE dept01
AS
SELECT * FROM dept
WHERE deptno = 100;

INSERT INTO dept01 VALUES(10, '�λ��', '����');
INSERT INTO dept01 VALUES(20, '�ѹ���', '����');
INSERT INTO dept01 VALUES(30, '������', '����');

SELECT * FROM dept01;

-- ���� �ε��� �����ϱ�
CREATE UNIQUE INDEX idx_dept01_deptno -- O
    ON dept01(deptno);

CREATE UNIQUE INDEX idx_dept01_loc -- X, ������ �ߺ����� ���ֱ� ������ UNIQUE�� ���� �� ����
    ON dept01(loc);
    
CREATE UNIQUE INDEX idx_dept01_dname -- O
    ON dept01(dname);

-- ����� �ε����� �����ϱ�
CREATE INDEX idx_dept01_loc -- O, �ߺ� ����
    ON dept01(loc);
    
-- ���� �ε����� �����ϱ�
CREATE INDEX idx_dept01_deptno_dname -- ���� �ε������� ����� �ε���
    ON dept01(deptno, dname);

-- �Լ� ��� �ε����� �����ϱ�
CREATE INDEX idx_emp01_annsal
    ON emp01(sal);    
SELECT * FROM emp01 WHERE sal*12>=3600; -- �����̶� INDEX�� �ɸ��� ����

CREATE INDEX idx_emp01_annsal -- �Լ� ��� �ε���
    ON emp01(sal*12);
    
-- �ε��� �����ϱ�
-- �ε����� ������ �� ���ο� ���� �߰��ǰų� ������ �� ����
-- �ε����� ���� Į�� ���� ����� �� ����
-- �̷� ��� �� ���̺��� �ڷ� �߰�, ����, ���� �۾��� �Ͼ �� �ش� ���̺� �ɸ� �ε����� ���뵵 �Բ� �����Ǿ�� ��
ALTER INDEX idx_dept01_deptno REBUILD

SELECT * FROM user_ind_columns WHERE table_name IN('EMP01');
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

-- 1. �μ� ��ȣ�� �����ϴ� ������ ��ü�� �����Ͽ� ������ ��ü�� �̿��Ͽ� �μ� ��ȣ�� �ڵ����� ����
CREATE TABLE dept_ex(
    deptno number(4) PRIMARY KEY,
    dname varchar2(15),
    loc varchar2(15));

SELECT * FROM user_constraints WHERE table_name = 'DEPT_EX';

CREATE SEQUENCE dept_ex_seq
    START WITH 100
    INCREMENT BY 10
    MAXVALUE 2000
    
INSERT INTO dept_ex VALUES(dept_ex_seq.nextval, '������', '����');
SELECT * FROM dept_ex

    
-- 2. ��� ���̺��� ���� �ε����� �����ϱ�
CREATE INDEX emp_job ON emp_test(job);
