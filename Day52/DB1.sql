-- ����� �ִ� ������ ȭ�鿡 �����ֱ� ���� ȯ�漳�� �����ϱ�
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Fuck you');
    END;
    --put_line : ����Ŭ���� �����ϴ� ���ν���, ȭ�鿡 ����� ��
/

DECLARE -- ����
    vempno number(4);
    vename varchar2(10);
BEGIN -- �� �ֱ�
    vempno := 1001;
    vename := '������';
    DBMS_OUTPUT.PUT_LINE('    ��    ��         ��    �� ');-- syso���� ��
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('   '|| vempno ||'     '|| vename);
    END;-- ��
    /-- ����

-- ��Į�󺯼� : SQL���� ����ϴ� �ڷ����� ���� ������
--            ������ ��� NUMBER, �������� ��� VARCHAR2
-- ex) vempno number(4);
-- ���۷��� ���� : ������ ����� �ٸ� ���� �Ǵ� �����ͺ��̽� Į���� ���� ������ �����ϱ� ���� %TYPE�Ӽ��� ���
-- ex) vempno ���̺��.Į����%TYPE; = vempno�� Ÿ���� ���̺���� Į���� Ÿ�԰� ����.
--     %TYPE�Ӽ��� ����Ͽ� ������ vempno������ �ش� ���̺�(emp)�� �ش� Į��(empno)�� �ڷ����� ũ�⸦ �״�� �����ؼ� ����
-- %ROWTYPE���� : Ư�����̺��� �ο������ �����ؼ� ���۷��� ���� ����
-- ex) vemp emp%rowtype;                
--      ���̺� ���� ��ü�� ���� ����
