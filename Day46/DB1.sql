--컬럼 레벨 방식의 제약조건
CREATE TABLE emp01(
    empno number(4) PRIMARY KEY,
    ename varchar2(10) NOT NULL,
    job varchar2(9) UNIQUE,
    deptno number(2) REFERENCES dept(deptno));
    
--테이블 레벨 방식의 제약조건
CREATE TABLE emp02(
    empno number(4),
    ename varchar2(10) NOT NULL,--NOT NULL은 컬럼 레벨 방식의 제약조건만 가능
    job varchar2(9),
    deptno number(2),
    PRIMARY KEY(empno),
    UNIQUE(job),
    FOREIGN KEY(deptno) REFERENCES dept(deptno));
  
--복합키    
CREATE TABLE member01(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member01_name_phone_PK PRIMARY KEY(phone, name,address));
--정상 입력
INSERT INTO member01 VALUES('a','seoul','123');
INSERT INTO member01 VALUES('b','seoul','123');
INSERT INTO member01 VALUES('a','seoul','1234');
--오류
INSERT INTO member01 VALUES('a','seoul','123');

--복합키2
CREATE TABLE member02(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member02_name_phone_PK PRIMARY KEY(phone, name,address));
--정상입력
INSERT INTO member02 VALUES('a','seoul','123');
INSERT INTO member02 VALUES('b','seoul','123');
--오류입력
INSERT INTO member02 VALUES('a','seoul','123');

drop table emp01;

create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2));
    
--기본키 추가하기
ALTER TABLE emp01 ADD CONSTRAINT emp01_empno_PK PRIMARY KEY(empno);
--외래키 추가하기
ALTER TABLE emp01 ADD CONSTRAINT emp01_deptno_FK FOREIGN KEY(deptno) REFERENCES dept(deptno);
--UNIQUE 추가하기
ALTER TABLE emp01 ADD CONSTRAINT emp01_job_UK UNIQUE(job);
--NOT NULL 추가하기
ALTER TABLE emp01 MODIFY ename CONSTRAINT emp01_ename_NN NOT NULL;

--제약조건 제거하기
ALTER TABLE emp01 DROP PRIMARY KEY;
ALTER TABLE emp01 DROP CONSTRAINT emp01_empno_PK;
ALTER TABLE emp01 DROP CONSTRAINT emp01_deptno_FK;
ALTER TABLE emp01 DROP CONSTRAINT emp01_ename_NN;
ALTER TABLE emp01 DROP CONSTRAINT emp01_job_UK;

SELECT * FROM dept;
SELECT * FROM emp;

--삭제가 안된다.
DELETE dept where deptno = 10;
--삭제1) emp테이블의 외래키 조건을 삭제

drop table dept01;
CREATE TABLE dept01(
    deptno number(2) constraint dept05_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13) );

INSERT INTO dept01 values(10,'경리부','서울');
INSERT INTO dept01 values(20,'인사부','인천');
            
drop table emp01;
create table emp01(
    empno number(4),
    ename varchar2(10) CONSTRAINT emp01_ename_nn NOT NULL,
    job varchar2(9),
    deptno number(2),
    CONSTRAINT emp01_empno_PK PRIMARY KEY(empno),
    CONSTRAINT emp01_job_UK UNIQUE(job),
    CONSTRAINT emp01_deptno_FK FOREIGN KEY(deptno) REFERENCES dept01(deptno));
    
insert into emp01 values(1000,'허준','사원',10);
insert into emp01 values(1001,'허준','대리',10);

delete from dept01 where deptno = 10;

select * from dept01;
select * from emp01;

--삭제2) 비활성화
ALTER TABLE emp01 DISABLE CONSTRAINT emp01_deptno_fk;
delete from dept01 where deptno = 10;

--활성화
ALTER TABLE emp01 ENABLE CONSTRAINT emp01_deptno_fk;

--부모테이블의 기본키 제약 조건을 비활성화 시키기
--자식테이블이 있기 때문에 오류 발생
alter table dept01 disable primary key;
alter table dept01 disable primary key cascade;
--부모테이블 기본키 활성화
alter table dept01 enable primary key;
--자식테이블 외래키 활성화


--오류 발생, dept테이블의 기본키는 emp테이블의 외래키에서 참조하기 때문에 제약조건을 삭제할 수 없음
alter table dept01 drop primary key;

--부모테이블의 기본키와 자식테이블의 외래키 전부 삭제
alter table dept01 drop primary key cascade;


SELECT constraint_name, table_name, column_name FROM USER_CONS_COLUMNS WHERE table_name = 'EMP';
SELECT status FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP01';
SELECT status FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT01';
commit;

--직원테이블
create table employee01(
    emp_no number(4),
    emp_name varchar2(20),
    salary number(6),
    birthday date);

--프로젝트테이블
create table project01(
    pro_no number(4),
    pro_content varchar2(100),
    start_date date,
    finish_date date);

--특기테이블
create table specialty01(
    emp_no number(4),
    specialty varchar2(20));
    
--담당테이블
create table assign01(
    emp_no number(4),
    pro_no number(4));

--직원테이블 기본키 추가하기
alter table employee01 add CONSTRAINT employee01_pk PRIMARY KEY(emp_no);
--프로젝트테이블 기본키 추가하기
alter table project01 add CONSTRAINT project01_pk PRIMARY KEY(pro_no);
--특기테이블 기본키 추가하기
alter table specialty01 add CONSTRAINT specialty01_pk PRIMARY KEY(emp_no, specialty);
--담당테이블 기본키 추가하기
alter table assign01 add CONSTRAINT assign01_pk PRIMARY KEY(emp_no, pro_no);
--특기테이블 외래키를 추가하기
alter table specialty01 add CONSTRAINT specialty01_fk FOREIGN KEY(emp_no) REFERENCES employee01(emp_no);
--담당테이블 외래키를 추가하기
alter table assign01 add CONSTRAINT assign01_project_fk FOREIGN KEY(pro_no) REFERENCES project01(pro_no);
alter table assign01 add CONSTRAINT assign01_employee_fk FOREIGN KEY(emp_no) REFERENCES employee01(emp_no);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMPLOYEE01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PROJECT01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'SPECIALTY01';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'ASSIGN01';

select * from dept;
select * from emp;

select * from emp where ename ='이문세';
select * from dept where deptno = '10';
--Cross join : 전체 집합 레코드 수 = 테이블1 레코드수 x 테이블2 레코드 수
select empno, emp.deptno, dname from dept, emp;

select empno, ename, emp.deptno, dept.deptno from emp, dept where emp.deptno = dept.deptno;
--수행 순서
--from emp, dept --> where emp.deptno = dept.deptno --> *

--이문세의 이름과 소속 부서 출력하기
select ename, dname from emp, dept where emp.deptno = dept.deptno and ename = '이문세'

--컬럼명의 모호성 해결
--select ename, deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = '이문세'
select ename, emp.deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = '이문세'

--테이블명에 별칭 붙이기
select ename, dname from emp 뀨, dept 꾸 where 뀨.deptno = 꾸.deptno and ename = '이문세';

--NON-EQUI JOIN
select * from salgrade;
--급여의 등급은 총 5등급으로 나눠져있음
select ename, sal, grade from emp, salgrade where sal between losal and hisal; 

--ename, dname, sal, grade
select ename, dname, sal, grade from emp e, dept d, salgrade s where e.deptno = d.deptno and e.sal between s.losal and s.hisal order by grade desc;

--SELF JOIN
select empno, ename, mgr from emp;
--출력 결과 ename, mname 김사랑 박중훈
select e1.ename star, e2.ename manager from emp e1, emp e2 where e1.mgr = e2.empno;

--ANSI INNER JOIN
select ename, dname from emp, dept where emp.deptno = dept.deptno;
select * from emp cross join dept;
select * from emp full outer join dept on emp.deptno = dept.deptno;
select * from emp inner join dept on emp.deptno = dept.deptno;
select ename, dname from emp, dept where emp.deptno = dept.deptno and ename = '이문세';
select ename, dname from emp inner join dept on emp.deptno = dept.deptno and ename = '이문세';

select * from emp left outer join dept on emp.deptno = dept.deptno;
select * from emp right outer join dept on emp.deptno = dept.deptno;


    
