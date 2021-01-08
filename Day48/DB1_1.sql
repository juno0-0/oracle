-- 2. 경리부에서 근무하는 사원의 이름과 입사일을 출력하기
SELECT ename, hiredate, d.dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.dname = '경리부';
    
-- 3. ANSI JOIN을 사용하여 인천에서 근무하는 사원이름과 급여을 출력하기
SELECT ename, sal, d.loc 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.loc = '인천';

-- 4. 사원 테이블과 부서 테이블을 조인하여 사원이름과 부서번호, 부서명을 출력하시오
SELECT ename, e.deptno, dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno;
    
-- 5. 경리부 부서 소속 사원의 이름과 입사일을 출력하시오
SELECT ename, hiredate, d.dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.dname = '경리부';
    
-- 6. 직급이 과장인 사원이 이름, 부서명을 출력하시오
SELECT ename, dname, job
  FROM emp e JOIN dept d
    ON e.deptno = d.deptno AND job = '과장';
    
-- 7. 직속상관이 감우성인 사원들의 이름과 직급을 출력하시오
SELECT w.ename, w.empno, w.job, w.mgr
  FROM emp w JOIN emp m
    ON w.mgr = m.empno AND m.ename = '감우성';

-- 8. 감우성과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오
SELECT e2.ename, e2.deptno
  FROM emp e1 JOIN emp e2
    ON e1.deptno = e2.deptno AND e1.ename = '감우성' AND e2.ename != '감우성';

-- 1. 서브 쿼리를 이용하여 "영업부"에서 근무하는 모든 사원의 이름과 급여을 출력하라.
SELECT ename, sal
  FROM emp
 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '영업부');

-- 2. 서브쿼리를 사용하여 emp06에 emp테이블의 모든 데이터를 추가합니다.
CREATE TABLE emp06
AS
SELECT * FROM emp;

-- 3. emp06테이블에 저장된 사원 정보 중 과장들의 최소 급여보다 많은 급여을 받는 사원들의 
-- 이름과 급여과 직급을 출력하되 과장은 출력하지 않은 SQL문을 작성하시오
SELECT ename, sal, job 
  FROM emp06 
 WHERE sal > (SELECT min(sal) FROM emp WHERE job = '과장') 
   AND job != '과장';
   
-- 4. emp06 테이블에 저장된 사원 정보 중 인천에 위치한 부서에 소속된 사원들의 급여을 100 인상하는 SQL문을 작성하시오
UPDATE emp06 
   SET sal = sal + 100 
 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '인천');

-- 5. emp06테이블에서 경리부에 소속된 사원들만 삭제하는 SQL문을 작성하시오
DELETE emp06 
 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '경리부');

-- 6. '이문세'와 같은 부서에 근무하는 사원의 이름과 부서번호를 출력하는 SQL문을 작성하시오
SELECT ename, deptno 
  FROM emp06 
 WHERE deptno = (SELECT deptno FROM emp06 WHERE ename = '이문세') AND ename != '이문세';
 
-- 7. '이문세'와 동일한 직급을 가진 사원을 출력하는 SQL문을 완성하시오.
SELECT ename, job
  FROM emp06
 WHERE job = (SELECT job FROM emp06 WHERE ename = '이문세') AND ename != '이문세';

-- 8. '이문세'의 급여와 동일하거나 더 많이 받는 사원명과 급여을 출력하는 SQL문을 완성하시오
SELECT ename, sal 
  FROM emp06
 WHERE sal >= (SELECT sal FROM emp06 WHERE ename = '이문세') AND ename != '이문세';
 
-- 9. '인천'에서 근무하는 사원의 이름, 부서번호를 출력하는 SQL문을 완성하시오.
SELECT ename, deptno
  FROM emp06
 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '인천');

-- 10. 직속상관이 감우성인 사원의 이름과 급여을 출력하는 SQL문을 완성하시오
SELECT ename, sal 
  FROM emp06
 WHERE mgr = (SELECT empno FROM emp06 WHERE ename = '감우성');

-- 11. 부서별로 가장 급여를 많이 받는 사원의 정보(사원번호, 사원이름, 급여, 부서번호)를 출력하는 SQL문을 완성하시오.
SELECT empno, ename, sal, deptno
  FROM emp06
 WHERE sal IN (SELECT max(sal) FROM emp06 GROUP BY deptno) ORDER BY deptno;
 
-- 12. 직급(JOB)이 과장인 사원이 속한 부서의 부서번호와 부서명, 지역을 출력하시오
SELECT deptno, dname, loc
  FROM dept
 WHERE deptno IN (SELECT deptno FROM emp06 WHERE job = '과장');
 
-- 13. 과장보다 급여을 많이 받은 사원들의 이름과 급여와 직급을 출력하되 과장은 출력하지 않는 SQL문을 완성하시오
SELECT ename, TO_CHAR(sal, 'L999,999,999'), job
  FROM emp06
 WHERE sal > ANY (SELECT sal FROM emp06 WHERE job = '과장') AND job != '과장';
 
-- 1. Student 테이블과 department테이블을 사용하여 'Anthony  Hopkins'학생과 전공(deptno1)이 동일한 학생들의 이름과 전공1 이름을 출력하시오
-- 전공 : 103
SELECT name, deptno1
  FROM student s JOIN department d
    ON s.deptno1 = (SELECT deptno1 FROM student WHERE name = 'Anthony Hopkins')
   AND d.deptno = (SELECT deptno1 FROM student WHERE name = 'Anthony Hopkins');
   
-- 2. professor테이블과 department테이블을 조회하여 'Meg Ryan'교수보다 나중에 입사한 사람의 이름과 입사일 학과명을 출력하세요
SELECT name, hiredate, position 
  FROM professor p JOIN department d
    ON p.deptno = d.deptno AND hiredate > (SELECT hiredate FROM professor WHERE name = 'Meg Ryan') 
ORDER BY hiredate;

-- 3. student 테이블에서 전공1이 201번인 학과의 평균 몸무게보다 몸무게가 많은 학생들의 이름과 몸무게를 출력하세요
SELECT name, weight 
  FROM student
 WHERE weight > (SELECT avg(weight) FROM student WHERE deptno1 = 201) 
ORDER BY weight;
 
-- 4. emp2테이블을 사용하여 전체 직원 중 'Section Head'직급의 최소 연봉자보다 연봉이 높은 사람의 이름과 직급 연봉을 출력하시오.
SELECT name, position, pay
  FROM emp2
 WHERE pay > (SELECT min(pay) FROM emp2 WHERE position = 'Section head') 
   AND position != 'Section head'
ORDER BY pay;

-- 5. student테이블을 조회하여 전체 학생 중에서 체중이 2학년 체중에서 가장 적게 나가는 학생보다 몸무게가 적은 학생의 이름과 학년과 몸무게를 출력하세요.
SELECT name, grade, weight 
  FROM student
 WHERE weight < ALL (SELECT weight FROM student WHERE grade = 2)
ORDER BY grade;

-- 6. emp2테이블과 dept2테이블을 조회하여 각 부서별 평균 연봉을 구하고 그중에서 평균 연봉이 
-- 가장 적은 부서의 평균 연봉보다 적게 받는 직원들의 부서명, 직원명, 연봉을 출력하세요.
SELECT dname, name, TO_CHAR(pay, 'L999,999,999')
  FROM emp2 e JOIN dept2 d
    ON e.deptno = d.dcode 
   AND pay < ALL(SELECT avg(pay) FROM emp2 GROUP BY position);

-- 7. professor테이블과 department테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 학과명을 출력하세요.
-- (입사일 순으로 오름차순 정렬하세요)
SELECT profno, name, position 
  FROM professor 
 WHERE hiredate IN (SELECT min(hiredate) FROM professor GROUP BY deptno)
ORDER BY hiredate;

-- 8. emp2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요. 연봉순으로 오름차순 정렬하세요.
SELECT name, TO_CHAR(pay, 'L999,999,999') 
  FROM emp2
 WHERE pay IN (SELECT max(pay) FROM emp2 GROUP BY position) ORDER BY pay;

rollback;
SELECT * FROM emp2;
SELECT * FROM dept2;
SELECT * FROM professor;
SELECT * FROM student;
SELECT * FROM department;