-- DBMS_OUTPUT�� ȭ�鿡 ���
SET SERVEROUTPUT ON;

DECLARE
    myVar1 NUMBER(3);
    myVar2 NUMBER(5,2) := 3.14;
    myVar3 NVARCHAR2(20) := '������ Ű -->';
BEGIN
    myVar1 := 5;
    DBMS_OUTPUT.PUT_LINE(myVar1);
    DBMS_OUTPUT.PUT_LINE(myVar1 + myVar2);
    SELECT height INTO myVar1 FROM userTbl WHERE userName = '������';
    DBMS_OUTPUT.PUT_LINE(myVar3 || TO_CHAR(myVar1);
END;
/

-- ����� �Ҽ������� ��� ������ �ȴ�.
SELECT AVG(amount) AS "��� ���� ����" FROM buyTBL;

-- AVG(amount) ����� CAST �Լ��� ���� NUMBER(3)�� �ٲ��
SELECT CAST(AVG(amount) AS NUMBER(3)) AS "��� ���� ����" FROM buyTBL;

-- 2020$12$12�� DATE �������� �ٲ�� 
SELECT CAST('2020$12$12' AS DATE) FROM DUAL;

-- �������� ���������� �ٲ㼭 ����
SELECT CAST(price AS CHAR(5))|| 'X' || CAST(amount AS CHAR(4)) || '=' AS "�ܰ� X ����"��
    price*amount AS "���ž�"
    FROM buyTBL;
