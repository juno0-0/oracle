create table dept01(
    deptno number(4),
    dname varchar2(14),
    loc varchar2(13));
    
--��ü ���� �� �Է��ϱ�
insert into dept01(deptno, dname, loc) values(10,'�渮��','����');
insert into dept01(loc, dname, deptno) values('��õ','�����',20);

--�����ϱ�, ���� ������� �ڷḦ �ֱ�
insert into dept01 values(30, '������','�λ�');
--insert into dept01 values('�λ�', '������',30); (X)

select * from dept01;

--NULL�� ���ؼ� �Է��ϱ�
insert into dept01 values(50,'�λ��',null);--���� null�� �־���
insert into dept01 values(50, '�λ��', '');--�ƴϸ� Ȭ����ǥ�� �ش�.
--insert into dept01 values(50, '�λ��');--����θ� null�� ���°� �ƴ϶� �� ������ �ȵȴ�.
insert into dept01(deptno, dname) values(10,'�λ��');

--���̺� �����
create table emp02(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    hiredate date,
    deptno number(2));
    
desc emp02;

--������ �����ϱ�
INSERT INTO emp02 VALUES(1001, '������', '���', '2021/01/01',20);
INSERT INTO emp02 VALUES(1002, '�跮��', '�븮', TO_DATE('2021/01/10','yyyy-MM-dd'),10);
--�ý��ۿ��� ���� ��¥�� ��¥ �ڷ� �ֱ�
INSERT INTO emp02 VALUES(1003, 'ä�츮', '����', sysdate, 30);

select * from emp02;

--������ �����ϱ�
UPDATE dept01 SET dname = '�����' WHERE deptno = 10;
UPDATE emp02 SET job = 'ȸ��' WHERE ename = '������';

--deptno�� 50�� ��� '�ѹ���', ���� '����'
UPDATE dept01 SET dname = '�ѹ���', loc = '����' WHERE deptno = 50;

--������ ���� ����� �ٲٱ�
UPDATE dept01 SET loc = '����';

UPDATE dept01 SET deptno = deptno+1000;

--ó�� �����͸� �Է��� ���·� ���ư�
ROLLBACK;

commit;

SELECT * FROM dept01;

--������ �����ϱ�(��, ���ڵ�, Ʃ��, �ο�)
DELETE dept01 WHERE loc ='�λ�';
DELETE dept01 WHERE dname ='�����' and deptno=1020;
DELETE dept01;

CREATE TABLE employee03(
    empno number(4) not null,
    ename varchar2(20),
    job varchar2(20),
    sal number(7,3));

INSERT INTO employee03 values(1000,'ȫ�浿','���',100);
INSERT INTO employee03 values(1010,'�̼���','�븮',150);
INSERT INTO employee03 values(1020,'ȫ����','����',200);
INSERT INTO employee03 values(1030,'�ڰ��','�븮',150);
INSERT INTO employee03 values(1040,'�躴��','',50);
INSERT INTO employee03 values(1050,'���μ�',null,35);

SELECT * FROM employee03;


UPDATE employee03 SET sal = sal+50 WHERE sal < 200;
DELETE employee03 WHERE job is null;

DESC user_constraints
--�ش� DB���� ���̺� ���� �������� ��Ȳ���� ����
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONSTRAINTS;

SELECT * FROM emp02;

drop table emp02;

CREATE TABLE emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    hiredate date,
    deptno number(2));

--NOT NULL ��������
INSERT INTO emp02 values('', null, '���', sysdate, 20);--not null�� null�� �־ ���� �߻�
INSERT INTO emp02(empno, job, hiredate, deptno) values(1020,'���',sysdate,20);--ename���� null�� ���� ���� �߻�
INSERT INTO emp02 values(1010, '�λ��', '���', sysdate, 20);

INSERT INTO emp02 values(1010, '�λ��', '���', sysdate, 30);--not null���� unique�� primary key�� �ƴ϶� ��
INSERT INTO emp02 values(1010, '�λ��', '���', null, null);

--������ ���� ����ϴ� UNIQUE ���� ����
CREATE TABLE emp03(
    empno number(4) UNIQUE,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2));    

--���̺� ��������
desc emp03;

select * from user_constraints where table_name = 'EMP03';--�����Ϳ��� �빮�ڷ� ���ֱ� ������ �빮�ڷ� �ؾ���, �ҹ��ڷ� �ϸ� �ȳ���

--���������� �����͸� ����
insert into emp03 values(1010, '������', 'ȸ��', 10);
insert into emp03 values(1020, 'ä�츮', '���', 20);

--����Ű ���� ���� ����� �Է� �ȵǰ� �ϱ�
insert into emp03 values(1010, '������', '����', 30);--����Ű ����
insert into emp03 values(null, '������', '����', 30);--����Ű�� null�� ����

--���� ���ǿ� ��Ī�� �ο��ϱ�
--�̿�о� : ���������� ������ ��� �ϴ� ���, �������� �Ͻ�����

create table emp04(
    empno number(4) CONSTRAINT emp04_empno_UK UNIQUE,
    ename varchar2(10) CONSTRAINT emp04_ename_NN NOT NULL,
    job varchar2(9),
    deptno number(2));
    
select * from user_constraints where table_name = 'EMP04';

--PRIMARY KEY ��������
CREATE TABLE emp05(
    empno number(4) CONSTRAINT emp05_empno_PK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT emp05_ename_NN Not null,
    job varchar2(9),
    deptno number(2));
    
--�������� ������ �ֱ�
INSERT INTO emp05 values(1010,'a','���',10);
--UNIQUE ����
INSERT INTO emp05 values(1010,'a','���',10);
--NOT NULL ����
INSERT INTO emp05 values(null, 'a','���',10);
--���� ���� ���� ����
select * from user_constraints where table_name='EMP05';

CREATE TABLE dept(deptno NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
                    dname VARCHAR2(14),
                    loc VARCHAR2(13));

INSERT INTO dept(deptno, dname, loc) values (10, '�渮��', '����');
INSERT INTO dept(deptno, dname, loc) values (20, '�λ��', '��õ');
INSERT INTO dept VALUES (30, '������', '����');
INSERT INTO dept VALUES (40, '�����', '����');

--FOREIGN KEY ��������
CREATE TABLE emp06(
    empno number(4) CONSTRAINT emp06_empno_PK primary key,
    ename varchar2(10) CONSTRAINT emp06_ename_NN not null,
    job varchar2(9),
    deptno number(2) CONSTRAINT emp06_deptno_FK REFERENCES dept(deptno));
    

    
desc dept;
select * from user_constraints where table_name = 'DEPT';
--dept ���̺��� �ڷ� �˻�
select * from dept;

insert into emp06 values(1010,'ȫ�浿','���', 10);
insert into emp06 values(1020,'ȫ�浿','���', 30);

--�ܷ�Ű�� ����ǰ� �ڷ� �ֱ�
insert into emp06 values(1010,'ȫ�浿','���', 60);--60�� �⺻Ű�� ���� �����Ͷ� ����
select * from emp06;

CREATE TABLE emp07(
    empno number(4) CONSTRAINT emp07_empno_PK primary key,
    ename varchar2(10) CONSTRAINT emp07_ename_NN not null,
    job varchar2(9),
    deptno number(2),
    loc varchar2(13) CONSTRAINT emp07_loc_FK REFERENCES dept(loc));
    --���⼭ �������� ������ loc�� unique�� primary key�� �ƴ϶�

select constraint_name, table_name, column_name from user_cons_columns;--column �̸� ��ȸ�ϱ�

--CHECK ��������
CREATE TABLE emp07(
    empno number(4) CONSTRAINT emp07_empno_PK PRIMARY key,
    ename varchar2(10) CONSTRAINT emp07_empno_NN not null,
    sal number(7,2) CONSTRAINT emp07_sal_CK check(sal between 500 and 5000),--��ȣ �ȿ� ������ �ش�.
    gender varchar2(1) CONSTRAINT emp07_gender_CK check(gender in('M','m','F','f')));
    
--���� �Է�
insert into emp07 values(1010,'ȫ�浿',1000,'M');
--���� �Է�
--sal���� ����
insert into emp07 values(1010,'ȫ�浿',200,'M');
--gender���� ����
insert into emp07 values(1010,'ȫ�浿',1000,'C');

--DEFAULT ��������
create table dept03(
    deptno number(2) CONSTRAINT dept01_deptno_pk PRIMARY key,
    dname varchar2(14),
    loc varchar2(13) default '����');
    
--���� �Է�
insert into dept03 values(10, '�λ��', '��õ');
--loc �����ϰ� �Է��ϱ�
insert into dept03(deptno, dname) values(30, '�����');
    
-- ���� ���� ����� ��� : 1. �÷����� ��������, 2. ���̺� ���� ��� ��������(����Ű, alter table�� ���� ������ ���߿� �߰��� ��)
-- �÷� ���� ���� ���ǰ� ������ ���� ����� ���� ����
create table emp01(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9) unique,
    deptno number(2) REFERENCES dept(deptno));

create table emp02(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),    
    CONSTRAINT emp02_empno_PK PRIMARY key(empno),
    CONSTRAINT emp02_job_UK unique(job),
    CONSTRAINT emp02_deptno_fk FOREIGN key(deptno) REFERENCES dept(deptno));

create table emp03(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),    
    PRIMARY key(empno),
    unique(job),
    FOREIGN key(deptno) REFERENCES dept(deptno));

--user_constraints ������ ��ųʸ� �˻�
select * from user_constraints where table_name like 'EMP%';

--�⺻Ű�� ����Ű�� �����ϴ� ���
--�̸��� ��ȭ��ȣ�� �����Ͽ� �⺻Ű�� �����ϱ�
create table member01(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member01_name_phone_pk primary key(name, phone));
    
--���� �Է�
insert into member01 values('b', 'seoul','456');

select * from member01;