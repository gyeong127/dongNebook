CREATE TABLE "CATEGORY"(
    category_no NUMBER PRIMARY KEY,
    category_name VARCHAR2(20) NOT NULL
);
CREATE TABLE "USER"(
    user_no NUMBER PRIMARY KEY,
    category_no NUMBER,
    user_id VARCHAR2(100) NOT NULL UNIQUE,
    user_pw VARCHAR2(100) NOT NULL,
    user_name VARCHAR2(20) NOT NULL UNIQUE,
    phone CHAR(13) NULL,
    email VARCHAR2(100) NOT NULL,
    addr VARCHAR2(100) NULL
);

ALTER TABLE "USER" ADD CONSTRAINT category_no_foreign_key 
FOREIGN KEY(category_no) REFERENCES "CATEGORY"(category_no) ON DELETE CASCADE;
CREATE TABLE ALRAM(
    ALRAM_NO NUMBER PRIMARY KEY,
    USER_NO NUMBER,
    ALRAM_CONTENT VARCHAR2(500),
    ENROLL_DATE DATE,
    ALRAM_CHECK CHAR(1) DEFAULT('N') CHECK(ALRAM_CHECK IN ('Y','N'))
);


CREATE TABLE "ADMIN"(
    ADMIN_NO NUMBER PRIMARY KEY,
    ADMIN_ID VARCHAR2(20) NOT NULL UNIQUE,
    ADMIN_PW VARCHAR2(100) NOT NULL,
    NICKNAME VARCHAR2(20) unique
);

CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_WRITER VARCHAR2(20) NULL,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000),
    ENROLL_DATE DATE
);
ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_WRITER_FORIEIGN_KEY
FOREIGN KEY(NOTICE_WRITER) REFERENCES "ADMIN"(NICKNAME) ON DELETE set null;

CREATE TABLE BOOK(
    BOOK_NO NUMBER PRIMARY KEY,
    BOOK_NAME VARCHAR2(500),
    BOOK_KIND VARCHAR2(300),
    BOOK_WRITER VARCHAR2(300),
    BOOK_PUBLISHER VARCHAR2(500),
    BOOK_INTRODUCE VARCHAR2(4000),
    ISBN13 varchar2(20) unique,
    ISBN10 varchar2(20) unique,
    book_count number default 0,
    rCount number default 0,
    IMAGEURL VARCHAR2(4000)
);

CREATE TABLE BOOK_RENTAL_RESERVE(
    BOOK_RENTAL_RESERVE_NO NUMBER PRIMARY KEY,
    BOOK_NO NUMBER ,
    USER_NO NUMBER 
);

ALTER TABLE BOOK_RENTAL_RESERVE ADD CONSTRAINT BOOK_RENTAL_RESERVE_BOOK_NO_FK
FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO) ON DELETE CASCADE;

ALTER TABLE BOOK_RENTAL_RESERVE ADD CONSTRAINT BOOK_RENTAL_RESERVE_USER_NO_FK
FOREIGN KEY(USER_NO) REFERENCES "USER"(USER_NO) ON DELETE CASCADE;

CREATE TABLE RENTAL_LOCATION(
    RENTAL_LOCATION_NO NUMBER PRIMARY KEY,
    PLACENAME VARCHAR2(50),
    ADDR VARCHAR2(300),
    PHONE VARCHAR(20)
);
CREATE TABLE BOOK_RENTAL(
    BOOK_RENTAL_NO NUMBER PRIMARY KEY,
    USER_NO NUMBER ,
    BOOK_NO NUMBER ,
    RENTAL_LOCATION_NO NUMBER NOT NULL,
    ENROLL_DATE DATE,
    RETURN_DATE DATE
);
ALTER TABLE BOOK_RENTAL ADD CONSTRAINT BOOK_RENTAL_USER_NO_Fk
FOREIGN KEY(USER_NO) REFERENCES "USER"(USER_NO) ON DELETE CASCADE;

ALTER TABLE BOOK_RENTAL ADD CONSTRAINT BOOK_RENTAL_BOOK_NO_FK
FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO) ON DELETE CASCADE;

ALTER TABLE BOOK_RENTAL ADD CONSTRAINT BOOK_RENTAL_LOCATION_NO_FK
FOREIGN KEY(RENTAL_LOCATION_NO) REFERENCES RENTAL_LOCATION(RENTAL_LOCATION_NO) ON DELETE SET NULL;

CREATE TABLE BOOK_PROPOSAL(
    BOOK_PROPOSAL_NO NUMBER PRIMARY KEY,
    USER_NO NUMBER ,
    BOOK_NAME VARCHAR2(500),
    BOOK_KIND VARCHAR2(300),
    BOOK_WRITER VARCHAR2(300),
    BOOK_PUBLISHER VARCHAR2(500),
    BOOK_INTRODUCE VARCHAR2(4000),
    ISBN13 varchar2(20) unique,
    ISBN10 varchar2(20) unique,
    IMAGEURL VARCHAR2(4000),
    reason varchar2(4000)
);

ALTER TABLE BOOK_PROPOSAL ADD CONSTRAINT BOOK_PROPOSAL_USER_NO_FK
FOREIGN KEY(USER_NO) REFERENCES "USER"(USER_NO) ON DELETE SET NULL;


CREATE TABLE BOOK_REVIEW(
    BOOK_REVIEW_NO NUMBER PRIMARY KEY,
    BOOK_NO NUMBER,
    USER_NAME VARCHAR2(20),
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(4000),
    RATING NUMBER,
    ENROLL_DATE DATE
);

ALTER TABLE BOOK_REVIEW ADD CONSTRAINT BOOK_REVIEW_BOOK_NO_FK
FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO) ON DELETE SET NULL;


ALTER TABLE BOOK_REVIEW ADD CONSTRAINT BOOK_REVIEW_USER_NAME_FK
FOREIGN KEY(USER_NAME) REFERENCES "USER"(USER_NAME) ON DELETE SET NULL;

CREATE TABLE CALENDAR(
    CALENDAR_NO NUMBER PRIMARY KEY,
    CALENDAR_TITLE VARCHAR2(100) not null,
    CALENDAR_STARTDATE CHAR(19) not null,
    CALENDAR_ENDDATE CHAR(19) not null,
    background_color varchar2(16),
    text_color varchar2(16),
    border_color varchar2(16)
);

create table "FILE"(
    file_no number primary key,
    table_no number not null,
    table_name varchar2(20) not null,
    filename varchar2(50),
    filepath varchar2(50)
);

create table bookmark(
    user_no number,
    isbn13 varchar2(20),
    primary key(user_no,isbn13)
);

ALTER TABLE bookmark ADD CONSTRAINT bookmark_user_no_Fk
FOREIGN KEY(USER_NO) REFERENCES "USER"(USER_NO) ON DELETE CASCADE;

ALTER TABLE bookmark ADD CONSTRAINT bookmark_isbn_Fk
FOREIGN KEY(isbn13) REFERENCES book(isbn13) ON DELETE CASCADE;

create sequence notice_seq;
create sequence admin_seq;
create sequence calendar_seq;
create sequence book_proposal_seq;
create sequence book_favorites_seq;
create sequence book_review_seq;
create sequence book_rental_reserve_seq;
create sequence rental_location_seq;
create sequence book_rental_seq;
create sequence book_seq;
create sequence user_seq;
create sequence category_seq;
create sequence file_seq;
create sequence alram_seq;



