CREATE SEQUENCE dept_deptno_seq
    START WITH 10
    INCREMENT BY 10;

-- 시퀀스 구조
DESC user_sequences;
-- DB별 시퀀스 상황
SELECT * FROM user_sequences WHERE SEQUENCE_NAME in('DEPT_DEPTNO_SEQ');
-- nextval : 다음 값
SELECT dept_deptno_seq.NEXTVAL FROM DUAL;
-- currval : 현재 값
SELECT dept_deptno_seq.CURRVAL FROM DUAL;
CREATE SEQUENCE sample_seq;
SELECT sample_seq.CURRVAL FROM DUAL;--포인터가 이동이 없었고, 시작값을 안줘서 아무것도 가르키지 않아서 오류

-- 활용하기
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

INSERT INTO emp01 VALUES(emp_seq.nextval, '홍길동', sysdate);

SELECT * FROM emp01;

ALTER SEQUENCE emp_seq
    INCREMENT BY 100
    MAXVALUE 1600
    CYCLE;
    
INSERT INTO emp_seq VALUES(emp_seq.nextval, '홍길동', sysdate);

ALTER SEQUENCE emp_seq
    MAXVALUE 2000;

SELECT * FROM user_sequences WHERE SEQUENCE_NAME in('EMP_SEQ');

desc user_ind_columns;
select * from user_ind_columns WHERE index_name = 'IDX_EMP01_ENAME';

CREATE TABLE emp01
AS
SELECT * FROM emp;
-- emp, emp01 인덱스 확인
SELECT * FROM user_ind_columns WHERE table_name IN('EMP','EMP01');
-- emp01에 데이터 삽입
INSERT INTO emp01 SELECT * FROM emp01;
INSERT INTO emp01 (empno, ename) VALUES(2222,'iu');
SET TIMING OFF -- 시간을 보는 것
SELECT distinct empno, ename FROM emp01 WHERE ename = 'iu';

SELECT count(*) FROM emp01;

-- 인덱스 생성
CREATE INDEX idx_emp01_ename
    ON emp01(ename);
    
-- 인덱스 제거
DROP INDEX idx_emp01_ename;

-- 인덱스 했을 때 삽입, 삭제, 수정 시간
-- 삽입 0.027 수정 0.336
-- 인덱스 안했을 때 삽입, 삭제, 수정 시간
-- 삽입 0.031 수정 0.068
INSERT INTO emp01 (empno, ename) VALUES(2131, '이지은');
UPDATE emp01 SET empno = 7777 WHERE ename = '이지은';

-- 서브쿼리로 테이블 만들기
CREATE TABLE dept01
AS
SELECT * FROM dept
WHERE deptno = 100;

INSERT INTO dept01 VALUES(10, '인사과', '서울');
INSERT INTO dept01 VALUES(20, '총무과', '대전');
INSERT INTO dept01 VALUES(30, '교육팀', '대전');

SELECT * FROM dept01;

-- 고유 인덱스 지정하기
CREATE UNIQUE INDEX idx_dept01_deptno -- O
    ON dept01(deptno);

CREATE UNIQUE INDEX idx_dept01_loc -- X, 대전이 중복으로 들어가있기 때문에 UNIQUE로 만들 수 없음
    ON dept01(loc);
    
CREATE UNIQUE INDEX idx_dept01_dname -- O
    ON dept01(dname);

-- 비고유 인덱스로 지정하기
CREATE INDEX idx_dept01_loc -- O, 중복 가능
    ON dept01(loc);
    
-- 결합 인덱스로 지정하기
CREATE INDEX idx_dept01_deptno_dname -- 결합 인덱스이자 비고유 인덱스
    ON dept01(deptno, dname);

-- 함수 기반 인덱스로 지정하기
CREATE INDEX idx_emp01_annsal
    ON emp01(sal);    
SELECT * FROM emp01 WHERE sal*12>=3600; -- 계산식이라 INDEX가 걸리지 않음

CREATE INDEX idx_emp01_annsal -- 함수 기반 인덱스
    ON emp01(sal*12);
    
-- 인덱스 수정하기
-- 인덱스가 생성된 후 새로운 행이 추가되거나 삭제될 수 있음
-- 인덱스로 사용된 칼럼 값이 변경될 수 있음
-- 이럴 경우 본 테이블의 자료 추가, 삭제, 변경 작업이 일어날 때 해당 테이블에 걸린 인덱스의 내용도 함께 수정되어야 함
ALTER INDEX idx_dept01_deptno REBUILD

SELECT * FROM user_ind_columns WHERE table_name IN('EMP01');
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

-- 1. 부서 번호를 생성하는 시퀀스 객체를 생성하여 시퀀스 객체를 이용하여 부서 번호를 자동으로 생성
CREATE TABLE dept_ex(
    deptno number(4) PRIMARY KEY,
    dname varchar2(15),
    loc varchar2(15));

SELECT * FROM user_constraints WHERE table_name = 'DEPT_EX';

CREATE SEQUENCE dept_ex_seq
    START WITH 100
    INCREMENT BY 10
    MAXVALUE 2000
    
INSERT INTO dept_ex VALUES(dept_ex_seq.nextval, '이지은', '강남');
SELECT * FROM dept_ex

    
-- 2. 사원 테이블의 직급 인덱스를 생성하기
CREATE INDEX emp_job ON emp_test(job);
