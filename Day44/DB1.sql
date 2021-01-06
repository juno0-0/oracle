create table employee(emp_no number(4) primary key,
                      emp_name varchar2(20) not null,
                      salary number(6),
                      birthday date);
                      
create table employee(emp_no number(4) not null,
                      emp_name varchar2(20) not null,
                      salary number(6),
                      birthday date,
                      CONSTRAINT employee_PK PRIMARY key(emp_no));--�������� �⺻Ű �����ϴ� ��
                      
create table specialty(emp_no number(4) not null,
                       specialty varchar2(20) not null,
                       CONSTRAINT specialty_PK PRIMARY key(emp_no, specialty),--�� ���̺� �⺻Ű 2�� �ֱ�
                       CONSTRAINT specialty_FK FOREIGN key(emp_no) REFERENCES employee(emp_no));
                    -- specialty ���̺��� emp_no�� �ܷ�Ű�� ����� employee ���̺��� emp_no�� �����ϰڴ�.
                    
create table project(pro_no number(4) not null,
                     pro_content varchar2(100) not null,
                     start_date date,
                     finish_date date,
                     CONSTRAINT project_PK PRIMARY key(pro_no));
                     
create table assign(emp_no number(4) not null,
                    pro_no number(4) not null,
                    CONSTRAINT assign_PK PRIMARY key(emp_no, pro_no),
                    CONSTRAINT assign_FK FOREIGN key(emp_no) REFERENCES employee(emp_no),
                    CONSTRAINT assign_FK1 FOREIGN key(pro_no) REFERENCES project(pro_no));
                    
                    desc assign;
                    
create table emp01(
        empno number(4),
        ename varchar2(14),
        sal number(7,3));
                    
--���� ���̺��� ���� ����
desc emp02;
desc assign;

--���̺� ����(�߰�-add, ����-drop, ����-modify)
--���̺��� �÷��� �߰��ϱ�
alter table emp01 add test number(4);
alter table emp01 add memo varchar2(30);
--���̺��� �÷��� �����ϱ�
alter table emp01 modify ename varchar2(30);
alter table emp01 modify memo varchar2(50);
alter table emp01 modify sal number(5);
--���̺��� �÷��� �����ϱ�
alter table emp01 drop column memo;
--unused                     
alter table emp01 set unused (empno);
--unused �ٽ� ����� ��
alter table emp01 drop unused columns;

--���̺���� �ٲٱ�
rename emp01 to emp02;

--���̺� �����
drop table emp02;
insert into emp02 values('������', 500, 3);
insert into emp02 values('ä�츮', 300, 2);
insert into emp02 values('�����', 100, 1);

select * from emp02;

--���̺� �ڷ�(���ڵ�) �����, ��� ������ ����
truncate table emp02;

--������ ��ųʸ�
select table_name from user_tables;
select * from user_tables;

select owner, table_name from all_tables;

select * from dba_tables;

create table dept_mission(dno number(2),
                          dname varchar2(14),
                          loc varchar2(13));

desc dept_mission;

create table emp_mission(eno number(4),
                         ename varchar2(10),
                         dno number(2));

desc emp_mission;

alter table emp_mission modify ename varchar2(25);                 

drop table emp_mission;

alter table dept_mission set unused column dname;
alter table dept_mission drop unused columns;

alter table dept_mission set unused column loc;

alter table dept_mission drop unused columns;

rename dept_mission to depatrment;

desc depatrment;