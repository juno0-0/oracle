create table dept01(
    deptno number(4),
    dname varchar2(14),
    loc varchar2(13));
    
--전체 형식 다 입력하기
insert into dept01(deptno, dname, loc) values(10,'경리부','서울');
insert into dept01(loc, dname, deptno) values('인천','전산부',20);

--생략하기, 구조 순서대로 자료를 넣기
insert into dept01 values(30, '영업부','부산');
--insert into dept01 values('부산', '영업부',30); (X)

select * from dept01;

--NULL에 대해서 입력하기
insert into dept01 values(50,'인사부',null);--직접 null을 넣어줌
insert into dept01 values(50, '인사부', '');--아니면 홑따옴표를 준다.
--insert into dept01 values(50, '인사부');--비워두면 null이 들어가는게 아니라 행 삽입이 안된다.
insert into dept01(deptno, dname) values(10,'인사부');

--테이블 만들기
create table emp02(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    hiredate date,
    deptno number(2));
    
desc emp02;

--데이터 삽입하기
INSERT INTO emp02 VALUES(1001, '이지은', '사원', '2021/01/01',20);
INSERT INTO emp02 VALUES(1002, '김량희', '대리', TO_DATE('2021/01/10','yyyy-MM-dd'),10);
--시스템에서 오늘 날짜로 날짜 자료 넣기
INSERT INTO emp02 VALUES(1003, '채우리', '과장', sysdate, 30);

select * from emp02;

--데이터 수정하기
UPDATE dept01 SET dname = '생산부' WHERE deptno = 10;
UPDATE emp02 SET job = '회장' WHERE ename = '이지은';

--deptno가 50인 경우 '총무부', 지역 '서울'
UPDATE dept01 SET dname = '총무부', loc = '서울' WHERE deptno = 50;

--지역을 전부 서울로 바꾸기
UPDATE dept01 SET loc = '서울';

UPDATE dept01 SET deptno = deptno+1000;

--처음 데이터를 입력한 상태로 돌아감
ROLLBACK;

commit;

SELECT * FROM dept01;

--데이터 삭제하기(행, 레코드, 튜플, 로우)
DELETE dept01 WHERE loc ='부산';
DELETE dept01 WHERE dname ='전산부' and deptno=1020;
DELETE dept01;

CREATE TABLE employee03(
    empno number(4) not null,
    ename varchar2(20),
    job varchar2(20),
    sal number(7,3));

INSERT INTO employee03 values(1000,'홍길동','사원',100);
INSERT INTO employee03 values(1010,'이순신','대리',150);
INSERT INTO employee03 values(1020,'홍명진','과장',200);
INSERT INTO employee03 values(1030,'박경미','대리',150);
INSERT INTO employee03 values(1040,'김병진','',50);
INSERT INTO employee03 values(1050,'박인수',null,35);

SELECT * FROM employee03;


UPDATE employee03 SET sal = sal+50 WHERE sal < 200;
DELETE employee03 WHERE job is null;

DESC user_constraints
--해당 DB안의 테이블에 대한 제약조건 상황등을 보기
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

--NOT NULL 제약조건
INSERT INTO emp02 values('', null, '사원', sysdate, 20);--not null에 null을 넣어서 오류 발생
INSERT INTO emp02(empno, job, hiredate, deptno) values(1020,'사원',sysdate,20);--ename에는 null이 들어가서 오류 발생
INSERT INTO emp02 values(1010, '인사부', '사원', sysdate, 20);

INSERT INTO emp02 values(1010, '인사부', '사원', sysdate, 30);--not null이지 unique나 primary key가 아니라서 들어감
INSERT INTO emp02 values(1010, '인사부', '사원', null, null);

--유일한 값만 허용하는 UNIQUE 제약 조건
CREATE TABLE emp03(
    empno number(4) UNIQUE,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2));    

--테이블 구조보기
desc emp03;

select * from user_constraints where table_name = 'EMP03';--데이터에서 대문자로 되있기 때문에 대문자로 해야함, 소문자로 하면 안나옴

--정상적으로 데이터를 삽입
insert into emp03 values(1010, '이지은', '회장', 10);
insert into emp03 values(1020, '채우리', '사원', 20);

--유일키 제약 조건 위배로 입력 안되게 하기
insert into emp03 values(1010, '이지은', '부장', 30);--유일키 위배
insert into emp03 values(null, '이지은', '부장', 30);--유일키는 null이 가능

--제약 조건에 명칭을 부여하기
--이용분야 : 제약조건을 여러개 줘야 하는 경우, 제약조건 일시정지

create table emp04(
    empno number(4) CONSTRAINT emp04_empno_UK UNIQUE,
    ename varchar2(10) CONSTRAINT emp04_ename_NN NOT NULL,
    job varchar2(9),
    deptno number(2));
    
select * from user_constraints where table_name = 'EMP04';

--PRIMARY KEY 제약조건
CREATE TABLE emp05(
    empno number(4) CONSTRAINT emp05_empno_PK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT emp05_ename_NN Not null,
    job varchar2(9),
    deptno number(2));
    
--정상으로 데이터 넣기
INSERT INTO emp05 values(1010,'a','사원',10);
--UNIQUE 위배
INSERT INTO emp05 values(1010,'a','사원',10);
--NOT NULL 위배
INSERT INTO emp05 values(null, 'a','사원',10);
--제약 조건 상태 보기
select * from user_constraints where table_name='EMP05';

CREATE TABLE dept(deptno NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
                    dname VARCHAR2(14),
                    loc VARCHAR2(13));

INSERT INTO dept(deptno, dname, loc) values (10, '경리부', '서울');
INSERT INTO dept(deptno, dname, loc) values (20, '인사부', '인천');
INSERT INTO dept VALUES (30, '영업부', '용인');
INSERT INTO dept VALUES (40, '전산부', '수원');

--FOREIGN KEY 제약조건
CREATE TABLE emp06(
    empno number(4) CONSTRAINT emp06_empno_PK primary key,
    ename varchar2(10) CONSTRAINT emp06_ename_NN not null,
    job varchar2(9),
    deptno number(2) CONSTRAINT emp06_deptno_FK REFERENCES dept(deptno));
    

    
desc dept;
select * from user_constraints where table_name = 'DEPT';
--dept 테이블의 자료 검색
select * from dept;

insert into emp06 values(1010,'홍길동','사원', 10);
insert into emp06 values(1020,'홍길동','사원', 30);

--외래키에 위배되게 자료 넣기
insert into emp06 values(1010,'홍길동','사원', 60);--60은 기본키에 없는 데이터라서 오류
select * from emp06;

CREATE TABLE emp07(
    empno number(4) CONSTRAINT emp07_empno_PK primary key,
    ename varchar2(10) CONSTRAINT emp07_ename_NN not null,
    job varchar2(9),
    deptno number(2),
    loc varchar2(13) CONSTRAINT emp07_loc_FK REFERENCES dept(loc));
    --여기서 오류나는 이유는 loc는 unique나 primary key가 아니라서

select constraint_name, table_name, column_name from user_cons_columns;--column 이름 조회하기

--CHECK 제약조건
CREATE TABLE emp07(
    empno number(4) CONSTRAINT emp07_empno_PK PRIMARY key,
    ename varchar2(10) CONSTRAINT emp07_empno_NN not null,
    sal number(7,2) CONSTRAINT emp07_sal_CK check(sal between 500 and 5000),--괄호 안에 조건을 준다.
    gender varchar2(1) CONSTRAINT emp07_gender_CK check(gender in('M','m','F','f')));
    
--정상 입력
insert into emp07 values(1010,'홍길동',1000,'M');
--위배 입력
--sal에서 위배
insert into emp07 values(1010,'홍길동',200,'M');
--gender에서 위배
insert into emp07 values(1010,'홍길동',1000,'C');

--DEFAULT 제약조건
create table dept03(
    deptno number(2) CONSTRAINT dept01_deptno_pk PRIMARY key,
    dname varchar2(14),
    loc varchar2(13) default '서울');
    
--정상 입력
insert into dept03 values(10, '인사부', '인천');
--loc 생략하고 입력하기
insert into dept03(deptno, dname) values(30, '생산부');
    
-- 제약 조건 만드는 방식 : 1. 컬럼레벨 제약조건, 2. 테이블 레벨 방식 제약조건(복합키, alter table로 제약 조건을 나중에 추가할 때)
-- 컬럼 레벨 제약 조건과 데이터 레벨 방식의 제약 조건
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

--user_constraints 데이터 딕셔너리 검색
select * from user_constraints where table_name like 'EMP%';

--기본키를 복합키로 지정하는 방법
--이름과 전화번호를 결합하여 기본키로 지정하기
create table member01(
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    CONSTRAINT member01_name_phone_pk primary key(name, phone));
    
--정상 입력
insert into member01 values('b', 'seoul','456');

select * from member01;