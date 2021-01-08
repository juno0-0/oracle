CREATE TABLE emp08
AS
SELECT * FROM emp WHERE deptno = 100;

CREATE TABLE dept02
AS
SELECT * FROM dept WHERE loc='a';

INSERT INTO dept02 VALUES(50, '보안부', '서울');
INSERT INTO dept02 SELECT * FROM dept;

ALTER TABLE dept02
    ADD memo varchar2(10);
    
CREATE TABLE dept03(
    deptno01 number(2),
    dname1 varchar2(14),
    loc1 varchar2(13));
-- 두 개의 테이블 구조가 같은데 컬럼명이 다르면 삽입된다.
INSERT INTO dept03 SELECT * FROM dept;

-- 한쪽의 테이블 구조가 1적으면 dept04, 2많으면 dept05
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

-- 두개의 테이블의 구조 순서가 다르고 컬럼의 내용은 같을 때
CREATE TABLE dept06(
    dname1 varchar2(14),
    deptno number(2),
    loc1 varchar2(13));
INSERT INTO dept06(deptno, dname1, loc1) SELECT * FROM dept;--o
INSERT INTO dept06 SELECT deptno, dname1, loc1 FROM dept; --위와 같음

select * from dept03;
-- 20번 부서의 지역명을 40번 부서의 지역명으로 바꾸기(20번 부서 지역 = 인천 --> 수원)
UPDATE dept03 SET loc ='수원' WHERE deptno = 20;--20번의 지역을 수원으로 바꾸기
SELECT loc FROM dept03 WHERE deptno=40;--수원 구하기
UPDATE dept03 SET loc =(SELECT loc FROM dept03 WHERE deptno=40) WHERE deptno = 20;--서브쿼리 사용

SELECT * FROM emp02;
-- 사원테이블에서 '영업부'인 사원 삭제하기
SELECT deptno FROM dept WHERE dname = '영업부';
DELETE emp02 WHERE deptno = 30;
DELETE emp02 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '영업부');

-- 부서 테이블 제거하기
DROP TABLE EMP;

-- 사원 테이블 제거하기
DROP TABLE DEPT;

-- 급여 테이블 제거하기
DROP TABLE SALGRADE;

-- 부서 테이블 제거하기
DROP TABLE EMPLOYEE;

-- 사원 테이블 제거하기
DROP TABLE DEPARTMENT;

-- 급여 테이블 제거하기
DROP TABLE SALGRADE;

?

-- 부서 테이블 생성하기
CREATE TABLE DEPT(
DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) ) ;

-- 사원 테이블 생성하기
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

-- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER );

?

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');

?

-- 부서 테이블에 샘플 데이터 추가하기

INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250, 80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500, 100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450, 200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500, 0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

?

-- 급여 테이블에 샘플 데이터 추가하기

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

-- 경리부에서 근무하는 사원의 이름과 입사일 출력하기
SELECT e.ename, e.hiredate FROM emp e, dept d WHERE e.deptno = d.deptno and d.dname = '경리부';
    
-- ANSI JOIN을 사용하여 인천에서 근무하는 사원이름과 급여를 출력
SELECT e.ename, e.sal, d.loc FROM emp e JOIN dept d ON e.deptno = d.deptno AND loc = '인천';

-- 사원테이블과 부서테이블을 조인하여 사원이름과 부서번호, 부서명 출력
SELECT e.ename, e.deptno, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno;

-- 경리부 소속 사원의 이름과 입사일 출력
SELECT ename, hiredate FROM emp e JOIN dept d ON e.deptno = d.deptno AND d.dname = '경리부';

-- 직급이 과장인 사원 이름, 부서명 출력
SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno AND e.job = '과장';

--??? 직속상관이 감우성인 사원들의 이름, 직급 출력
SELECT work.ename, work.job, manager.ename FROM emp work JOIN emp manager 
    ON work.mgr = manager.empno and manager.ename = '감우성';

-- 감우성과 동일한 근무지에서 근무하는 사원의 이름을 출력
SELECT work.ename, friend.ename FROM emp work, emp friend 
    WHERE work.deptno = friend.deptno AND work.ename='감우성' and friend.ename <> '감우성';

-- 서브쿼리를 이용하여 '영업부'에서 근무하는 모든 사원의 이름과 급여를 출력
SELECT ename, sal FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dname = '영업부');

-- 서브쿼리를 사용하여 emp06에 emp테이블의 모든 데이터를 추가
CREATE TABLE emp06 AS SELECT * FROM emp;

-- emp06테이블에 저장된 사원 정보 중 과장들의 최소 급여보다 많은 급여를 받는 사원들의 이름, 급여, 직급을 출력하되 과장은 출력하지 않는 SQL문
SELECT ename, sal, job FROM emp06 WHERE sal > (select min(sal) from emp06 where job = '과장') AND job != '과장';
SELECT ename, sal, job FROM emp06 WHERE sal > ANY (SELECT sal FROM emp06 WHERE job = '과장') AND job != '과장';

-- emp06 테이블에 저장된 사원 정보 중 인천에 위치한 부서에 소속된 사원들의 급여를 100 인상하는 SQL문 작성
UPDATE emp06 SET sal = sal+100 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '인천');

-- emp06 테이블에서 경리부에 소속된 사원들만 삭제하는 SQL문
DELETE emp06 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '경리부');

-- '이문세'와 같은 부서에 근무하는 사원의 이름, 부서번호를 출력하는 SQL문
SELECT ename, deptno FROM emp06 WHERE deptno = (SELECT deptno FROM emp06 WHERE ename = '이문세');

-- '이문세'와 동일한 직급을 가진 사원을 출력하는 SQL문
SELECT * FROM emp06 WHERE job = (SELECT job FROM emp06 WHERE ename = '이문세');

-- '이문세'와 급여가 동일하거나 더 많이 받는 사원명과 급여를 출력하는 SQL문
SELECT ename, sal FROM emp06 WHERE sal >= (SELECT sal FROM emp06 WHERE ename = '이문세') AND ename <> '이문세';

-- '인천'에서 근무하는 사원의 이름, 부서번호를 출력하는 SQL문
SELECT ename, deptno FROM emp06 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '인천');

-- 직속상관이 감우성인 사원의 이름과 급여를 출력하는 SQL문
SELECT ename, sal FROM emp06 WHERE mgr = (SELECT empno FROM emp06 WHERE ename = '감우성');

-- 부서별로 가장 급여를 많이 받는 사원의 정보(사원번호, 이름, 급여, 부서번호)를 출력하는 SQL문
SELECT empno, ename, sal, deptno FROM emp06 e 
WHERE sal = (SELECT max(sal) FROM emp06 WHERE deptno = e.deptno) order by deptno;

-- 직급(JOB)이 과장인 사원이 속한 부서의 부서번호와 부서명, 지역을 출력
SELECT deptno, dname, loc FROM dept WHERE deptno IN (SELECT deptno FROM emp WHERE job = '과장');

-- 과장보다 급여를 많이 받은 사원들의 이름과 급여와 직급을 출력하되 과장은 출력하지 않는 SQL문
SELECT ename, sal, job FROM emp06 WHERE sal > ANY (SELECT sal FROM emp WHERE job = '과장') AND job!='과장';

-- Student 테이블과 department테이블을 사용하여 'Anthony  Hopkins'학생과 전공(deptno1)이 동일한 학생들의 이름과 전공1 이름을 출력
SELECT s.name "STUD_NAME" , d.dname "DEPT_NAME" FROM student s , department d
WHERE s.deptno1=d.deptno and s.deptno1 = ( SELECT deptno1 FROM student WHERE name='Anthony Hopkins') ;

-- professor테이블과 department테이블을 조회하여 'Meg Ryan'교수보다 나중에 입사한 사람의 이름과 입사일 학과명을 출력
SELECT p.name, p.hiredate, d.dname FROM professor p, department d
WHERE p.deptno = d.deptno AND hiredate > (SELECT hiredate FROM professor WHERE name = 'Meg Ryan') ORDER BY hiredate;

-- student 테이블에서 전공1이 201번인 학과의 평균 몸무게보다 몸무게가 많은 학생들의 이름과 몸무게를 출력
SELECT name, weight FROM student WHERE weight > (SELECT avg(weight) FROM student WHERE deptno1 = 201) ORDER BY weight;

-- emp2테이블을 사용하여 전체 직원 중 'Section Head'직급의 최소 연봉자보다 연봉이 높은 사람의 이름과 직급 연봉을 출력하시오.
-- 단, 연봉 출력 형식은 천단위 구분기호와 $표시를 하세요.
SELECT name, position, TO_CHAR(pay, '$999,999,999') 연봉 FROM emp2 
WHERE pay > ANY (SELECT pay FROM emp2 WHERE position = 'Section head') AND position != 'Section head';

SELECT name, position, TO_CHAR(pay, '$999,999,999') 연봉 FROM emp2 
WHERE pay >(SELECT min(pay) FROM emp2 WHERE position = 'Section head') AND position != 'Section head';

-- student테이블을 조회하여 전체 학생 중에서 체중이 2학년 체중에서 가장 적게 나가는 학생보다 몸무게가 적은 학생의 이름과 학년과 몸무게를 출력
SELECT name, grade, weight FROM student WHERE weight < (SELECT min(weight) FROM student WHERE grade = 2) ORDER BY weight;

-- emp2테이블과 dept2테이블을 조회하여 각 부서별 평균 연봉을 구하고 그중에서 평균 연봉이 가장 적은 부서의 평균 연봉보다 적게 받는 직원들의 부서명, 직원명, 연봉을 출력
SELECT dname, name, TO_CHAR(pay, '$999,999,999') 
FROM emp2 e JOIN dept2 d 
ON e.deptno = d.dcode 
AND e.pay < ALL (SELECT avg(pay) FROM emp2 e JOIN dept2 d ON e.deptno = d.dcode GROUP BY dname);

-- professor테이블과 department테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 학과명을 출력
-- (입사일 순으로 오름차순 정렬하세요)
SELECT profno, name, dname 
FROM department d JOIN professor p 
ON d.deptno = p.deptno 
AND p.hiredate IN (SELECT min(hiredate) FROM professor GROUP BY deptno) ORDER BY hiredate;

-- emp2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력
-- 연봉순으로 오름차순 정렬
SELECT name, position, TO_CHAR(pay,'$999,999,999') 
FROM emp2 
WHERE position is not null 
AND pay IN (SELECT max(pay) FROM emp2 GROUP BY position) 
ORDER BY pay;

SELECT name, position, to_char(pay, '$999,999,999')  
FROM emp2
WHERE (position, pay) IN (SELECT position, max(pay) FROM emp2 GROUP BY position);















