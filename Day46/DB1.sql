--�÷� ���� ����� ��������
CREATE TABLE emp01(
    empno number(4) PRIMARY KEY,
    ename varchar2(10) NOT NULL,
    job varchar2(9) UNIQUE,
    deptno number(2) REFERENCES dept(deptno));
    
--���̺� ���� ����� ��������
CREATE TABLE emp02(
    empno number(4),
    ename varchar2(10) NOT NULL,--NOT NULL�� �÷� ���� ����� �������Ǹ� ����
    job varchar2(9),
    deptno number(2),
    PRIMARY KEY(empno),
    UNIQUE(job),
    FOREIGN KEY(deptno) REFERENCES dept(deptno));
  
--����Ű    
CREATE TABLE member01(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member01_name_phone_PK PRIMARY KEY(phone, name,address));
--���� �Է�
INSERT INTO member01 VALUES('a','seoul','123');
INSERT INTO member01 VALUES('b','seoul','123');
INSERT INTO member01 VALUES('a','seoul','1234');
--����
INSERT INTO member01 VALUES('a','seoul','123');

--����Ű2
CREATE TABLE member02(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member02_name_phone_PK PRIMARY KEY(phone, name,address));
--�����Է�
INSERT INTO member02 VALUES('a','seoul','123');
INSERT INTO member02 VALUES('b','seoul','123');
--�����Է�
INSERT INTO member02 VALUES('a','seoul','123');

drop table emp01;

create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2));
    
--�⺻Ű �߰��ϱ�
ALTER TABLE emp01 ADD CONSTRAINT emp01_empno_PK PRIMARY KEY(empno);
--�ܷ�Ű �߰��ϱ�
ALTER TABLE emp01 ADD CONSTRAINT emp01_deptno_FK FOREIGN KEY(deptno) REFERENCES dept(deptno);
--UNIQUE �߰��ϱ�
ALTER TABLE emp01 ADD CONSTRAINT emp01_job_UK UNIQUE(job);
--NOT NULL �߰��ϱ�
ALTER TABLE emp01 MODIFY ename CONSTRAINT emp01_ename_NN NOT NULL;

--�������� �����ϱ�
ALTER TABLE emp01 DROP PRIMARY KEY;
ALTER TABLE emp01 DROP CONSTRAINT emp01_empno_PK;
ALTER TABLE emp01 DROP CONSTRAINT emp01_deptno_FK;
ALTER TABLE emp01 DROP CONSTRAINT emp01_ename_NN;
ALTER TABLE emp01 DROP CONSTRAINT emp01_job_UK;

SELECT * FROM dept;
SELECT * FROM emp;

--������ �ȵȴ�.
DELETE dept where deptno = 10;
--����1) emp���̺��� �ܷ�Ű ������ ����

drop table dept01;
CREATE TABLE dept01(
    deptno number(2) constraint dept05_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13) );

INSERT INTO dept01 values(10,'�渮��','����');
INSERT INTO dept01 values(20,'�λ��','��õ');
            
drop table emp01;
create table emp01(
    empno number(4),
    ename varchar2(10) CONSTRAINT emp01_ename_nn NOT NULL,
    job varchar2(9),
    deptno number(2),
    CONSTRAINT emp01_empno_PK PRIMARY KEY(empno),
    CONSTRAINT emp01_job_UK UNIQUE(job),
    CONSTRAINT emp01_deptno_FK FOREIGN KEY(deptno) REFERENCES dept01(deptno));
    
insert into emp01 values(1000,'����','���',10);
insert into emp01 values(1001,'����','�븮',10);

delete from dept01 where deptno = 10;

select * from dept01;
select * from emp01;

--����2) ��Ȱ��ȭ
ALTER TABLE emp01 DISABLE CONSTRAINT emp01_deptno_fk;
delete from dept01 where deptno = 10;

--Ȱ��ȭ
ALTER TABLE emp01 ENABLE CONSTRAINT emp01_deptno_fk;

--�θ����̺��� �⺻Ű ���� ������ ��Ȱ��ȭ ��Ű��
--�ڽ����̺��� �ֱ� ������ ���� �߻�
alter table dept01 disable primary key;
alter table dept01 disable primary key cascade;
--�θ����̺� �⺻Ű Ȱ��ȭ
alter table dept01 enable primary key;
--�ڽ����̺� �ܷ�Ű Ȱ��ȭ


--���� �߻�, dept���̺��� �⺻Ű�� emp���̺��� �ܷ�Ű���� �����ϱ� ������ ���������� ������ �� ����
alter table dept01 drop primary key;

--�θ����̺��� �⺻Ű�� �ڽ����̺��� �ܷ�Ű ���� ����
alter table dept01 drop primary key cascade;


SELECT constraint_name, table_name, column_name FROM USER_CONS_COLUMNS WHERE table_name = 'EMP';
SELECT status FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP01';
SELECT status FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT01';
commit;

--�������̺�
create table employee01(
    emp_no number(4),
    emp_name varchar2(20),
    salary number(6),
    birthday date);

--������Ʈ���̺�
create table project01(
    pro_no number(4),
    pro_content varchar2(100),
    start_date date,
    finish_date date);

--Ư�����̺�
create table specialty01(
    emp_no number(4),
    specialty varchar2(20));
    
--������̺�
create table assign01(
    emp_no number(4),
    pro_no number(4));

--�������̺� �⺻Ű �߰��ϱ�
alter table employee01 add CONSTRAINT employee01_pk PRIMARY KEY(emp_no);
--������Ʈ���̺� �⺻Ű �߰��ϱ�
alter table project01 add CONSTRAINT project01_pk PRIMARY KEY(pro_no);
--Ư�����̺� �⺻Ű �߰��ϱ�
alter table specialty01 add CONSTRAINT specialty01_pk PRIMARY KEY(emp_no, specialty);
--������̺� �⺻Ű �߰��ϱ�
alter table assign01 add CONSTRAINT assign01_pk PRIMARY KEY(emp_no, pro_no);
--Ư�����̺� �ܷ�Ű�� �߰��ϱ�
alter table specialty01 add CONSTRAINT specialty01_fk FOREIGN KEY(emp_no) REFERENCES employee01(emp_no);
--������̺� �ܷ�Ű�� �߰��ϱ�
alter table assign01 add CONSTRAINT assign01_project_fk FOREIGN KEY(pro_no) REFERENCES project01(pro_no);
alter table assign01 add CONSTRAINT assign01_employee_fk FOREIGN KEY(emp_no) REFERENCES employee01(emp_no);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMPLOYEE01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PROJECT01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'SPECIALTY01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'ASSIGN01';

select * from dept;
select * from emp;

select * from emp where ename ='�̹���';
select * from dept where deptno = '10';
--Cross join : ��ü ���� ���ڵ� �� = ���̺�1 ���ڵ�� x ���̺�2 ���ڵ� ��
select empno, emp.deptno, dname from dept, emp;

select empno, ename, emp.deptno, dept.deptno from emp, dept where emp.deptno = dept.deptno;
--���� ����
--from emp, dept --> where emp.deptno = dept.deptno --> *

--�̹����� �̸��� �Ҽ� �μ� ����ϱ�
select ename, dname from emp, dept where emp.deptno = dept.deptno and ename = '�̹���'

--�÷����� ��ȣ�� �ذ�
--select ename, deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = '�̹���'
select ename, emp.deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = '�̹���'

--���̺�� ��Ī ���̱�
select ename, dname from emp ��, dept �� where ��.deptno = ��.deptno and ename = '�̹���';

--NON-EQUI JOIN
select * from salgrade;
--�޿��� ����� �� 5������� ����������
select ename, sal, grade from emp, salgrade where sal between losal and hisal; 

--ename, dname, sal, grade
select ename, dname, sal, grade from emp e, dept d, salgrade s where e.deptno = d.deptno and e.sal between s.losal and s.hisal order by grade desc;

--SELF JOIN
select empno, ename, mgr from emp;
--��� ��� ename, mname ���� ������
select e1.ename star, e2.ename manager from emp e1, emp e2 where e1.mgr = e2.empno;

--ANSI INNER JOIN
select ename, dname from emp, dept where emp.deptno = dept.deptno;
select * from emp cross join dept;
select * from emp full outer join dept on emp.deptno = dept.deptno;
select * from emp inner join dept on emp.deptno = dept.deptno;
select ename, dname from emp, dept where emp.deptno = dept.deptno and ename = '�̹���';
select ename, dname from emp inner join dept on emp.deptno = dept.deptno and ename = '�̹���';

select * from emp left outer join dept on emp.deptno = dept.deptno;
select * from emp right outer join dept on emp.deptno = dept.deptno;


    
