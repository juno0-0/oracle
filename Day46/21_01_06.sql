create table test1(
    name varchar2(14) CONSTRAINT test_pk PRIMARY key,
    n number(3));
    
insert into test1 values('이지은',1);
insert into test1 values('이지금',2);
insert into test1 values('아이유',3);

create table test2(
    name varchar2(14) CONSTRAINT test_fk REFERENCES test1);
    
select * from user_con_constraints where table_name = 'TEST1';