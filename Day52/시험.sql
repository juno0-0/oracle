create table doctor(
    d_id number(4) primary key,
    d_name varchar2(12) not null,
    d_gender varchar2(3) not null,
    d_subject varchar2(50),
    d_tell number(15),
    d_email varchar2(30),
    d_job varchar2(50));
    
create table patient(
    p_id number(4) primary key,
    p_name varchar2(12) not null,
    p_gender varchar2(3) not null,
    p_doctor varchar2(12) not null,
    p_num number(13) not null,
    p_addr varchar2(50),
    p_tell number(15),
    p_nurse varchar2(12),
    p_email varchar2(50),
    p_job varchar2(50));
    
create table nurse(
    n_id number(4) primary key,
    n_name varchar2(12) not null,
    n_gender varchar2(3) not null,
    n_subject varchar2(50),
    n_tell number(15),
    n_email varchar2(50),
    n_job varchar2(50));
    
create table clinic(
    c_id number(4) primary key,
    c_did number(4) not null,
    c_pid number(4) not null,
    c_content varchar2(500),
    c_date date);
    
create table chart(
    ch_num number(4) primary key,
    ch_did number(4),
    ch_nid number(4),
    ch_pid number(4),
    ch_cid number(4),
    ch_opinion varchar2(500));