--ȸ�� ���̺�-------------------------------
CREATE TABLE member(
user_no NUMBER(5) NOT NULL, --ȸ����ȣ
user_level varchar2(20) not null, --ȸ�����
user_id VARCHAR2(50) NOT NULL, --ȸ�� ���̵�
user_pw VARCHAR2(100) NOT NULL, --ȸ�� ��й�ȣ
user_name VARCHAR2(100) NOT NULL, --ȸ�� �̸�
user_gender varchar2(5) not null, --ȸ�� ����
user_year number(4) not null, --ȸ�� ����
user_month number(2) not null, --ȸ�� ����
user_day number(2) not null, --ȸ�� ����
user_pnum1 number(3) not null, --ȸ�� �޴�����ȣ1
user_pnum2 number(4) not null, --ȸ�� �޴�����ȣ2
user_pnum3 number(4) not null, --ȸ�� �޴�����ȣ3
user_emailid varchar2(20) not null, --ȸ�� �̸��� ���̵�
user_emailsite varchar2(30) not null, --ȸ�� �̸��� ������
user_postcode number(5) not null, --ȸ�� �����ȣ
user_address1 varchar2(50) not null, --ȸ�� �ּ�1
user_address2 varchar2(50) not null, --ȸ�� �ּ�2
agree_ad varchar2(10) not null, --ȸ�� �����ǿ���
reg_date DATE DEFAULT SYSDATE, --ȸ�� ���Գ�¥
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

-- ȸ�� ���̺� end ------------------------------

--���� ���̺� ------------------------------
CREATE TABLE show(
show_num number(10) not null, --������ȣ_pk
show_name varchar2(50) not null, --������
show_place varchar2(50) not null, --�������
show_round number(10) not null, --����ȸ��
show_date varchar2(50) not null, --��������
show_cast varchar2(2000) not null, --�⿬��
show_num_of_cast number(2) not null, --�⿬�� ��
show_attachments varchar2(200), --���� ÷������ ��
show_runtime number(3) not null, --��Ÿ��
show_capacity number(3) not null, --���� ���� �ο� 
show_reservations number(3), --�� ���� �ο�
show_total_reservations number(3), --�� ���� �ο�
primary key(show_num) --������ȣ_pk����
);

--���� ������
CREATE SEQUENCE show_seq 
START WITH 1
INCREMENT BY 1;
-- ���� ���̺� end ------------------------------

-- ���� ���̺�------------------------------
create table apply(
apply_num number(10) not null, --������ȣ_pk
apply_gisu varchar2(5) not null, --���
apply_registration_date varchar2(50) not null, --������û ��¥
apply_refund_request_date varchar2(50) not null, --ȯ�ҽ�û ��¥
apply_attendance_status varchar2(50) not null, --���� ��Ȳ
apply_attachments varchar2(50) not null, --÷�����ϸ�
apply_stage_experience varchar2(5) not null, --�������
apply_about_s_e varchar2(100) null, --������� ����
apply_self_introduction varchar2(200) not null, --�ڱ�Ұ�
apply_user_no number(10) not null, --ȸ��_ȸ����ȣ
apply_user_name VARCHAR2(100) NOT NULL,--ȸ��_�̸�
apply_user_gender varchar2(5) not null,--ȸ��_����
apply_user_year number(4) not null,--ȸ��_������� �⵵
apply_user_month number(2) not null,--ȸ��_������� ��
apply_user_day number(2) not null,--ȸ��_������� ��
apply_user_pnum1 number(3) not null,--ȸ��_�ڵ��� ��ȣ 1
apply_user_pnum2 number(4) not null,--ȸ��_�ڵ��� ��ȣ 2
apply_user_pnum3 number(4) not null,--ȸ��_�ڵ��� ��ȣ 3
apply_user_emailid varchar2(20) not null,--ȸ��_�̸���
apply_user_emailsite varchar2(30) not null,--ȸ��_�̸���2
apply_user_postcode number(5) not null,--ȸ��_�ּ�(�����ȣ)
apply_user_address1 varchar2(50) not null,--ȸ��_�ּ�(���ּ�)1
apply_user_address2 varchar2(50) not null,--ȸ��_�ּ�(���ּ�)2
apply_class_num number(10) not null, --����_������ȣ
apply_class_name VARCHAR2(30) NOT NULL, --����_������
apply_class_period VARCHAR2(50) NOT NULL, --����_�����Ⱓ
apply_class_regist_recruitment VARCHAR2(30) NOT NULL, --����_������Ȳ
primary key(apply_num) --������ȣ_pk ����
);

-- ���� ������
create sequence apply_seq
start with 1
increment by 1;

-- ���� ���̺� end ------------------------------

-- �������� ���̺�------------------------------
CREATE TABLE admin_notice(
notice_num number(10) not null, --�Խñ� ��ȣ
notice_title varchar2(500) not null, --����
notice_content varchar2(1000) not null, --����
notice_writer varchar2(10) not null, -- �ۼ���
notice_reg date default sysdate, --�����
primary key(notice_num) --�Խñ� ��ȣ pk
);

--�������� ������
CREATE SEQUENCE admin_notice_seq 
START WITH 1
INCREMENT BY 1;

-- �������� ÷������ ���̺�
CREATE TABLE notice_attach (
fullName VARCHAR2(150) NOT NULL,
notice_num NUMBER(5) NOT NULL,
down_cnt NUMBER(6) DEFAULT 0,
regdate DATE DEFAULT SYSDATE,
PRIMARY KEY(fullName)
);
-- �������� ���̺�end ------------------------------

-- ���ǻ��� ���̺�------------------------------
CREATE TABLE admin_inquiry(
inquiry_num number(10) not null, --�Խñ� ��ȣ
inquiry_title varchar2(500) not null, --����
inquiry_content varchar2(1000) not null, --����
inquiry_writer varchar2(10) not null, -- �ۼ���
inquiry_reg date default sysdate, --�����
primary key(inquiry_num) --�Խñ� ��ȣ pk
);

--���ǻ��׻��� ������
CREATE SEQUENCE admin_inquiry_seq 
START WITH 1
INCREMENT BY 1;
-- ���ǻ��� ���̺� end ------------------------------

--������� ���̺� ------------------------------   
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
--������� ���̺� end ------------------------------ 