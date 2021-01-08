CREATE TABLE emp08
AS
SELECT * FROM emp WHERE deptno = 100;

CREATE TABLE dept02
AS
SELECT * FROM dept WHERE loc='a';

INSERT INTO dept02 VALUES(50, '���Ⱥ�', '����');
INSERT INTO dept02 SELECT * FROM dept;

ALTER TABLE dept02
    ADD memo varchar2(10);
    
CREATE TABLE dept03(
    deptno01 number(2),
    dname1 varchar2(14),
    loc1 varchar2(13));
-- �� ���� ���̺� ������ ������ �÷����� �ٸ��� ���Եȴ�.
INSERT INTO dept03 SELECT * FROM dept;

-- ������ ���̺� ������ 1������ dept04, 2������ dept05
CREATE TABLE dept04(
    deptno number(2),
    dname1 varchar2(14));
INSERT INTO dept04 SELECT * FROM dept;--x

CREATE TABLE dept05(
    deptno number(2),
    dname1 varchar2(14),
    loc1 varchar2(13),
    dname2 varchar2(10),
    dname3 varchar(3));
INSERT INTO dept05 SELECT * FROM dept;--x

-- �ΰ��� ���̺��� ���� ������ �ٸ��� �÷��� ������ ���� ��
CREATE TABLE dept06(
    dname1 varchar2(14),
    deptno number(2),
    loc1 varchar2(13));
INSERT INTO dept06(deptno, dname1, loc1) SELECT * FROM dept;--o
INSERT INTO dept06 SELECT deptno, dname1, loc1 FROM dept; --���� ����

select * from dept03;
-- 20�� �μ��� �������� 40�� �μ��� ���������� �ٲٱ�(20�� �μ� ���� = ��õ --> ����)
UPDATE dept03 SET loc ='����' WHERE deptno = 20;--20���� ������ �������� �ٲٱ�
SELECT loc FROM dept03 WHERE deptno=40;--���� ���ϱ�
UPDATE dept03 SET loc =(SELECT loc FROM dept03 WHERE deptno=40) WHERE deptno = 20;--�������� ���

SELECT * FROM emp02;
-- ������̺��� '������'�� ��� �����ϱ�
SELECT deptno FROM dept WHERE dname = '������';
DELETE emp02 WHERE deptno = 30;
DELETE emp02 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '������');

-- �μ� ���̺� �����ϱ�
DROP TABLE EMP;

-- ��� ���̺� �����ϱ�
DROP TABLE DEPT;

-- �޿� ���̺� �����ϱ�
DROP TABLE SALGRADE;

-- �μ� ���̺� �����ϱ�
DROP TABLE EMPLOYEE;

-- ��� ���̺� �����ϱ�
DROP TABLE DEPARTMENT;

-- �޿� ���̺� �����ϱ�
DROP TABLE SALGRADE;

?

-- �μ� ���̺� �����ϱ�
CREATE TABLE DEPT(
DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) ) ;

-- ��� ���̺� �����ϱ�
CREATE TABLE EMP( 
EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

?

-- �޿� ���̺� �����ϱ�
CREATE TABLE SALGRADE(
GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER );

?

-- ��� ���̺� ���� ������ �߰��ϱ�
INSERT INTO DEPT VALUES(10, '�渮��', '����');
INSERT INTO DEPT VALUES(20, '�λ��', '��õ');
INSERT INTO DEPT VALUES(30, '������', '����'); 
INSERT INTO DEPT VALUES(40, '�����', '����');

?

-- �μ� ���̺� ���� ������ �߰��ϱ�

INSERT INTO EMP VALUES(1001, '����', '���', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '�ѿ���', '�븮', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250, 80, 30);
INSERT INTO EMP VALUES(1003, '����ȣ', '����', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500, 100, 30);
INSERT INTO EMP VALUES(1004, '�̺���', '����', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '�ŵ���', '����', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450, 200, 30);
INSERT INTO EMP VALUES(1006, '�嵿��', '����', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '�̹���', '����', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '���켺', '����', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500, 0, 30);
INSERT INTO EMP VALUES(1009, '�ȼ���', '����', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '�̺���', '����', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '�����', '���', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '������', '���', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '������', '����', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '���μ�', '���', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

?

-- �޿� ���̺� ���� ������ �߰��ϱ�

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
COMMIT;

create table department
( deptno number(3) primary key ,
  dname varchar2(50) not null,
  part number(3),
  build  varchar2(30))tablespace users;

insert into department 
values (101,'Computer Engineering',100,'Information Bldg');
insert into department
values (102,'Multimedia Engineering',100,'Multimedia Bldg');
insert into department
values (103,'Software Engineering',100,'Software Bldg');
insert into department
values (201,'Electronic Engineering',200,'Electronic Control Bldg');
insert into department
values (202,'Mechanical Engineering',200,'Machining Experiment Bldg');
insert into department
values (203,'Chemical Engineering',200,'Chemical Experiment Bldg');
insert into department
values (301,'Library and Information science',300,'College of Liberal Arts');
insert into department
values (100,'Department of Computer Information',10,null);
insert into department
values (200,'Department of Mechatronics',10,null);
insert into department
values (300,'Department of Humanities and Society',20,null);
insert into department
values (10,'College of Engineering',null,null);
insert into department
values (20,'College of Liberal Arts',null,null);

-- �渮�ο��� �ٹ��ϴ� ����� �̸��� �Ի��� ����ϱ�
SELECT e.ename, e.hiredate FROM emp e, dept d WHERE e.deptno = d.deptno and d.dname = '�渮��';
    
-- ANSI JOIN�� ����Ͽ� ��õ���� �ٹ��ϴ� ����̸��� �޿��� ���
SELECT e.ename, e.sal, d.loc FROM emp e JOIN dept d ON e.deptno = d.deptno AND loc = '��õ';

-- ������̺�� �μ����̺��� �����Ͽ� ����̸��� �μ���ȣ, �μ��� ���
SELECT e.ename, e.deptno, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno;

-- �渮�� �Ҽ� ����� �̸��� �Ի��� ���
SELECT ename, hiredate FROM emp e JOIN dept d ON e.deptno = d.deptno AND d.dname = '�渮��';

-- ������ ������ ��� �̸�, �μ��� ���
SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno AND e.job = '����';

--??? ���ӻ���� ���켺�� ������� �̸�, ���� ���
SELECT work.ename, work.job, manager.ename FROM emp work JOIN emp manager 
    ON work.mgr = manager.empno and manager.ename = '���켺';

-- ���켺�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ���
SELECT work.ename, friend.ename FROM emp work, emp friend 
    WHERE work.deptno = friend.deptno AND work.ename='���켺' and friend.ename <> '���켺';

-- ���������� �̿��Ͽ� '������'���� �ٹ��ϴ� ��� ����� �̸��� �޿��� ���
SELECT ename, sal FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dname = '������');

-- ���������� ����Ͽ� emp06�� emp���̺��� ��� �����͸� �߰�
CREATE TABLE emp06 AS SELECT * FROM emp;

-- emp06���̺� ����� ��� ���� �� ������� �ּ� �޿����� ���� �޿��� �޴� ������� �̸�, �޿�, ������ ����ϵ� ������ ������� �ʴ� SQL��
SELECT ename, sal, job FROM emp06 WHERE sal > (select min(sal) from emp06 where job = '����') AND job != '����';
SELECT ename, sal, job FROM emp06 WHERE sal > ANY (SELECT sal FROM emp06 WHERE job = '����') AND job != '����';

-- emp06 ���̺� ����� ��� ���� �� ��õ�� ��ġ�� �μ��� �Ҽӵ� ������� �޿��� 100 �λ��ϴ� SQL�� �ۼ�
UPDATE emp06 SET sal = sal+100 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '��õ');

-- emp06 ���̺��� �渮�ο� �Ҽӵ� ����鸸 �����ϴ� SQL��
DELETE emp06 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '�渮��');

-- '�̹���'�� ���� �μ��� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ����ϴ� SQL��
SELECT ename, deptno FROM emp06 WHERE deptno = (SELECT deptno FROM emp06 WHERE ename = '�̹���');

-- '�̹���'�� ������ ������ ���� ����� ����ϴ� SQL��
SELECT * FROM emp06 WHERE job = (SELECT job FROM emp06 WHERE ename = '�̹���');

-- '�̹���'�� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����ϴ� SQL��
SELECT ename, sal FROM emp06 WHERE sal >= (SELECT sal FROM emp06 WHERE ename = '�̹���') AND ename <> '�̹���';

-- '��õ'���� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ����ϴ� SQL��
SELECT ename, deptno FROM emp06 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '��õ');

-- ���ӻ���� ���켺�� ����� �̸��� �޿��� ����ϴ� SQL��
SELECT ename, sal FROM emp06 WHERE mgr = (SELECT empno FROM emp06 WHERE ename = '���켺');

-- �μ����� ���� �޿��� ���� �޴� ����� ����(�����ȣ, �̸�, �޿�, �μ���ȣ)�� ����ϴ� SQL��
SELECT empno, ename, sal, deptno FROM emp06 e 
WHERE sal = (SELECT max(sal) FROM emp06 WHERE deptno = e.deptno) order by deptno;

-- ����(JOB)�� ������ ����� ���� �μ��� �μ���ȣ�� �μ���, ������ ���
SELECT deptno, dname, loc FROM dept WHERE deptno IN (SELECT deptno FROM emp WHERE job = '����');

-- ���庸�� �޿��� ���� ���� ������� �̸��� �޿��� ������ ����ϵ� ������ ������� �ʴ� SQL��
SELECT ename, sal, job FROM emp06 WHERE sal > ANY (SELECT sal FROM emp WHERE job = '����') AND job!='����';

-- Student ���̺�� department���̺��� ����Ͽ� 'Anthony  Hopkins'�л��� ����(deptno1)�� ������ �л����� �̸��� ����1 �̸��� ���
SELECT s.name "STUD_NAME" , d.dname "DEPT_NAME" FROM student s , department d
WHERE s.deptno1=d.deptno and s.deptno1 = ( SELECT deptno1 FROM student WHERE name='Anthony Hopkins') ;

-- professor���̺�� department���̺��� ��ȸ�Ͽ� 'Meg Ryan'�������� ���߿� �Ի��� ����� �̸��� �Ի��� �а����� ���
SELECT p.name, p.hiredate, d.dname FROM professor p, department d
WHERE p.deptno = d.deptno AND hiredate > (SELECT hiredate FROM professor WHERE name = 'Meg Ryan') ORDER BY hiredate;

-- student ���̺��� ����1�� 201���� �а��� ��� �����Ժ��� �����԰� ���� �л����� �̸��� �����Ը� ���
SELECT name, weight FROM student WHERE weight > (SELECT avg(weight) FROM student WHERE deptno1 = 201) ORDER BY weight;

-- emp2���̺��� ����Ͽ� ��ü ���� �� 'Section Head'������ �ּ� �����ں��� ������ ���� ����� �̸��� ���� ������ ����Ͻÿ�.
-- ��, ���� ��� ������ õ���� ���б�ȣ�� $ǥ�ø� �ϼ���.
SELECT name, position, TO_CHAR(pay, '$999,999,999') ���� FROM emp2 
WHERE pay > ANY (SELECT pay FROM emp2 WHERE position = 'Section head') AND position != 'Section head';

SELECT name, position, TO_CHAR(pay, '$999,999,999') ���� FROM emp2 
WHERE pay >(SELECT min(pay) FROM emp2 WHERE position = 'Section head') AND position != 'Section head';

-- student���̺��� ��ȸ�Ͽ� ��ü �л� �߿��� ü���� 2�г� ü�߿��� ���� ���� ������ �л����� �����԰� ���� �л��� �̸��� �г�� �����Ը� ���
SELECT name, grade, weight FROM student WHERE weight < (SELECT min(weight) FROM student WHERE grade = 2) ORDER BY weight;

-- emp2���̺�� dept2���̺��� ��ȸ�Ͽ� �� �μ��� ��� ������ ���ϰ� ���߿��� ��� ������ ���� ���� �μ��� ��� �������� ���� �޴� �������� �μ���, ������, ������ ���
SELECT dname, name, TO_CHAR(pay, '$999,999,999') 
FROM emp2 e JOIN dept2 d 
ON e.deptno = d.dcode 
AND e.pay < ALL (SELECT avg(pay) FROM emp2 e JOIN dept2 d ON e.deptno = d.dcode GROUP BY dname);

-- professor���̺�� department���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�, �а����� ���
-- (�Ի��� ������ �������� �����ϼ���)
SELECT profno, name, dname 
FROM department d JOIN professor p 
ON d.deptno = p.deptno 
AND p.hiredate IN (SELECT min(hiredate) FROM professor GROUP BY deptno) ORDER BY hiredate;

-- emp2 ���̺��� ��ȸ�Ͽ� ���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ �̸��� ����, ������ ���
-- ���������� �������� ����
SELECT name, position, TO_CHAR(pay,'$999,999,999') 
FROM emp2 
WHERE position is not null 
AND pay IN (SELECT max(pay) FROM emp2 GROUP BY position) 
ORDER BY pay;

SELECT name, position, to_char(pay, '$999,999,999')  
FROM emp2
WHERE (position, pay) IN (SELECT position, max(pay) FROM emp2 GROUP BY position);















