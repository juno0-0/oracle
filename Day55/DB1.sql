CREATE TABLE T_ORDER ( NO  NUMBER, ORD_CODE VARCHAR2(10), OR_DATE DATE );

CREATE OR REPLACE TRIGGER T_ORDER
BEFORE INSERT ON T_ORDER -- INSERT ����
BEGIN
    IF(TO_CHAR(sysdate, 'HH24:MI') NOT BETWEEN '13:00' AND '18:00') THEN
        RAISE_APPLICATION_ERROR(-20100, '���ð��� �ƴմϴ�');
    END IF;
END;
/

SELECT SYSDATE FROM DUAL;
-- �� ����
INSERT INTO T_ORDER VALUES(3, 'C100', sysdate);

SELECT * FROM T_ORDER;

-- Ʈ���� ����
-- ���̺� �Էµ� ������ ���� �����ϰ� �� �� �̿ܿ��� ������ �߻���Ű�� Ʈ���Ÿ� ����(�෹�� Ʈ����)
--��ǰ�ڵ尡 'C100'���� ��ǰ�� �Էµ� ��� �Է��� ���, ������ ��ǰ�� ��� ������ �߻���Ű�� Ʈ���Ÿ� �ۼ�
-- 1. Ʈ���� ����
CREATE OR REPLACE TRIGGER T_ORDER2
    BEFORE INSERT ON T_ORDER
    FOR EACH ROW -- �� ���� Ʈ����, �ึ�� �ش�
    BEGIN
        IF(:NEW.ORD_CODE) NOT IN ('C500') THEN
            RAISE_APPLICATION_ERROR(-20200, '��ǰ�ڵ尡 Ʋ���ϴ�!');
        END IF;
    END;
/

INSERT INTO T_ORDER VALUES(4,'C100',sysdate);
INSERT INTO T_ORDER VALUES(5,'C500',sysdate);

-- Ʈ���� ����2
-- Ʈ������ �۵� ������ WHEN���� �� �ڼ��� �����ϴ� ����
-- ��� ��ǰ�� Ʈ���Ű� �۵��Ǵ� ���� �ƴ϶� ORD_CODE�� 'C500'�� ��ǰ�� ���ؼ��� 19:30~19:35�б�����
-- �Էµǵ��� ����ϴ� Ʈ���Ÿ� �����.
-- 'C500'�̿��� �ٸ� ��ǰ �ڵ�� �ð��� ������� ���������� �Է��� �ȴ�.
-- 1. Ʈ���� ����
CREATE OR REPLACE TRIGGER T_ORDER3
    BEFORE INSERT ON T_ORDER -- T_ORDER���̺� INSERT �ϱ� ���� �̺�Ʈ
    FOR EACH ROW -- �� ���� Ʈ����, �ึ�� ����
    WHEN (NEW.ORD_CODE = 'C500')
    BEGIN
        IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '14:00' AND '14:10') THEN
        RAISE_APPLICATION_ERROR(-20300, 'C500��ǰ�� �Է����ð��� �ƴմϴ�.');
        END IF;
    END;
/
INSERT INTO T_ORDER VALUES(8, 'C400',sysdate);

DROP TRIGGER T_ORDER2;

-- Ʈ���� ����3
-- �޿������� �ڵ����� �߰��ϴ� Ʈ���� �ۼ��ϱ�
1. �޿� ���̺� �����
CREATE TABLE sal01(
    salno number(4) primary key,
    sal number(7,2),
    empno number(4) REFERENCES emp02(empno));
��� ���̺� �����
CREATE TABLE emp02(
    empno number(4) PRIMARY KEY,
    ename varchar2(20),
    job varchar2(20));
    
2. �޿���ȣ�� �ڵ� �����ϴ� ������ �����ϱ�
CREATE SEQUENCE SAL01_SALNO_SEQ;

3. Ʈ���� �ۼ��ϱ�
CREATE OR REPLACE TRIGGER TRG_02
    AFTER INSERT ON EMP02
    FOR EACH ROW
BEGIN
    INSERT INTO sal01 VALUES(sal01_salno_seq.NEXTVAL, 100, :NEW.EMPNO);
END;
/

4. ������̺� �ο찡 �߰��Ǹ� �ڵ����� ������ Ʈ���Ű� �����ȴ�.
INSERT INTO emp02 VALUES(100, '������','���');
select * from emp02;
select * from sal01;

-- �޿������� �ڵ� �߰��ϴ� Ʈ���� �����ϱ�
DROP TRIGGER TRG_02;

INSERT Ʈ���� �ۼ��ϱ�
1. ����� ���̺� �����
��ǰ ���̺�
CREATE TABLE ��ǰ(
    ��ǰ�ڵ� CHAR(6) PRIMARY KEY,
    ��ǰ�� VARCHAR2(12) NOT NULL,
    ������ VARCHAR2(12),
    �Һ��ڰ��� NUMBER(8),
    ������ NUMBER DEFAULT 0);
    
�԰� ���̺�
CREATE TABLE �԰�(
    �԰��ȣ NUMBER(6) PRIMARY KEY,
    ��ǰ�ڵ� CHAR(6) REFERENCES ��ǰ(��ǰ�ڵ�),
    �԰����� DATE DEFAULT SYSDATE,
    �԰���� NUMBER(6),
    �԰�ܰ� NUMBER(8),
    �԰�ݾ� NUMBER(8));
    
2. �ڷ� ����
INSERT ONTO ��ǰ VALUES('A00001','��Ź��','LG',200,0);
INSERT ONTO ��ǰ VALUES('A00002','��ǻ��','LG',700,0);
INSERT ONTO ��ǰ VALUES('A00003','�����','�Ｚ',600,0);

3. �԰� ���̺� ��ǰ�� �ԷµǸ� �԰������ ��ǰ���̺��� ��� ������ �߰��ϴ� Ʈ���Ÿ� �ۼ�
�԰� Ʈ���� �����ϱ�
CREATE OR REPLACE TRIGGER TRG_04
    AFTER INSERT ON �԰�
    FOR EACH ROW
BEGIN
    UPDATE ��ǰ SET ������ = ������ + :NEW.�԰����
    WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/

4. Ʈ���Ÿ� �����Ų �� �԰� ���̺� ���� �߰�
�԰� ���̺��� ���� ��ǰ ���̺��� ��� ������ ������� Ȯ���� �� �ִ�.
��ǰ �԰��ϱ�
INSERT INTO �԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) VALUES(1,'A00001',5,320,1600);

�԰����̺� ��ȸ�ϱ�
SELECT * FROM �԰�;

��ǰ ���� ��ȸ�ϱ�
SELECT * FROM ��ǰ;

�԰����̺� ��ǰ�� �ԷµǸ� �ڵ����� ��ǰ ���̺��� ��� ������ �����ϰ� �ȴ�.
�԰� ���̺� �� �ٸ� ��ǰ�� �Է�
INSERT INTO �԰�
