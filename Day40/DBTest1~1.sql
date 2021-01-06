
--부서 테이블 생성하기
CREATE TABLE dept( deptno number(2) CONSTRAINT PK_DEPT PRIMARY KEY, 
                   dname varchar2(14),
                   loc varchar2(13) );

--사원 테이블 생성하기
CREATE TABLE emp( empno number(4) CONSTRAINT PK_EMP PRIMARY KEY,
                  ename varchar2(10),
                  job varchar2(9),
                  mgr number(4),
                  hiredate date,
                  sal number(7,2),
                  comm number(7,2),
                  deptno number(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT );
                  
--급여 테이블 생성하기
--grade 등급, losal 급여 하한가, hisal 급여 상한가
CREATE TABLE salgrade ( grade number, losal number, hisal number);

--부서 테이블에 샘플 데이터 넣기
INSERT INTO dept (deptno, dname, loc) VALUES(10, '경리부', '서울');
INSERT INTO dept (deptno, dname, loc) VALUES(20, '인사부', '인천');
INSERT INTO dept VALUES(30, '영업부', '용인');--(deptno, dname, loc)는 생략가능
INSERT INTO dept VALUES(40, '전산부', '수원');

--사원 테이블 안에 있는 레코드(행)을 검색하기
SELECT * FROM dept;

--정렬은 ORDER BY 정렬하고 싶은 컬럼명

--사원 테이블에 자료 삽입하기
--맨 앞에 있는 사원번호는 기본키라서 중복이 안된다.
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1016, '조이성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);
INSERT INTO EMP VALUES(1017, '조이성', '사원', 1006, to_date('2007-11-16','yyyy-mm-dd'), 250, NULL, 10);
INSERT INTO EMP VALUES(1018, '조이성', '사원', 1006, to_date('2007-11-15','yyyy-mm-dd'), 250, NULL, 10);
INSERT INTO EMP VALUES(1019, '아이유', '회장', null, to_date('2020-12-29','yyyy-mm-dd'), 250, NULL, 10);
--comm이 null
INSERT INTO EMP VALUES(1020, '아이유', '회장', null, to_date('2020-12-29','yyyy-mm-dd'), 250, NULL, 10);
--날짜가 null
INSERT INTO EMP VALUES(1021, '이지은', '회장', null, null, 250, 500, 10);
--문자가 null
INSERT INTO EMP VALUES(1022, null, '회장', null, to_date('2020-12-29','yyyy-mm-dd'), 250, 500, 10);
INSERT INTO EMP VALUES(1023, '이지금', null, null, to_date('2020-12-29','yyyy-mm-dd'), 250, 500, 10);

select comm, nvl(comm,0) from emp;
select hiredate, nvl(hiredate, '2020/12/25') from emp;
select ename, nvl(ename, 'IU') from emp;
select job, nvl(job, '회장') from emp;

--nvl2 함수
select ename, sal, comm, nvl2(comm, sal*12+comm, sal*12) from emp;
select * from emp;
--nullif 함수
select nullif('a','a'),nullif('a','b') from dual;
select coalesce('a','b','c',null,'d') from dual;





--사원 테이블 모든 레코드 출력
SELECT * FROM EMP;

--급여 테이블 자료 삽입하기
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);

--급여 테이블 모든 레코드 출력
select * from salgrade;

--중복 제거
SELECT DISTINCT job FROM emp;

SELECT DISTINCT job 직위 FROM emp;

SELECT sal from emp;

SELECT sal 본봉, sal*0.03 세금 from emp;

SELECT ename, comm, sal*12+comm 연봉, NVL(comm,0),sal*12+NVL(comm,0) from emp;

--|| concatentation연산자 사용하여서 컬럼끼리 연결할 수 있다.
SELECT ename || '의 직급은 '|| job || '입니다.' 직급 FROM emp;

--Where절 조건절
select * from emp;
--숫자 검색
SELECT * from emp where sal >= 500;
SELECT * from emp where deptno = 10;
--문자 검색
SELECT * from emp where ename = '한예슬';
--날짜 검색, 2005년 1월 1일 이전에 입사한 사람, 이전이면 작은 것, 이후면 큰 것
select * from emp where hiredate < to_date('2005/01/01','yyyy/MM/dd');
select * from emp where hiredate > to_date('2005/01/01','yyyy/MM/DD');

--논리연산자
--부서번호가 10이고 직급이 과장인 사람
select ename, sal from emp where not deptno = 10 or job = '과장';
--급여가 400~500인 경우 and
select * from emp where sal >= 400 and sal <= 500;
--급여가 400미만이거나 500초과인 경우 or
select * from emp where sal < 400 or sal > 500;
--between and : ~사이
select * from emp where sal between 400 and 500;
--in : ~안에
select * from emp where comm = 80 or comm = 100 or comm = 200;
select * from emp where comm in(80,100,200);

select * from emp where comm != 80 and comm <> 100 and comm ^= 200;
select * from emp where comm not in(80,100,200);

--like : 유사일치(비슷하게 일치하는 것)
--김씨인 사람, 서울 어딘가에 사는 사람 등
--와일드카드 : % : 문자가 없거나 하나 이상의 어떤 문자가 와도 상관없다.
--            _ : 하나의 문자가 어떤 값이 와도 상관없다.
select * from emp where ename like '__성';
--job에서 '사'로 시작하는 것 찾기
select * from emp where job like '사%';
--job에서 '사'로 시작하지 않는 것 찾기
select * from emp where job not like '사%';
--성이 '이'씨가 아닌 사람 찾기
select * from emp where ename not like '이%';
--comm이 NULL인 사람 찾기
select * from emp where comm is null;

select * from emp order by ename;
--사원중에서 급여 오름차순 정렬
select * from emp where job = '사원' order by comm;
--최근에 입사한 사람 순서대로 조건, 사장은 제외
select * from emp where job not like '사장' order by hiredate desc;

--사원 이름과 급여일 입사 일자만 출력하기
select ename 이름, sal 급여, hiredate 입사일 from emp;
--deptno는 부서번호, dname은 부서명으로 별칭 붙여서 출력
select deptno 부서번호, dname 부서명 from dept;
--사원테이블에 존재하는 직급의 종류만 출력하기
select DISTINCT job 직급 from emp;
--급여가 300이하인 사원의 사원번호, 사원이름, 급여를 출력
select empno 사원번호, ename 사원명, sal 급여 from emp where sal <= 300;
--이름이 '오지호'인 사원의 사원번호, 사원명 급여를 출력
--select empno 사원번호, ename 사원명, sal 급여 from emp where ename like '오지호';
select empno 사원번호, ename 사원명, sal 급여 from emp where ename = '오지호';
--급여가 250이거나 300이거나 500인 사원들의 사원번호, 사원명, 급여를 출력
select empno 사원번호, ename 사원명, sal 급여 from emp where sal in(250,300,500);
--급여가 250도 300도 500도 아닌 사원들을 출력
select empno 사원번호, ename 사원명, sal 급여 from emp where sal not in(250,300,500);
--사원중에는 이름이 '김'으로 시작하는 사람과 이름중에 '기'를 포함하는 사원의 사원번호와 사원이름을 출력
select empno 사원번호, ename 사원명, sal 급여 from emp where ename like '김%' or ename like '%기%';
--상급자가 없는 사원을 검색
select empno 사원번호, ename 사원명, sal 급여 from emp where mgr is null;
--사원테이블의 자료를 입사일을 기준으로 정렬하여 최근에 입사한 직원을 가장 먼저 출력(사원번호, 사원명, 직급, 입사일만 출력)
select empno 사원번호, ename 사원명, job 직급, hiredate 입사일 from emp order by hiredate desc;
--부서번호가 빠른 사원번호부터 출력하되, 같은 부서 내의 사원을 출력할 경우 입사한지 가장 오래된 사원부터 출력
select * from emp order by deptno, hiredate;

CREATE TABLE group_star( name varchar2(8));

INSERT INTO group_star VALUES('A');
INSERT INTO group_star VALUES('B');
INSERT INTO group_star VALUES('C');
INSERT INTO group_star VALUES('D');
INSERT INTO group_star VALUES('E');
INSERT INTO group_star VALUES('F');
INSERT INTO group_star VALUES('G');
INSERT INTO group_star VALUES('H');

SELECT * FROM group_star;
delete from group_star where name = 'A';

CREATE TABLE single_star( name varchar2(8));

insert into single_star values('E');
insert into single_star values('F');
insert into single_star values('G');
insert into single_star values('H');
insert into single_star values('I');
insert into single_star values('J');
insert into single_star values('K');
insert into single_star values('L');

--합집합
select * from group_star union select * from single_star;
select * from group_star union all select * from single_star;

--교집합
select * from group_star INTERSECT select * from single_star;


--차집합
select * from group_star minus select * from single_star;

--3장 오라클 함수
select * from dual;
select power(2,3) from dual;
select round(3.83,1) from dual;
select mod(10,3) from dual;
select 'Welcome to Oracle' , upper('Welcome to ORacle'), lower('Welcome to oracle'), initcap('welcome to oracle') from dual;
select lengthb('welcome to oracle 한글') from dual;
select concat('ab','cd') from dual;
select substrb('가나다라마바사',2,5) from dual;
select instr('데이터베이스','이',4,1) from dual;
select instrb('데이터베이스','이',4,1) from dual;
select lpad('Oracle',20,'#') from dual;
select rpad('Oracle',20,'#') from dual;
select sysdate, to_char(sysdate,'yyyy/MM/dd, AM HH:MI:SS') from dual;
select to_date('1992/01/30','yyyy/MM/dd') from dual;
select to_char(1234000, 'L000,000,000.00') from dual;
select to_number('199999') from dual;
select to_number('542') - to_number('500') from dual;
select '542'+'500' from dual;

--날짜 trunc 월을 기준으로 일을 버린다.
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(hiredate, 'yyyy/mm/dd') 입사일, to_char(trunc(hiredate, 'MONTH'),'yyyy/mm/dd') 입사일 from emp;

--round 월을 기준으로 16일부터는 반올림 이전으로 반내림
select to_char(hiredate, 'yyyy/mm/dd') 입사일, to_char(round(hiredate, 'YEAR'),'yyyy/mm/dd') 입사일 from emp;

--한주가 시작되는 날짜
select to_char(hiredate, 'yyyy/mm/dd') 입사일, to_char(round(hiredate, 'DAY'),'yyyy/mm/dd') 입사일 from emp;

select ename, sysdate 오늘, to_char(hiredate, 'yyyy/mm/dd'), round(MONTHs_BETWEEN(sysdate, hiredate)) from emp;

select ename, to_char(add_months(hiredate, 6), 'yyyy-mm-dd') from emp;

select ename, to_char(hiredate,'yyyy/mm/dd'), to_char(last_day(hiredate), 'yyyy/mm/dd') from emp;

select ename, deptno, decode(deptno, 10, '경리부',
                                     20, '인사과',
                                     30, '영업부',
                                     40, '전산부') from emp;
                                     
select ename, deptno, case when deptno = 10 then '경리부'
                          when deptno = 20 then '인사부'
                          end as dname from emp;
                          
select to_char(sysdate, 'yyyy/mm/dd') 오늘,
       to_char(next_day(sysdate,2),'yyyy/mm/dd') 월요일
       from dual;
       
--9월에 입사한 사원
select * from emp where substr(hiredate, 4,2)=09;
--2003년도에 입사한 사원
select * from emp where substr(hiredate,1,2)=03;
--이름이 '기'로 끝나는 사람을 검색
select * from emp where substr(ename,-1,1)='기';
--이름의 두번째 글자에 '동'이 있는 사원을 검색
select * from emp where instr(ename, '동',2, 1) = 2;
--직급에 따라 급여를 인상, 부장은 5%, 과장은 10%, 대리는 13%, 사원은 20%
select ename, job, decode(job, '부장', sal*1.05,
                               '과장', sal*1.1,
                               '대리', sal*1.13,
                               '사원', sal*1.2,
                                      sal) upsal from emp;
                                      
--입사일 연도는 2자리(YY), 월은 숫자(MON)으로 표시, 요일은 약어(DY)로 지정하여 출력
select hiredate, to_char(hiredate,'yy/mon/dd dy') from emp;


select sal, round(sal,-2) from emp;

select round(12300.7876, -4) from dual;

--그룹함수
select sum(sal) from emp;
select avg(sal) from emp;
select count(job) from emp;
select count(comm) from emp;
select max(sal) from emp;

select job, sum(sal) from emp group by job;
select sum(sal) from emp where ename like '아%' group by deptno;
