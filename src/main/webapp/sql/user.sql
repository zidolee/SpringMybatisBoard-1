CREATE TABLE USERS
   (ID VARCHAR2(30) primary key,
	PASSWORD VARCHAR2(30) not null,
	NAME VARCHAR2(50) not null,
    sex varchar2(10) not null,
    birthday date not null,
    hp varchar2(13) not null,
    address varchar2(200) not null,
    reg_Date date default sysdate
    );
