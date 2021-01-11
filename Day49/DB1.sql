DROP TABLE STUDENT;
DROP TABLE COURSE;
CREATE TABLE COURSE (
  COU_ID       NUMBER(4)      NOT NULL,   -- 과정 번호
  COU_NAME     VARCHAR(20)    NULL,  -- 과정명
  TEA_NAME     VARCHAR(20)    NULL,  -- 강사명
  PRIMARY KEY(COU_ID)   -- 과정 번호를 기본키로 지정
);
CREATE TABLE STUDENT (
  STU_ID       NUMBER(4)        NOT NULL, -- 학생번호, 널 값 허용 안 함
  STU_NAME     VARCHAR(20)      NULL, -- 학생명
  AGE          NUMBER(4)        NULL, -- 나이
  STU_EMAIL    VARCHAR(20)      NULL, -- 이메일
  COU_ID       NUMBER(4)        NULL,-- 소속된 과정의 과정 번호
  SEX          CHAR(1)          DEFAULT 'M',  -- 성별   
  PRIMARY KEY(STU_ID),            -- 학생번호를 기본키로 지정  
  -- -- 과정 번호를 외래키로 지정
  FOREIGN KEY(COU_ID) REFERENCES COURSE(COU_ID)
);
--과정 테이블 데이터 입력
INSERT INTO course VALUES(10,'모바일','성윤정');
INSERT INTO course VALUES(20,'자바','김혜경');
INSERT INTO course VALUES(30,'윈도우','황연주');
INSERT INTO course VALUES(40,'웹표준','전혜영');

--학생 테이블 데이터 입력
INSERT INTO STUDENT VALUES(101,'문종헌', 24,'moon@nate.com',10,'M');
INSERT INTO STUDENT VALUES(102,'오한솔', 22,'five@nate.com',20,'M');
INSERT INTO STUDENT VALUES(103,'제용석', 22,'again@nate.com',20,'M');
INSERT INTO STUDENT VALUES(104,'정국철', 22,'cook@nate.com',20,'M');
INSERT INTO STUDENT VALUES(105,'박홍진', 24,'red@nate.com',10,'M');
INSERT INTO STUDENT VALUES(106,'김현우', 21,'kim@nate.com',20,'M');
INSERT INTO STUDENT VALUES(107,'박시준', 22,'season@nate.com',20,'M');
INSERT INTO STUDENT VALUES(108,'김준형', 27,'brother@nate.com',10,'M');
INSERT INTO STUDENT VALUES(109,'문혜진', 22, NULL,20,'F');
INSERT INTO STUDENT VALUES(110,'박기석', 34,'flag@nate.com',10,'M');
INSERT INTO STUDENT VALUES(111,'윤효선', 24,'od@nate.com',30,'F');
INSERT INTO STUDENT VALUES(112,'안창범', 34,'window@nate.com',30,'M');
INSERT INTO STUDENT VALUES(113,'공지훈', 28, NULL, 10,'M');
INSERT INTO STUDENT VALUES(114,'이봉림', 29,'bbong@nate.com',10,'M');
INSERT INTO STUDENT VALUES(115,'안창범', 24,'chang@nate.com',30,'M');
INSERT INTO STUDENT VALUES(116,'장희성', 34,'shine@nate.com',10,'M');

commit;

-- 부서 테이블 제거하기
DROP TABLE EMP;
-- 사원 테이블 제거하기
DROP TABLE DEPT;
-- 급여 테이블 제거하기
DROP TABLE SALGRADE;
-- 부서 테이블 제거하기
DROP TABLE EMPLOYEE;
-- 사원 테이블 제거하기
DROP TABLE DEPARTMENT;
-- 급여 테이블 제거하기
DROP TABLE SALGRADE;

-- 부서 테이블 생성하기
CREATE TABLE DEPT(
	 DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	 DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;

-- 사원 테이블 생성하기
CREATE TABLE EMP( 
  	 EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MGR  NUMBER(4),
	 HIREDATE DATE,
	 SAL NUMBER(7,2),
	 COMM NUMBER(7,2),
	 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
	 GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');

-- 부서 테이블에 샘플 데이터 추가하기
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
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- 급여 테이블에 샘플 데이터 추가하기
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
COMMIT;

--
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;
--
CREATE TABLE GROUP_STAR(
	NAME		VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
	NAME		VARCHAR2(50)
);
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');

INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');
COMMIT;


delete from emp where ename='ADAMS' ;
commit;

drop table professor ;

create table professor
(profno number(4) primary key,
 name  varchar2(20) not null, 
 id  varchar2(15) not null,
 position varchar2 (30) not null,
 pay number (3) not null,
 hiredate  date not null,
 bonus number(4) ,
 deptno  number(3),
 email  varchar2(50),
 hpage  varchar2(50)) tablespace users;

insert into professor
values(1001,'Audie Murphy','Murphy','a full professor',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'Angela Bassett','Bassett','assistant professor',380,to_date('1987-01-30','YYYY-MM-DD'),60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'Jessica Lange','Lange','instructor',270,to_date('1998-03-22','YYYY-MM-DD'),null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'Winona Ryder','Ryder','instructor',250,to_date('2001-09-01','YYYY-MM-DD'),null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'Michelle Pfeiffer','Pfeiffer','assistant professor',350,to_date('1985-11-30','YYYY-MM-DD'),80,102,'number1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'Whoopi Goldberg','Goldberg','a full professor',490,to_date('1982-04-29','YYYY-MM-DD'),90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'Emma Thompson','Thompson','a full professor',530,to_date('1981-10-23','YYYY-MM-DD'),110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'Julia Roberts','Roberts','assistant professor',330,to_date('1997-07-01','YYYY-MM-DD'),50,103,'naone10@empal.com',null);

insert into professor
values (3003,'Sharon Stone','Stone','instructor',290,to_date('2002-02-24','YYYY-MM-DD'),null,103,'only_u@abc.com',null);

insert into professor
values (4001,'Meryl Streep','Streep','a full professor',570,to_date('1981-10-23','YYYY-MM-DD'),130,201,'chebin@daum.net',null);

insert into professor
values (4002,'Susan Sarandon','Sarandon','assistant professor',330,to_date('2009-08-30','YYYY-MM-DD'),null,201,'gogogo@def.com',null);

insert into professor
values (4003,'Nicole Kidman','Kidman','assistant professor',310,to_date('1999-12-01','YYYY-MM-DD'),50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'Holly Hunter','Hunter','instructor',260,to_date('2009-01-28','YYYY-MM-DD'),null,202,'ironman@naver.com',null);

insert into professor
values (4005,'Meg Ryan','Ryan','a full professor',500,to_date('1985-09-18','YYYY-MM-DD'),80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'Andie Macdowell','Macdowell','instructor',220,to_date('2010-06-28','YYYY-MM-DD'),null,301,'napeople@jass.com',null);

insert into professor
values (4007,'Jodie Foster','Foster','assistant professor',290,to_date('2001-05-23','YYYY-MM-DD'),30,301,'silver-her@daum.net',null);

commit;

drop table department purge;
create table department
( deptno number(3) primary key ,
  dname varchar2(50) not null,
  part number(3),
  build  varchar2(30))tablespace users;

insert into department 
values (101,'Computer Engineering',100,'Information Bldg');

insert into department
values (102,'Multimedia Engineering',100,'Multimedia Bldg');

insert into department
values (103,'Software Engineering',100,'Software Bldg');

insert into department
values (201,'Electronic Engineering',200,'Electronic Control Bldg');

insert into department
values (202,'Mechanical Engineering',200,'Machining Experiment Bldg');

insert into department
values (203,'Chemical Engineering',200,'Chemical Experiment Bldg');

insert into department
values (301,'Library and Information science',300,'College of Liberal Arts');

insert into department
values (100,'Department of Computer Information',10,null);

insert into department
values (200,'Department of Mechatronics',10,null);

insert into department
values (300,'Department of Humanities and Society',20,null);

insert into department
values (10,'College of Engineering',null,null);

insert into department
values (20,'College of Liberal Arts',null,null);

commit;
 

drop table student purge;

create table student
( studno number(4) primary key,
  name   varchar2(30) not null,
  id varchar2(20) not null unique,
  grade number check(grade between 1 and 6),
  jumin char(13) not null,
  birthday  date,
  tel varchar2(15),
  height  number(4),
  weight  number(3),
  deptno1 number(3),
  deptno2 number(3),
  profno  number(4)) tablespace users;

insert into student values (
9411,'James Seo','75true',4,'7510231901813',to_date('1975-10-23','YYYY-MM-DD'),'055)381-2158',180,72,101,201,1001);

insert into student values (
9412,'Rene Russo','Russo',4,'7502241128467',to_date('1975-02-24','YYYY-MM-DD'),'051)426-1700',172,64,102,null,2001);

insert into student values (
9413,'Sandra Bullock','Bullock',4,'7506152123648',to_date('1975-06-15','YYYY-MM-DD'),'053)266-8947',168,52,103,203,3002);

insert into student values (
9414,'Demi Moore','Moore',4,'7512251063421',to_date('1975-12-25','YYYY-MM-DD'),'02)6255-9875',177,83,201,null,4001);

insert into student values (
9415,'Danny Glover','Glover',4,'7503031639826',to_date('1975-03-03','YYYY-MM-DD'),'031)740-6388',182,70,202,null,4003);

insert into student values (
9511,'Billy Crystal','Crystal',3,'7601232186327',to_date('1976-01-23','YYYY-MM-DD'),'055)333-6328',164,48,101,null,1002);

insert into student values (
9512,'Nicholas Cage','Cage',3,'7604122298371',to_date('1976-04-12','YYYY-MM-DD'),'051)418-9627',161,42,102,201,2002);

insert into student values (
9513,'Micheal Keaton','Keaton',3,'7609112118379',to_date('1976-09-11','YYYY-MM-DD'),'051)724-9618',177,55,202,null,4003);

insert into student values (
9514,'Bill Murray','Murray',3,'7601202378641',to_date('1976-01-20','YYYY-MM-DD'),'055)296-3784',160,58,301,101,4007);

insert into student values (
9515,'Macaulay Culkin','Culkin',3,'7610122196482',to_date('1976-10-12','YYYY-MM-DD'),'02)312-9838',171,54,201,null,4001);

insert into student values (
9611,'Richard Dreyfus','Dreyfus',2,'7711291186223',to_date('1977-11-29','YYYY-MM-DD'),'02)6788-4861',182,72,101,null,1002);

insert into student values (
9612,'Tim Robbins','Robbins',2,'7704021358674',to_date('1977-04-02','YYYY-MM-DD'),'055)488-2998',171,70,102,null,2001);

insert into student values (
9613,'Wesley Snipes','Snipes',2,'7709131276431',to_date('1977-09-13','YYYY-MM-DD'),'053)736-4981',175,82,201,null,4002);

insert into student values (
9614,'Steve Martin','Martin',2,'7702261196365',to_date('1977-02-26','YYYY-MM-DD'),'02)6175-3945',166,51,201,null,4003);

insert into student values (
9615,'Daniel Day-Lewis','Day-Lewis',2,'7712141254963',to_date('1977-12-14','YYYY-MM-DD'),'051)785-6984',184,62,301,null,4007);

insert into student values (
9711,'Danny Devito','Devito',1,'7808192157498',to_date('1978-08-19','YYYY-MM-DD'),'055)278-3649',162,48,101,null,null);

insert into student values (
9712,'Sean Connery','Connery',1,'7801051776346',to_date('1978-01-05','YYYY-MM-DD'),'02)381-5440',175,63,201,null,null);

insert into student values (
9713,'Christian Slater','Slater',1,'7808091786954',to_date('1978-08-09','YYYY-MM-DD'),'031)345-5677',173,69,201,null,null);

insert into student values (
9714,'Charlie Sheen','Sheen',1,'7803241981987',to_date('1978-03-24','YYYY-MM-DD'),'055)423-9870',179,81,102,null,null);

insert into student values (
9715,'Anthony Hopkins','Hopkins',1,'7802232116784',to_date('1978-02-23','YYYY-MM-DD'),'02)6122-2345',163,51,103,null,null);

commit;

--drop table emp2 cascade constraint ;

CREATE TABLE EMP2 (
 EMPNO       NUMBER  PRIMARY KEY,
 NAME        VARCHAR2(30) NOT NULL,
 BIRTHDAY    DATE,
 DEPTNO      VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(30),
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 PAY         NUMBER,
 POSITION    VARCHAR2(30),
 PEMPNO      NUMBER
);

INSERT INTO EMP2 VALUES (19900101,'Kurt Russell',TO_DATE('19640125','YYYYMMDD'),'0001','Permanent employee','054)223-0001','music',100000000,'Boss',null);
INSERT INTO EMP2 VALUES (19960101,'AL Pacino',TO_DATE('19730322','YYYYMMDD'),'1000','Permanent employee','02)6255-8000','reading',72000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19970201,'Woody Harrelson',TO_DATE('19750415','YYYYMMDD'),'1000','Permanent employee','02)6255-8005','Fitness',50000000,'Section head',19960101);
INSERT INTO EMP2 VALUES (19930331,'Tommy Lee Jones',TO_DATE('19760525','YYYYMMDD'),'1001','Perment employee','02)6255-8010','bike',60000000,'Deputy department head',19960101);
INSERT INTO EMP2 VALUES (19950303,'Gene Hackman',TO_DATE('19730615','YYYYMMDD'),'1002','Perment employee','02)6255-8020','Marathon',56000000,'Section head',19960101);
INSERT INTO EMP2 VALUES (19966102,'Kevin Bacon',TO_DATE('19720705','YYYYMMDD'),'1003','Perment employee','052)223-4000','Music',75000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19930402,'Hugh Grant',TO_DATE('19720815','YYYYMMDD'),'1004','Perment employee','042)998-7005','Climb',51000000,'Section head',19966102);
INSERT INTO EMP2 VALUES (19960303,'Keanu Reeves',TO_DATE('19710925','YYYYMMDD'),'1005','Perment employee','031)564-3340','Climb',35000000,'Deputy Section chief',19966102);
INSERT INTO EMP2 VALUES (19970112,'Val Kilmer',TO_DATE('19761105','YYYYMMDD'),'1006','Perment employee','054)223-4500','Swim',68000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19960212,'Chris O''Donnell',TO_DATE('19721215','YYYYMMDD'),'1007','Perment employee','054)223-4600',null,49000000,'Section head',19970112);
INSERT INTO EMP2 VALUES (20000101,'Jack Nicholson',TO_DATE('19850125','YYYYMMDD'),'1008','Contracted Worker','051)123-4567','Climb', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000102,'Denzel Washington',TO_DATE('19830322','YYYYMMDD'),'1009','Contracted Worker','031)234-5678','Fishing', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000203,'Richard Gere',TO_DATE('19820415','YYYYMMDD'),'1010','Contracted Worker','02)2345-6789','Baduk', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000334,'Kevin Costner',TO_DATE('19810525','YYYYMMDD'),'1011','Contracted Worker','053)456-7890','Singing', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000305,'JohnTravolta',TO_DATE('19800615','YYYYMMDD'),'1008','Probation','051)567-8901','Reading book', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20006106,'Robert De Niro',TO_DATE('19800705','YYYYMMDD'),'1009','Probation','031)678-9012','Driking',   22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000407,'Sly Stallone',TO_DATE('19800815','YYYYMMDD'),'1010','Probation','02)2789-0123','Computer game', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000308,'Tom Cruise',TO_DATE('19800925','YYYYMMDD'),'1011','Intern','053)890-1234','Golf', 20000000,'',19960212);
INSERT INTO EMP2 VALUES (20000119,'Harrison Ford',TO_DATE('19801105','YYYYMMDD'),'1004','Intern','042)901-2345','Drinking',   20000000,'',19930402);
INSERT INTO EMP2 VALUES (20000210,'Clint Eastwood',TO_DATE('19801215','YYYYMMDD'),'1005','Intern','031)345-3456','Reading book', 20000000,'',19960303);
COMMIT;

drop table dept2 cascade constraint;

CREATE TABLE DEPT2 (
 DCODE   VARCHAR2(06)  PRIMARY KEY,
 DNAME   VARCHAR2(30) NOT NULL,
 PDEPT VARCHAR2(06) ,
 AREA        VARCHAR2(30)
);

INSERT INTO DEPT2 VALUES ('0001','President','','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1000','Management Support Team','0001','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1001','Financial Management Team','1000','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1002','General affairs','1000','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1003','Engineering division','0001','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1004','H/W Support Team','1003','Daejeon Branch Office');
INSERT INTO DEPT2 VALUES ('1005','S/W Support Team','1003','Kyunggi Branch Office');
INSERT INTO DEPT2 VALUES ('1006','Business Department','0001','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1007','Business Planning Team','1006','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1008','Sales1 Team','1007','Busan Branch Office');
INSERT INTO DEPT2 VALUES ('1009','Sales2 Team','1007','Kyunggi Branch Office');
INSERT INTO DEPT2 VALUES ('1010','Sales3 Team','1007','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1011','Sales4 Team','1007','Ulsan Branch Office');

commit;

DROP TABLE cal purge ;

CREATE TABLE cal
   (weekno  varchar2(1),
    day   varchar2(5),
    dayno varchar2(2)) ;

insert into cal values ('1','SUN','1');
insert into cal values ('1','MON','2');
insert into cal values ('1','TUE','3');
insert into cal values ('1','WED','4');
insert into cal values ('1','THU','5');
insert into cal values ('1','FRI','6');
insert into cal values ('1','SAT','7');
insert into cal values ('2','SUN','8');
insert into cal values ('2','MON','9');
insert into cal values ('2','TUE','10');
insert into cal values ('2','WED','11');
insert into cal values ('2','THU','12');
insert into cal values ('2','FRI','13');
insert into cal values ('2','SAT','14');
insert into cal values ('3','SUN','15');
insert into cal values ('3','MON','16');
insert into cal values ('3','TUE','17');
insert into cal values ('3','WED','18');
insert into cal values ('3','THU','19');
insert into cal values ('3','FRI','20');
insert into cal values ('3','SAT','21');
insert into cal values ('4','SUN','22');
insert into cal values ('4','MON','23');
insert into cal values ('4','TUE','24');
insert into cal values ('4','WED','25');
insert into cal values ('4','THU','26');
insert into cal values ('4','FRI','27');
insert into cal values ('4','SAT','28');
insert into cal values ('5','SUN','29');
insert into cal values ('5','MON','30');
insert into cal values ('5','TUE','31');
commit ;

DROP TABLE gift purge ;

create table gift
( gno  number ,
  gname varchar2(30) ,
  g_start  number ,
  g_end  number );

insert into gift values(1,'Tuna Set',1,100000);
insert into gift values(2,'Shampoo Set',100001,200000);
insert into gift values(3,'Car wash Set',200001,300000);
insert into gift values(4,'Kitchen Supplies Set',300001,400000);
insert into gift values(5,'Mountain bike',400001,500000);
insert into gift values(6,'LCD Monitor',500001,600000);
insert into gift values(7,'Notebook',600001,700000);
insert into gift values(8,'Wall-Mountable TV',700001,800000);
insert into gift values(9,'Drum Washing Machine',800001,900000);
insert into gift values(10,'Refrigerator',900001,1000000);
commit ;


DROP TABLE customer purge;

create table customer
(gno  number(8) ,
 gname varchar2(30) ,
 jumin char(13) ,
 point number) ;

insert into customer values (20010001,'James Seo','7510231369824',980000);
insert into customer values (20010002,'Mel Gibson','7502241128467',73000);
insert into customer values (20010003,'Bruce Willis','7506152123648',320000);
insert into customer values (20010004,'Bill Pullman','7512251063421',65000);
insert into customer values (20010005,'Liam Neeson','7503031639826',180000);
insert into customer values (20010006,'Samuel Jackson','7601232186327',153000);
insert into customer values (20010007,'Ahnjihye','7604212298371',273000);
insert into customer values (20010008,'Jim Carrey','7609112118379',315000);
insert into customer values (20010009,'Morgan Freeman','7601202378641',542000);
insert into customer values (20010010,'Arnold Scharz','7610122196482',265000);
insert into customer values (20010011,'Brad Pitt','7711291186223',110000);
insert into customer values (20010012,'Michael Douglas','7704021358674',99000);
insert into customer values (20010013,'Robin Williams','7709131276431',470000);
insert into customer values (20010014,'Tom Hanks','7702261196365',298000);
insert into customer values (20010015,'Angela Bassett','7712141254963',420000);
insert into customer values (20010016,'Jessica Lange','7808192157498',598000);
insert into customer values (20010017,'Winona Ryder','7801051776346',625000);
insert into customer values (20010018,'Michelle Pfeiffer','7808091786954',670000);
insert into custormer values (20010019,'Whoopi Goldberg','7803242114563',770000);
insert into custormer values (20010020,'Emma Thompson','7802232116784',730000);
commit ;

DROP TABLE hakjum purge ;

create table hakjum
(grade char(3) ,
 min_point  number ,
 max_point  number );

insert into hakjum values ('A+',96,100);
insert into hakjum values ('A0',90,95);
insert into hakjum values ('B+',86,89);
insert into hakjum values ('B0',80,85);
insert into hakjum values ('C+',76,79);
insert into hakjum values ('C0',70,75);
insert into hakjum values ('D',0,69);

commit;


drop table score purge ;

create table score
(studno  number ,
 total number);

insert into score values (9411,97);
insert into score values (9412,78);
insert into score values (9413,83);
insert into score values (9414,62);
insert into score values (9415,88);
insert into score values (9511,92);
insert into score values (9512,87);
insert into score values (9513,81);
insert into score values (9514,79);
insert into score values (9515,95);
insert into score values (9611,89);
insert into score values (9612,77);
insert into score values (9613,86);
insert into score values (9614,82);
insert into score values (9615,87);
insert into score values (9711,91);
insert into score values (9712,88);
insert into score values (9713,82);
insert into score values (9714,83);
insert into score values (9715,84);

commit ;

drop table p_grade purge ;

create table p_grade
( position  varchar2(30) ,
  s_age number ,
  e_age number ,
  s_year number ,
  e_year number ,
  s_pay  number ,
  e_pay  number );

insert into p_grade values ('Manager',0,24,1,2,12000000,29990000);
insert into p_grade values ('Deputy Section chief',25,28,3,5,30000000,45000000);
insert into p_grade values ('Section head',29,32,6,8,45010000,51000000);
insert into p_grade values ('Deputy department head',33,36,9,10,51010000,60000000);
insert into p_grade values ('Department head',37,40,11,13,60010000,75000000);
insert into p_grade values ('Director',41,55,14,99,75010000,100000000);

commit ;


drop table t_reg purge ;

CREATE TABLE t_reg
( text varchar2(10)) ;

INSERT ALL
INTO t_reg VALUES('ABC123')
INTO t_reg VALUES('ABC 123')
INTO t_reg VALUES('ABC  123')
INTO t_reg VALUES('abc 123')
INTO t_reg VALUES('abc  123')
INTO t_reg VALUES('a1b2c3')
INTO t_reg VALUES('aabbcc123')
INTO t_reg VALUES('?/!@#$*&')
INTO t_reg VALUES('\~*().,')
INTO t_reg VALUES(123123)
INTO t_reg VALUES('123abc')
INTO t_reg VALUES('abc')
SELECT  *  FROM dual ;

commit;


-- insert all test table

drop table p_01 purge;
drop table p_02 purge;

CREATE TABLE p_01
(no  number ,
 name varchar2(15) );

CREATE TABLE p_02
(no number ,
 name varchar2(15) );



-- merge test table

drop table pt_01 purge;
drop table pt_02 purge;
drop table p_total purge;

create table pt_01
(sno varchar2(8) , pno char(4) , qty number , price  number) ;

create table pt_02
(sno varchar2(8) , pno char(4) , qty number , price number) ;

create table p_total
(sno  varchar2(8) , pno char(4) , qty number , price number) ;

INSERT ALL
 INTO pt_01 VALUES ('12010101','1000',1,500)
 INTO pt_01 VALUES ('12010102','1001',1,400)
 INTO pt_01 VALUES ('12010103','1003',1,300)
 INTO pt_02 VALUES ('12010201','1004',1,600)
 INTO pt_02 VALUES ('12010202','1000',1,500)
 INTO pt_02 VALUES ('12010203','1005',1,700)
 SELECT * FROM dual ;

commit;

-- DML error logging test table

DROP Table dml_err_test purge;

CREATE TABLE dml_err_test
( no number primary key,
  name varchar2(10));

INSERT ALL
INTO dml_err_test VALUES (1,'AAA')
INTO dml_err_test VALUES (2,'BBB')
SELECT  * FROM dual ;

commit ;

create or replace procedure print_table( p_query in varchar2 )
AUTHID CURRENT_USER
is
    l_theCursor     integer default dbms_sql.open_cursor;
    l_columnValue   varchar2(4000);
    l_status        integer;
    l_descTbl       dbms_sql.desc_tab;
    l_colCnt        number;
begin
    execute immediate
    'alter session set
        nls_date_format=''yyyy-mm-dd:hh24:mi:ss'' ';
    dbms_sql.parse(  l_theCursor,  p_query, dbms_sql.native );
    dbms_sql.describe_columns
    ( l_theCursor, l_colCnt, l_descTbl );
    for i in 1 .. l_colCnt loop
        dbms_sql.define_column
        (l_theCursor, i, l_columnValue, 4000);
    end loop;
    l_status := dbms_sql.execute(l_theCursor);
    while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop
        for i in 1 .. l_colCnt loop
            dbms_sql.column_value
            ( l_theCursor, i, l_columnValue );
            dbms_output.put_line
            ( rpad( l_descTbl(i).col_name, 30 )
              || ': ' ||
              l_columnValue );
        end loop;
        dbms_output.put_line( '-----------------' );
    end loop;
    execute immediate
        'alter session set nls_date_format=''yyyy-mm-dd'' ';
exception
    when others then
      execute immediate
          'alter session set nls_date_format=''yyyy-mm-dd'' ';
      raise;
end;
 /


-- Constraint test table

drop table t_novalidate purge ;
drop table test_novalidate purge ;

CREATE TABLE t_novalidate
( no number primary key ,
  name varchar2(10) not null );

INSERT INTO t_novalidate VALUES(1,'AAA');
INSERT INTO t_novalidate VALUES(2,'BBB');
INSERT INTO t_novalidate VALUES(3,'CCC');
COMMIt ;

drop table t_validate purge ;
drop table test_validate purge;

CREATE TABLE t_validate
 ( no number
    CONSTRAINT tv_no_pk PRIMARY KEY ,
   name  varchar2(10)
    CONSTRAINT tv_name_nn NOT NULL) ;

INSERT INTO t_validate VALUES (1,'AAA');
INSERT INTO t_validate VALUES (2,'BBB');
INSERT INTO t_validate VALUES (3,'CCC');
COMMIT ;

drop table t_enable purge;
drop table test_enable purge ;

CREATE TABLE t_enable
 ( no number
    CONSTRAINT te_no_pk PRIMARY KEY ,
   name varchar2(10)
    CONSTRAINT te_name_nn NOT NULL) ;



-- group function test table

drop table product purge ;

CREATE TABLE product
( p_code  number(3) primary key,
  p_name varchar2(20) not null ,
  p_price  number) ;


insert into product values (100,'Shrimp snack',800);
insert into product values (101,'Patato snack',900);
insert into product values (102,'Peanut snack',1000);
insert into product values (103,'Sesame snack',900);
insert into product values (104,'Onion snack',800);
insert into product values (105,'Sweet potato snack',1500);
commit;

drop table panmae purge ;

create table panmae
( p_date varchar2(8) not null,
  p_code number not null,
  p_qty  number ,
  p_total number ,
  p_store varchar2(5) );

insert into panmae values ('20110101',100,3,2400,'1000');
insert into panmae values ('20110101',101,5,4500,'1001');
insert into panmae values ('20110101',102,2,2000,'1003');
insert into panmae values ('20110101',103,6,5400,'1004');
insert into panmae values ('20110102',102,2,2000,'1000');
insert into panmae values ('20110102',103,5,4500,'1002');
insert into panmae values ('20110102',104,3,2400,'1002');
insert into panmae values ('20110102',105,2,3000,'1000');
insert into panmae values ('20110103',100,10,8000,'1004');
insert into panmae values ('20110103',100,2,1600,'1000');
insert into panmae values ('20110103',100,3,2400,'1001');
insert into panmae values ('20110103',101,4,3600,'1003');
insert into panmae values ('20110104',100,2,1600,'1002');
insert into panmae values ('20110104',100,4,3200,'1003');
insert into panmae values ('20110104',100,5,4000,'1004');
insert into panmae values ('20110104',101,3,2700,'1001');
insert into panmae values ('20110104',101,4,3600,'1002');
insert into panmae values ('20110104',101,3,2700,'1003');
insert into panmae values ('20110104',102,4,4000,'1001');
insert into panmae values ('20110104',102,2,2000,'1002');
insert into panmae values ('20110104',103,2,1800,'1003');


commit;

drop table member purge ;
create table member
(no number(4) not null ,
 name varchar2(20) not null ,
 jumin char(13) primary key ,
 passwd varchar2(10) not null ,
 id  varchar2(10) not null unique ,
 an_key varchar2(10) ,
 an_key_dap  varchar2(15) );

insert into member
 values (1001,'Nicholas Cage','7510231234567','a1234','simson','wife?','Jodie Foster') ;
insert into member
 values(1002,'Jodie Foster','7509222345678','b1234','bobby','husband?','Nicholas Cage') ;
insert into member
 values (1003,'Macaulay Culkin','1410234567890','c1234','daddy','father?','Nicholas Cage');
insert into member
 values (1004,'Nicole Kidman','1609223456789','d1234','mommy','Mather?','Jodie Foster') ;



commit;
drop table t_reg2 purge ;
create table t_reg2
(no number , 
 ip varchar2(20));

insert into t_reg2 values (1,'10.10.0.1') ;
insert into t_reg2 values (2,'10.10.10.1') ;
insert into t_reg2 values (3,'172.16.5.100') ;
insert into t_reg2 values (4,'172.61.186.2') ;
insert into t_reg2 values (5,'172.61.168.2') ;
insert into t_reg2 values (6,'255.255.255.0') ;
commit;

drop table fruit purge ;
create table fruit (name varchar2(10) , price number(5)) ;
insert into fruit values ('apple' , 100) ;
insert into fruit values ('grape' , 200) ;
insert into fruit values ('orange' ,300) ;
commit;

drop table loan purge ;

create table loan
( l_date varchar2(8) not null,
  l_code number not null,
  l_qty  number ,
  l_total number ,
  l_store varchar2(5) );


insert into loan values ('20110101',100,3,2400,'1000');
insert into loan values ('20110101',101,5,4500,'1001');
insert into loan values ('20110101',102,2,2000,'1003');
insert into loan values ('20110101',103,6,5400,'1004');
insert into loan values ('20110102',102,2,2000,'1000');
insert into loan values ('20110102',103,5,4500,'1002');
insert into loan values ('20110102',104,3,2400,'1002');
insert into loan values ('20110102',105,2,3000,'1000');
insert into loan values ('20110103',100,10,8000,'1004');
insert into loan values ('20110103',100,2,1600,'1000');
insert into loan values ('20110103',100,3,2400,'1001');
insert into loan values ('20110103',101,4,3600,'1003');
insert into loan values ('20110104',100,2,1600,'1002');
insert into loan values ('20110104',100,4,3200,'1003');
insert into loan values ('20110104',100,5,4000,'1004');
insert into loan values ('20110104',101,3,2700,'1001');
insert into loan values ('20110104',101,4,3600,'1002');
insert into loan values ('20110104',101,3,2700,'1003');
insert into loan values ('20110104',102,4,4000,'1001');
insert into loan values ('20110104',102,2,2000,'1002');
insert into loan values ('20110104',103,2,1800,'1003');


commit;

CREATE TABLE emp_copy AS SELECT * FROM emp;
select * from emp_copy; -- 실제 자료가 있는 물리적 테이블

CREATE VIEW emp_view30 
AS
SELECT empno, ename, deptno FROM emp WHERE deptno = 30;

SELECT * FROM emp_view30;
SELECT ename FROM emp_view30;

SELECT * FROM course;
SELECT * FROM course WHERE cou_id = 20;

CREATE VIEW course_view_20 (cou_id, cou_name) AS SELECT cou_id, cou_name FROM course WHERE cou_id = 20;
SELECT * FROM course_view_20;
desc user_views
drop view course_view_20;
SELECT view_name, text FROM user_views

-- View의 동작 순서
-- 1. 사용자가 쿼리문을 수행 : SELECT * FROM course_view_20;
-- 2. View의 TEXT 칼럼안에 있는 자료인 SELECT문을 수행
-- 3. SELECT문을 통해 물리적인 데이터가 조회
-- 4. 조회에 의한 결과 수행
-- 5. 1번으로 결과를 리턴

-- View를 사용하는 이유
-- 1. 긴 쿼리문 or 자주 사용하는 쿼리문을 뷰로 만들면 접근이 쉬워진다.
-- 2. 보안에 유리하다.(실제 데이터를 주는게 아니라 논리적인 데이터를 주기 때문에)

-- View를 만드는 방법
-- 1. SELECT문
-- 2. INSERT문으로 View에 데이터 추가
SELECT * FROM emp_view30;
INSERT INTO emp_view30 VALUES(2222,'bbbb',30);
-- 물리적 데이터에는 추가되지 않음
SELECT * FROM emp;
-- View로 데이터 수정하기
UPDATE emp_view30 SET ename = '이지은' WHERE ename = '오지호';
-- bbbb인 사람의 ename 바꾸기
UPDATE emp_view30 SET ename = '아이유' WHERE ename = 'bbbb';
-- View 테이블을 이용하여 aaaa인 사람 데이터 삭제 
DELETE emp_view30 WHERE empno = 2222;

CREATE VIEW emp_view_dept AS SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc FROM emp_copy e, dept d
WHERE e.deptno = d.deptno;

select * from user_views

SELECT * FROM emp;

CREATE VIEW emp_view
AS
SELECT empno, ename, job, mgr, hiredate, deptno FROM emp;

-- 현재 데이터베이스에서 모든 View 보기
SELECT * FROM user_views;

-- View 삭제하기
DROP VIEW emp_view
DROP VIEW course_view_20;

DROP VIEW emp_view30;

CREATE OR REPLACE VIEW emp_view30
AS
SELECT empno, ename, sal, comm, deptno FROM emp_copy WHERE deptno = 30;

-- FORCE 옵션 : 테이블이 없는데도 View를 만드는 것, 거의 사용하지 않음
CREATE OR REPLACE FORCE VIEW employees_view
AS
SELECT empno, ename, deptno FROM employees WHERE deptno = 30;       
SELECT * FROM employees_view;
DROP VIEW employees_view

-- WITH CHECK OPTION : WHERE절에 있는 칼럼의 값 변경하지 못하게 함
CREATE OR REPLACE VIEW emp_view30
AS
SELECT empno, ename, sal, comm, deptno FROM emp_copy WHERE deptno = 30;
SELECT * FROM emp_view30;
-- 급여가 400 이상인 사원을 20번 부서로 변경
UPDATE emp_view30 SET deptno = 20 WHERE sal >= 400;

CREATE OR REPLACE VIEW emp_view30
AS
SELECT empno, ename, sal, comm, deptno
FROM emp_copy WHERE deptno=30
WITH CHECK OPTION;

UPDATE emp_view30 SET comm = 100 WHERE empno = 1002;-- O
UPDATE emp_view30 SET deptno = 20 WHERE sal>250;-- X
UPDATE emp_view30 SET ename = '조유리' WHERE sal>250;-- O


SELECT * FROM member;
CREATE OR REPLACE VIEW member_a1234 AS SELECT no, name, passwd, id FROM member WHERE passwd = 'a1234' and no = 1001
WITH CHECK OPTION;
UPDATE member_a1234 SET name = 'Jieun' WHERE no = 1001; -- O
UPDATE member_a1234 SET id = 'IU' WHERE no = 1001; -- O 
UPDATE member_a1234 passwd = 'b1212' WHERE no = 1001; -- X
UPDATE member_a1234 no = 7777 WHERE passwd = 'b1212'; -- X
SELECT * FROM member_a1234;

-- WITH READ ONLY : 모든 컬럼을 읽기 전용으로 변경(수정 불가능)
CREATE OR REPLACE VIEW view_read30
AS
SELECT * FROM emp_copy WHERE deptno = 30 WITH READ ONLY;
SELECT * FROM view_read30;
UPDATE view_read30 SET ename = '홍길동' WHERE deptno = 30; -- X
INSERT INTO view_read30 VALUES(1020, '이지은', '회장', 1002, sysdate, 2000, 100, 30); -- X
DELETE FROM view_read30 WHERE deptno = 30; -- X

CREATE OR REPLACE VIEW view_hire
AS
SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;

CREATE OR REPLACE VIEW view_view_hire
AS
SELECT empno, ename, hiredate FROM view_hire WHERE ROWNUM <= 5;

SELECT * FROM view_view_hire;

-- emp, dept 테이블을 조회하여 부서번호와 부셔별 최대급여 및 부서명을 출력
SELECT e.deptno, d.dname, e.maxsal FROM (SELECT deptno, max(sal) maxsal FROM emp GROUP BY deptno) e, dept d;

-- 인라인 뷰로 입사일이 빠른 사람 5명만 출력하게
SELECT ROWNUM, ve.empno, ve.ename, mindate 
FROM (SELECT empno, ename, min(hiredate) mindate FROM emp ORDER BY hiredate) ve WHERE ROWNUM <= 5;

-- 1단계 View로 만든다
CREATE OR REPLACE VIEW vv
AS
SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
-- 2단계 View에서 검색
SELECT ROWNUM, empno, ename, hiredate
FROM vv -- 위의 SELECT empno, ename, hiredate FROM emp ORDER BY hiredate를 vv에 넣은 것
WHERE ROWNUM <= 5;
-- 인라인 뷰
SELECT ROWNUM, vv.empno, vv.ename, vv.hiredate
FROM (SELECT empno, ename, hiredate FROM emp ORDER BY hiredate) vv
WHERE ROWNUM <= 5;

-- 1. 사원 테이블을 기본 테이블로 하여 부서별 최대 급여와 최소급여를 출력하는 View를 SAL_VIEW란 이름으로 작성
CREATE OR REPLACE VIEW sal_view
AS
SELECT d.dname, max(e.sal) maxsal, min(e.sal) minsal FROM emp e, dept d WHERE e.deptno = d.deptno GROUP BY d.dname;

-- 2. 인라인 뷰를 사용하여 급여를 많이 받는 순서대로 3명만 출력
SELECT ROWNUM, vvv.empno, vvv.ename, vvv.sal
FROM (SELECT empno, ename, sal FROM emp ORDER BY sal desc) vvv
WHERE ROWNUM <= 3 AND sal IS NOT NULL;

-- 3. professor테이블과 department테이블을 조인하여 교수번호와 교수이름, 소속 학과이름을 조회하는 view를 생성
-- view 이름은 v_prof_dept2
CREATE OR REPLACE VIEW v_prof_dept2
AS
SELECT profno, name, position, dname FROM professor, department WHERE professor.deptno = department.deptno;

-- 4. inline view를 사용하여 student테이블과 departmant테이블을 사용하여 학과별로 학생들의 최대키와 최대 몸무게, 학과 이름을 출력
SELECT d.dname, s.max_height, s.max_weight
FROM (SELECT deptno1, max(height) max_height, max(weight) max_weight FROM student GROUP BY deptno1) s, 
department d WHERE s.deptno1 = d.deptno

-- 5. student테이블과 departmemt테이블을 사용하여 학과 이름, 학과별 최대키, 학과별로 가장 키가 큰 학생들의 이름과 키를 inline view를 사용하여 출력
SELECT d.dname, a.max_height, s.name, s.height
FROM (SELECT deptno1, max(height) max_height FROM student GROUP BY deptno1) a, department d, student s
WHERE a.deptno1 = d.deptno AND s.height = a.max_height AND s.deptno1 = d.deptno;

-- 6. student테이블에서 학생의 키가 동일 학년의 평균 키보다 큰 학생들의 학년과 이름 키, 해당 학년의 평균키를 출력하되 inline view를 사용해서 출력
--        (학년 컬럼으로 오름차순 정렬해서 출력)
SELECT s.grade, s.name, s.height, a.avg_height
FROM (SELECT grade, avg(height) avg_height FROM student GROUP BY grade) a, student s
WHERE a.grade = s.grade AND a.avg_height < s.height ORDER BY grade;

-- 7. professor테이블을 조회하여 교수들의 급여 순위와 이름과 급여을 출력
--        단 급여 순위는 급여가 많은 사람부터 1~5위까지 출력
SELECT ROWNUM, name, pay
FROM (SELECT name, pay FROM professor ORDER BY pay desc)
WHERE ROWNUM <= 5;
-- 중간을 구하고 싶으면 ROWNUM BETWEEN 3 AND 8;

-- ?8. 교수 테이블을 교수 번호로 정렬하되 3건씩 분리해서 급여 합계와 급여 평균을 출력
SELECT num, profno, name, pay, sum(pay), round(avg(pay),1)
FROM (SELECT profno, name, pay, ROWNUM num FROM professor)
GROUP BY CEIL(num/3), ROLLUP((profno, name, pay, num))
ORDER BY CEIL(num/3);

select * from professor
select * from student;
select * from department

SELECT CEIL(10/3) FROM dual;

SELECT dname, job, count(*), sum(sal) FROM emp, dept WHERE dept.deptno = emp.deptno GROUP BY ROLLUP(dname, job);