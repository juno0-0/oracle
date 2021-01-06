-- 테이블 만들기
CREATE TABLE member(
        name varchar2(10) PRIMARY key,
        age number(3),
        weight number(3),
        height number(3),
        sex char(3));
        
-- 데이터 삽입
insert into member values('유관순',17,50,160,'여');
insert into member values('홍길동',20,60,175,'남');
insert into member values('이순신',20,60,180,'남');

-- 데이터베이스에 확정(저장)
-- DB에는 있는데 Java에서 안보이는 경우 commit을 안한 것
commit;

SELECT * FROM member WHERE name ='유관순';

--자바에서 하기 전에 여기서 먼저 해보기
update member set age = 18, height=165,weight=45,sex='여' where name = '유관순';
select * from member;
show user;

INSERT INTO member (name, age, height, weight, sex) VALUES('아이유', 28, 160, 40, '여');

SELECT instance FROM v$thread;

delete from member where name = '김명자';