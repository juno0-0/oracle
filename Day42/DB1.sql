-- ���̺� �����
CREATE TABLE member(
        name varchar2(10) PRIMARY key,
        age number(3),
        weight number(3),
        height number(3),
        sex char(3));
        
-- ������ ����
insert into member values('������',17,50,160,'��');
insert into member values('ȫ�浿',20,60,175,'��');
insert into member values('�̼���',20,60,180,'��');

-- �����ͺ��̽��� Ȯ��(����)
-- DB���� �ִµ� Java���� �Ⱥ��̴� ��� commit�� ���� ��
commit;

SELECT * FROM member WHERE name ='������';

--�ڹٿ��� �ϱ� ���� ���⼭ ���� �غ���
update member set age = 18, height=165,weight=45,sex='��' where name = '������';
select * from member;
show user;

INSERT INTO member (name, age, height, weight, sex) VALUES('������', 28, 160, 40, '��');

SELECT instance FROM v$thread;

delete from member where name = '�����';