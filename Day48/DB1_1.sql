-- 2. �渮�ο��� �ٹ��ϴ� ����� �̸��� �Ի����� ����ϱ�
SELECT ename, hiredate, d.dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.dname = '�渮��';
    
-- 3. ANSI JOIN�� ����Ͽ� ��õ���� �ٹ��ϴ� ����̸��� �޿��� ����ϱ�
SELECT ename, sal, d.loc 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.loc = '��õ';

-- 4. ��� ���̺�� �μ� ���̺��� �����Ͽ� ����̸��� �μ���ȣ, �μ����� ����Ͻÿ�
SELECT ename, e.deptno, dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno;
    
-- 5. �渮�� �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ename, hiredate, d.dname 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno AND d.dname = '�渮��';
    
-- 6. ������ ������ ����� �̸�, �μ����� ����Ͻÿ�
SELECT ename, dname, job
  FROM emp e JOIN dept d
    ON e.deptno = d.deptno AND job = '����';
    
-- 7. ���ӻ���� ���켺�� ������� �̸��� ������ ����Ͻÿ�
SELECT w.ename, w.empno, w.job, w.mgr
  FROM emp w JOIN emp m
    ON w.mgr = m.empno AND m.ename = '���켺';

-- 8. ���켺�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�
SELECT e2.ename, e2.deptno
  FROM emp e1 JOIN emp e2
    ON e1.deptno = e2.deptno AND e1.ename = '���켺' AND e2.ename != '���켺';

-- 1. ���� ������ �̿��Ͽ� "������"���� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����϶�.
SELECT ename, sal
  FROM emp
 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '������');

-- 2. ���������� ����Ͽ� emp06�� emp���̺��� ��� �����͸� �߰��մϴ�.
CREATE TABLE emp06
AS
SELECT * FROM emp;

-- 3. emp06���̺� ����� ��� ���� �� ������� �ּ� �޿����� ���� �޿��� �޴� ������� 
-- �̸��� �޿��� ������ ����ϵ� ������ ������� ���� SQL���� �ۼ��Ͻÿ�
SELECT ename, sal, job 
  FROM emp06 
 WHERE sal > (SELECT min(sal) FROM emp WHERE job = '����') 
   AND job != '����';
   
-- 4. emp06 ���̺� ����� ��� ���� �� ��õ�� ��ġ�� �μ��� �Ҽӵ� ������� �޿��� 100 �λ��ϴ� SQL���� �ۼ��Ͻÿ�
UPDATE emp06 
   SET sal = sal + 100 
 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '��õ');

-- 5. emp06���̺��� �渮�ο� �Ҽӵ� ����鸸 �����ϴ� SQL���� �ۼ��Ͻÿ�
DELETE emp06 
 WHERE deptno = (SELECT deptno FROM dept WHERE dname = '�渮��');

-- 6. '�̹���'�� ���� �μ��� �ٹ��ϴ� ����� �̸��� �μ���ȣ�� ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT ename, deptno 
  FROM emp06 
 WHERE deptno = (SELECT deptno FROM emp06 WHERE ename = '�̹���') AND ename != '�̹���';
 
-- 7. '�̹���'�� ������ ������ ���� ����� ����ϴ� SQL���� �ϼ��Ͻÿ�.
SELECT ename, job
  FROM emp06
 WHERE job = (SELECT job FROM emp06 WHERE ename = '�̹���') AND ename != '�̹���';

-- 8. '�̹���'�� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����ϴ� SQL���� �ϼ��Ͻÿ�
SELECT ename, sal 
  FROM emp06
 WHERE sal >= (SELECT sal FROM emp06 WHERE ename = '�̹���') AND ename != '�̹���';
 
-- 9. '��õ'���� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ����ϴ� SQL���� �ϼ��Ͻÿ�.
SELECT ename, deptno
  FROM emp06
 WHERE deptno = (SELECT deptno FROM dept WHERE loc = '��õ');

-- 10. ���ӻ���� ���켺�� ����� �̸��� �޿��� ����ϴ� SQL���� �ϼ��Ͻÿ�
SELECT ename, sal 
  FROM emp06
 WHERE mgr = (SELECT empno FROM emp06 WHERE ename = '���켺');

-- 11. �μ����� ���� �޿��� ���� �޴� ����� ����(�����ȣ, ����̸�, �޿�, �μ���ȣ)�� ����ϴ� SQL���� �ϼ��Ͻÿ�.
SELECT empno, ename, sal, deptno
  FROM emp06
 WHERE sal IN (SELECT max(sal) FROM emp06 GROUP BY deptno) ORDER BY deptno;
 
-- 12. ����(JOB)�� ������ ����� ���� �μ��� �μ���ȣ�� �μ���, ������ ����Ͻÿ�
SELECT deptno, dname, loc
  FROM dept
 WHERE deptno IN (SELECT deptno FROM emp06 WHERE job = '����');
 
-- 13. ���庸�� �޿��� ���� ���� ������� �̸��� �޿��� ������ ����ϵ� ������ ������� �ʴ� SQL���� �ϼ��Ͻÿ�
SELECT ename, TO_CHAR(sal, 'L999,999,999'), job
  FROM emp06
 WHERE sal > ANY (SELECT sal FROM emp06 WHERE job = '����') AND job != '����';
 
-- 1. Student ���̺�� department���̺��� ����Ͽ� 'Anthony  Hopkins'�л��� ����(deptno1)�� ������ �л����� �̸��� ����1 �̸��� ����Ͻÿ�
-- ���� : 103
SELECT name, deptno1
  FROM student s JOIN department d
    ON s.deptno1 = (SELECT deptno1 FROM student WHERE name = 'Anthony Hopkins')
   AND d.deptno = (SELECT deptno1 FROM student WHERE name = 'Anthony Hopkins');
   
-- 2. professor���̺�� department���̺��� ��ȸ�Ͽ� 'Meg Ryan'�������� ���߿� �Ի��� ����� �̸��� �Ի��� �а����� ����ϼ���
SELECT name, hiredate, position 
  FROM professor p JOIN department d
    ON p.deptno = d.deptno AND hiredate > (SELECT hiredate FROM professor WHERE name = 'Meg Ryan') 
ORDER BY hiredate;

-- 3. student ���̺��� ����1�� 201���� �а��� ��� �����Ժ��� �����԰� ���� �л����� �̸��� �����Ը� ����ϼ���
SELECT name, weight 
  FROM student
 WHERE weight > (SELECT avg(weight) FROM student WHERE deptno1 = 201) 
ORDER BY weight;
 
-- 4. emp2���̺��� ����Ͽ� ��ü ���� �� 'Section Head'������ �ּ� �����ں��� ������ ���� ����� �̸��� ���� ������ ����Ͻÿ�.
SELECT name, position, pay
  FROM emp2
 WHERE pay > (SELECT min(pay) FROM emp2 WHERE position = 'Section head') 
   AND position != 'Section head'
ORDER BY pay;

-- 5. student���̺��� ��ȸ�Ͽ� ��ü �л� �߿��� ü���� 2�г� ü�߿��� ���� ���� ������ �л����� �����԰� ���� �л��� �̸��� �г�� �����Ը� ����ϼ���.
SELECT name, grade, weight 
  FROM student
 WHERE weight < ALL (SELECT weight FROM student WHERE grade = 2)
ORDER BY grade;

-- 6. emp2���̺�� dept2���̺��� ��ȸ�Ͽ� �� �μ��� ��� ������ ���ϰ� ���߿��� ��� ������ 
-- ���� ���� �μ��� ��� �������� ���� �޴� �������� �μ���, ������, ������ ����ϼ���.
SELECT dname, name, TO_CHAR(pay, 'L999,999,999')
  FROM emp2 e JOIN dept2 d
    ON e.deptno = d.dcode 
   AND pay < ALL(SELECT avg(pay) FROM emp2 GROUP BY position);

-- 7. professor���̺�� department���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�, �а����� ����ϼ���.
-- (�Ի��� ������ �������� �����ϼ���)
SELECT profno, name, position 
  FROM professor 
 WHERE hiredate IN (SELECT min(hiredate) FROM professor GROUP BY deptno)
ORDER BY hiredate;

-- 8. emp2 ���̺��� ��ȸ�Ͽ� ���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ �̸��� ����, ������ ����ϼ���. ���������� �������� �����ϼ���.
SELECT name, TO_CHAR(pay, 'L999,999,999') 
  FROM emp2
 WHERE pay IN (SELECT max(pay) FROM emp2 GROUP BY position) ORDER BY pay;

rollback;
SELECT * FROM emp2;
SELECT * FROM dept2;
SELECT * FROM professor;
SELECT * FROM student;
SELECT * FROM department;