--회원 테이블-------------------------------
CREATE TABLE member(
user_no NUMBER(5) NOT NULL, --회원번호
user_level varchar2(20) not null, --회원등급
user_id VARCHAR2(50) NOT NULL, --회원 아이디
user_pw VARCHAR2(100) NOT NULL, --회원 비밀번호
user_name VARCHAR2(100) NOT NULL, --회원 이름
user_gender varchar2(5) not null, --회원 성별
user_year number(4) not null, --회원 생년
user_month number(2) not null, --회원 생월
user_day number(2) not null, --회원 생일
user_pnum1 number(3) not null, --회원 휴대폰번호1
user_pnum2 number(4) not null, --회원 휴대폰번호2
user_pnum3 number(4) not null, --회원 휴대폰번호3
user_emailid varchar2(20) not null, --회원 이메일 아이디
user_emailsite varchar2(30) not null, --회원 이메일 도메인
user_postcode number(5) not null, --회원 우편번호
user_address1 varchar2(50) not null, --회원 주소1
user_address2 varchar2(50) not null, --회원 주소2
agree_ad varchar2(10) not null, --회원 광고동의여부
reg_date DATE DEFAULT SYSDATE, --회원 가입날짜
PRIMARY KEY (user_no)
);

CREATE TABLE persistent_logins(
username varchar2(64) not null,
series varchar2(64) not null,
token varchar2(64) not null,
lost_used date not null,
primary key(series));

CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE member_auth (
user_no NUMBER(5) NOT NULL,
auth VARCHAR2(50) NOT NULL
);

ALTER TABLE member_auth ADD CONSTRAINT fk_member_auth_user_no
FOREIGN KEY (user_no) REFERENCES member(user_no);

-- 회원 테이블 end ------------------------------

--공연 테이블 ------------------------------
CREATE TABLE show(
show_num number(10) not null, --공연번호_pk
show_name varchar2(50) not null, --공연명
show_place varchar2(50) not null, --공연장소
show_round number(10) not null, --공연회차
show_date varchar2(50) not null, --공연일정
show_cast varchar2(2000) not null, --출연진
show_num_of_cast number(2) not null, --출연진 수
show_attachments varchar2(200), --공연 첨부파일 명
show_runtime number(3) not null, --런타임
show_capacity number(3) not null, --수용 가능 인원 
show_reservations number(3), --현 예약 인원
show_total_reservations number(3), --총 예약 인원
primary key(show_num) --공연번호_pk설정
);

--공연 시퀀스
CREATE SEQUENCE show_seq 
START WITH 1
INCREMENT BY 1;
-- 공연 테이블 end ------------------------------

-- 지원 테이블------------------------------
create table apply(
apply_num number(10) not null, --지원번호_pk
apply_gisu varchar2(5) not null, --기수
apply_registration_date varchar2(50) not null, --수강신청 날짜
apply_refund_request_date varchar2(50) not null, --환불신청 날짜
apply_attendance_status varchar2(50) not null, --수강 현황
apply_attachments varchar2(50) not null, --첨부파일명
apply_stage_experience varchar2(5) not null, --무대경험
apply_about_s_e varchar2(100) null, --무대경험 있음
apply_self_introduction varchar2(200) not null, --자기소개
apply_user_no number(10) not null, --회원_회원번호
apply_user_name VARCHAR2(100) NOT NULL,--회원_이름
apply_user_gender varchar2(5) not null,--회원_성별
apply_user_year number(4) not null,--회원_생년월일 년도
apply_user_month number(2) not null,--회원_생년월일 월
apply_user_day number(2) not null,--회원_생년월일 일
apply_user_pnum1 number(3) not null,--회원_핸드폰 번호 1
apply_user_pnum2 number(4) not null,--회원_핸드폰 번호 2
apply_user_pnum3 number(4) not null,--회원_핸드폰 번호 3
apply_user_emailid varchar2(20) not null,--회원_이메일
apply_user_emailsite varchar2(30) not null,--회원_이메일2
apply_user_postcode number(5) not null,--회원_주소(우편번호)
apply_user_address1 varchar2(50) not null,--회원_주소(상세주소)1
apply_user_address2 varchar2(50) not null,--회원_주소(상세주소)2
apply_class_num number(10) not null, --수업_수업번호
apply_class_name VARCHAR2(30) NOT NULL, --수업_수업명
apply_class_period VARCHAR2(50) NOT NULL, --수업_수업기간
apply_class_regist_recruitment VARCHAR2(30) NOT NULL, --수업_모집현황
primary key(apply_num) --지원번호_pk 설정
);

-- 지원 시퀀스
create sequence apply_seq
start with 1
increment by 1;

-- 지원 테이블 end ------------------------------

-- 공지사항 테이블------------------------------
CREATE TABLE admin_notice(
notice_num number(10) not null, --게시글 번호
notice_title varchar2(500) not null, --제목
notice_content varchar2(1000) not null, --내용
notice_writer varchar2(10) not null, -- 작성자
notice_reg date default sysdate, --등록일
primary key(notice_num) --게시글 번호 pk
);

--공지사항 시퀀스
CREATE SEQUENCE admin_notice_seq 
START WITH 1
INCREMENT BY 1;

-- 공지사항 첨부파일 테이블
CREATE TABLE notice_attach (
fullName VARCHAR2(150) NOT NULL,
notice_num NUMBER(5) NOT NULL,
down_cnt NUMBER(6) DEFAULT 0,
regdate DATE DEFAULT SYSDATE,
PRIMARY KEY(fullName)
);
-- 공지사항 테이블end ------------------------------

-- 문의사항 테이블------------------------------
CREATE TABLE admin_inquiry(
inquiry_num number(10) not null, --게시글 번호
inquiry_title varchar2(500) not null, --제목
inquiry_content varchar2(1000) not null, --내용
inquiry_writer varchar2(10) not null, -- 작성자
inquiry_reg date default sysdate, --등록일
primary key(inquiry_num) --게시글 번호 pk
);

--문의사항사항 시퀀스
CREATE SEQUENCE admin_inquiry_seq 
START WITH 1
INCREMENT BY 1;
-- 문의사항 테이블 end ------------------------------

--수업등록 테이블 ------------------------------   
CREATE TABLE class_group(
class_num NUMBER(30) NOT NULL,
class_name VARCHAR2(30) NOT NULL,
class_regist_title VARCHAR2(50) NOT NULL,
class_gisu VARCHAR2(50) NOT NULL,
class_period VARCHAR2(50) NOT NULL,
class_time VARCHAR2(100) NOT NULL,
class_student NUMBER(10) NOT NULL,
class_content VARCHAR2(1000),
class_total_people NUMBER(10),
class_female_num NUMBER(10),
class_male_num NUMBER(10),
class_regist_recruitment VARCHAR2(30) NOT NULL,
class_reg_date DATE DEFAULT SYSDATE,
class_upd_date DATE DEFAULT SYSDATE,
PRIMARY KEY (class_num)
);

create sequence class_group_seq 
start with 1
increment by 1;
--수업등록 테이블 end ------------------------------ 