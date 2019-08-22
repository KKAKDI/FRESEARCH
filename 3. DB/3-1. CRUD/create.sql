-- 회원
CREATE TABLE MEMBER (
	MB_EMAIL	    VARCHAR2(40)  NOT NULL,        -- 이메일
	MB_ATT_CTGR_CODE    VARCHAR2(20)  NOT NULL,        -- 관심카테고리코드
	MB_NICK		    VARCHAR2(24)  NOT NULL,	   -- 닉네임
	MB_PWD		    VARCHAR2(300)  NOT NULL,        -- 비밀번호
	MB_ADDR		    VARCHAR2(300) NULL,            -- 거주지
	MB_BIRTHDATE        NUMBER        NULL,            -- 생년월일
	MB_SEX              VARCHAR2(10)  NULL,            -- 성별
        MB_PHONE            VARCHAR2(20)  NULL,            -- 전화번호
	MB_REG_ATRT	    VARCHAR2(10)  NULL,		   -- 등록권한
	MB_EMAIL_KEY	    VARCHAR2(30)  NULL,		   -- 이메일인증키
	MB_JOINDATE         DATE          NULL		   -- 가입일
);
ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (MB_EMAIL, MB_ATT_CTGR_CODE);

-- 카테고리
CREATE TABLE CATEGORY (
	CTGR_CODE	VARCHAR2(20)    NOT NULL,         -- 카테고리코드
	CTGR_NM         VARCHAR2(30)	NULL,             -- 카테고리명
	CTGR_REGDATE    DATE		NULL		  -- 등록일
);
ALTER TABLE CATEGORY ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (CTGR_CODE);

-- 관심카테고리
CREATE TABLE ATT_CATEGORY (
    MB_ATT_CTGR_CODE	VARCHAR2(10)	NOT NULL,    -- 관심카테고리코드
    MB_EMAIL		VARCHAR2(40)    NULL,        -- 이메일
    CTGR_CODE1		VARCHAR2(20)    NULL,        -- 카테고리코드1
    CTGR_CODE2		VARCHAR2(20)    NULL,        -- 카테고리코드2
    CTGR_CODE3		VARCHAR2(20)    NULL,        -- 카테고리코드3
    CTGR_CODE4		VARCHAR2(20)    NULL,        -- 카테고리코드4
    CTGR_CODE5		VARCHAR2(20)	NULL,        -- 카테고리코드5
    MB_MARRIAGE_YN	VARCHAR2(10)    NULL,        -- 결혼유무
    MB_CHILD_YN		VARCHAR2(10)    NULL,        -- 자녀유무
    MB_HOME_YN		VARCHAR2(10)	NULL,        -- 자가유무
    MB_CAR_YN		VARCHAR2(10)	NULL         -- 자차유무
    
);
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT PK_ATT_CATEGORY PRIMARY KEY (MB_ATT_CTGR_CODE);
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_MEMBER_TO_ATT_CATEGORY FOREIGN KEY (MB_ATT_CTGR_CODE, MB_EMAIL) REFERENCES MEMBER (MB_ATT_CTGR_CODE, MB_EMAIL) ON DELETE CASCADE;
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_CATEGORY_TO_ATT_CATEGORY1 FOREIGN KEY (CTGR_CODE1) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_CATEGORY_TO_ATT_CATEGORY2 FOREIGN KEY (CTGR_CODE2) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_CATEGORY_TO_ATT_CATEGORY3 FOREIGN KEY (CTGR_CODE3) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_CATEGORY_TO_ATT_CATEGORY4 FOREIGN KEY (CTGR_CODE4) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;
ALTER TABLE ATT_CATEGORY ADD CONSTRAINT FK_CATEGORY_TO_ATT_CATEGORY5 FOREIGN KEY (CTGR_CODE5) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;

-- 주제
CREATE TABLE SUBJECT (
	SUBJ_CODE	VARCHAR2(20)	NOT NULL,	 -- 주제코드
	CTGR_CODE	VARCHAR2(20)	NULL,		 -- 카테고리코드
	MB_EMAIL	VARCHAR2(40)	NOT NULL,	 -- 이메일
	MB_NICK		VARCHAR2(24)	NOT NULL,	 -- 닉네임
	SUBJ_NM		VARCHAR2(240)   NULL,		 -- 주제명
	SUBJ_REGDATE	DATE		NULL,		 -- 등록일
	SUBJ_STARTDATE  DATE		NULL,		 -- 시작일
	SUBJ_ENDDATE	DATE		NULL		 -- 종료일
);
ALTER TABLE SUBJECT ADD CONSTRAINT PK_SUBJECT PRIMARY KEY (SUBJ_CODE);
ALTER TABLE SUBJECT ADD CONSTRAINT FK_CATEGORY_TO_SUBJECT FOREIGN KEY (CTGR_CODE) REFERENCES CATEGORY (CTGR_CODE) ON DELETE CASCADE;

-- 질문
CREATE TABLE QUESTION (
	QST_CODE	VARCHAR2(20)    NOT NULL,	-- 질문코드
	SUBJ_CODE	VARCHAR2(20)	NULL,		-- 주제코드
	QST_CONTENT	VARCHAR2(1000)	NULL,		-- 질문내용
	QST_TYPE	VARCHAR2(20)	NULL,		-- 질문유형
	QST_IMG		VARCHAR2(50)	NULL,		-- 이미지
	QST_URL		VARCHAR2(50)	NULL,		-- URL
	QST_REGDATE	DATE		NULL		-- 등록일
);
ALTER TABLE QUESTION ADD CONSTRAINT PK_QUESTION PRIMARY KEY (QST_CODE);
ALTER TABLE QUESTION ADD CONSTRAINT FK_SUBJECT_TO_QUESTION FOREIGN KEY (SUBJ_CODE) REFERENCES SUBJECT (SUBJ_CODE) ON DELETE CASCADE;

-- 아이템
CREATE TABLE ITEM (
	ITEM_CODE	VARCHAR2(20)	NOT NULL,	-- 아이템코드
	QST_CODE	VARCHAR2(20)	NULL,		-- 질문코드
	ITEM_CONTENT    VARCHAR2(1000)  NULL,		-- 아이템내용
        ITEM_IMG	VARCHAR2(50)	NULL,		-- 이미지
	ITEM_REGDATE	DATE		NULL		-- 등록일
);
ALTER TABLE ITEM ADD CONSTRAINT PK_ITEM PRIMARY KEY (ITEM_CODE);
ALTER TABLE ITEM ADD CONSTRAINT FK_QUESTION_TO_ITEM FOREIGN KEY (QST_CODE) REFERENCES QUESTION (QST_CODE) ON DELETE CASCADE;

-- 답변
CREATE TABLE ANSWER (
	ASW_CODE	VARCHAR2(20)	NOT NULL,	 -- 답변코드
	ITEM_CODE	VARCHAR2(20)	NULL,		 -- 아이템코드
        MB_EMAIL	VARCHAR2(40)	NOT NULL, -- 이메일
	MB_NICK		VARCHAR2(24)	NOT NULL, -- 닉네임
	ASW_CONTENT	VARCHAR2(1000)	NULL,		 -- 답변내용
	ASW_REGDATE	DATE		NULL		 -- 등록일
);
ALTER TABLE ANSWER ADD CONSTRAINT PK_ANSWER PRIMARY KEY (ASW_CODE);
ALTER TABLE ANSWER ADD CONSTRAINT FK_ITEM_TO_ANSWER FOREIGN KEY (ITEM_CODE) REFERENCES ITEM (ITEM_CODE) ON DELETE CASCADE;

-- 알림
CREATE TABLE NOTICE (
	NTC_CODE	    VARCHAR2(20)    NOT NULL, -- 알림코드
	MB_EMAIL	    VARCHAR2(40)    NULL,     -- 이메일
	MB_ATT_CTGR_CODE    VARCHAR2(20)    NULL,     -- 관심카테고리코드
	NTC_MSG		    VARCHAR2(100)   NULL,     -- 알림메시지
	NTC_SENDDATE	    DATE	    NULL,     -- 발신일
	NTC_READDATE	    DATE	    NULL,     -- 열람일
	NTC_READ_YN	    DATE	    NULL      -- 열람여부
);
ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (NTC_CODE);
ALTER TABLE NOTICE ADD CONSTRAINT FK_MEMBER_TO_NOTICE FOREIGN KEY (MB_EMAIL, MB_ATT_CTGR_CODE) REFERENCES MEMBER (MB_EMAIL, MB_ATT_CTGR_CODE) ON DELETE CASCADE;

-- 새소식
CREATE TABLE NEWS (
	NEWS_CODE           NUMBER	     NOT NULL,       -- 새소식코드
	NEWS_DIVISION	    VARCHAR2(20)     NULL,	     -- 구분
	NEWS_SUBJECT        VARCHAR2(240)    NULL,	     -- 제목
	NEWS_CONTENT        VARCHAR2(3000)   NULL,           -- 내용
	NEWS_VIEWS	    NUMBER	     DEFAULT 0,	     -- 조회수
	NEWS_REGDATE	    DATE	     NULL,	     -- 등록일
    NEWS_IS_ATTACH  VARCHAR2(1) NOT NULL        -- 파일첨부 여부
);
ALTER TABLE NEWS ADD CONSTRAINT PK_NEWS PRIMARY KEY (NEWS_CODE);

-- 새소식 첨부파일
CREATE TABLE NEWS_ATTACH (
    NEWS_ATTACH_UUID	    VARCHAR2(100)    NOT NULL,	     -- 첨부파일 UUID
    NEWS_ATTACH_PATH      VARCHAR2(200)    NOT NULL,	     -- 첨부파일 경로
    NEWS_ATTACH_NAME      VARCHAR2(100)    NOT NULL,       -- 첨부파일 이름
	NEWS_ATTACH_TYPE      CHAR(1)     DEFAULT 'I',    -- 이미지파일 여부
    NEWS_CODE           NUMBER	     NOT NULL       -- 새소식코드
);
ALTER TABLE NEWS_ATTACH ADD CONSTRAINT PK_NEWS_ATTACH PRIMARY KEY (NEWS_ATTACH_UUID);
ALTER TABLE NEWS_ATTACH ADD CONSTRAINT FK_NEWS_ATTACH FOREIGN KEY (NEWS_CODE) REFERENCES NEWS(NEWS_CODE);

-- 자유게시판
CREATE TABLE BOARD (
	BRD_CODE	  NUMBER	   NOT NULL,	    -- 게시판코드
	MB_EMAIL	  VARCHAR2(40)	   NOT NULL, -- 이메일
	MB_NICK		  VARCHAR2(200)     NOT NULL, -- 닉네임
	BRD_SUBJECT       VARCHAR2(240)    NULL,	    -- 제목
	BRD_CONTENT	  VARCHAR2(3000)   NULL,            -- 내용
	BRD_LIKE_CNT      NUMBER           DEFAULT 0,	    -- 추천수
	BRD_DISLIKE_CNT   NUMBER           DEFAULT 0,	    -- 비추천수
	BRD_REPORT_CNT    NUMBER           DEFAULT 0,	    -- 신고횟수
	BRD_REGKEY        VARCHAR2(20)     NULL,            -- 등록키
	BRD_VIEWS         NUMBER           DEFAULT 0,	    -- 조회수
	BRD_REGDATE       DATE             NULL		    -- 등록일
);
ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (BRD_CODE);

--자유게시판 첨부파일
CREATE TABLE BRD_ATTACH (
    BRD_ATTACH_UUID	    VARCHAR2(100)    NOT NULL,	     -- 첨부파일 UUID
    BRD_ATTACH_PATH      VARCHAR2(200)    NOT NULL,	     -- 첨부파일 경로
    BRD_ATTACH_NAME      VARCHAR2(100)    NOT NULL,       -- 첨부파일 이름
    BRD_ATTACH_TYPE      CHAR(1)     DEFAULT 'I',    -- 이미지파일 여부
    BRD_CODE           NUMBER	     NOT NULL       -- 새소식코드
);
ALTER TABLE BRD_ATTACH ADD CONSTRAINT PK_BRD_ATTACH PRIMARY KEY (BRD_ATTACH_UUID);
ALTER TABLE BRD_ATTACH ADD CONSTRAINT FK_BRD_ATTACH FOREIGN KEY (BRD_CODE) REFERENCES BOARD(BRD_CODE);

-- 댓글
CREATE TABLE REPLY (
	RPL_CODE	  NUMBER	  NOT NULL,	   -- 댓글코드
	BRD_CODE	  NUMBER	  NULL,		   -- 게시판코드
	MB_EMAIL	  VARCHAR2(40)    NOT NULL, -- 이메일
	MB_NICK		  VARCHAR2(24)    NOT NULL, -- 닉네임
	RPL_CONTENT	  VARCHAR2(1000)  NULL,		   -- 내용
	RPL_REGDATE	  DATE            NULL		   -- 등록일
);
ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (RPL_CODE);
ALTER TABLE REPLY ADD CONSTRAINT FK_BOARD_TO_REPLY FOREIGN KEY (BRD_CODE) REFERENCES BOARD (BRD_CODE) ON DELETE CASCADE;

-- 신청 승인
CREATE TABLE APPLY (
	APPLY_CODE	  NUMBER	  NOT NULL,	   -- 신청코드
	MB_EMAIL	    VARCHAR2(40)  NOT NULL,        -- 이메일
	MB_ATT_CTGR_CODE    VARCHAR2(20)  NOT NULL,        -- 관심카테고리코드
	APPLY_APPLYDATE     DATE          NOT NULL,		   -- 신청일
	APPLY_APPROVALDATE  DATE          NULL		   -- 승인일
);

ALTER TABLE APPLY ADD CONSTRAINT PK_APPLY PRIMARY KEY (APPLY_CODE);
ALTER TABLE APPLY ADD CONSTRAINT FK_APPLY_EMAIL FOREIGN KEY (MB_ATT_CTGR_CODE, MB_EMAIL) REFERENCES MEMBER(MB_ATT_CTGR_CODE, MB_EMAIL);

-- 회원 권한
create table member_auth (
    mb_email varchar2(40) not null,
    mb_att_ctgr_code varchar2(20) not null,
    auth varchar2(50) not null,
    constraint fk_member_auth foreign key(mb_email, mb_att_ctgr_code) references member(mb_email, mb_att_ctgr_code)
);

-- 로그인 상태 유지
create table persistent_logins (
    mb_email varchar2(40) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null,
    last_used timestamp not null
);


--통계 AREA 관련 VIEW 1
CREATE OR REPLACE VIEW AREA AS
SELECT C.CTGR_CODE, C.CTGR_NM, B.MB_NICK, B.MB_ADDR, B.MB_BIRTHDATE, B.MB_SEX, MB_MARRIAGE_YN
FROM SUBJECT A, MEMBER B, CATEGORY C, ATT_CATEGORY D WHERE A.MB_NICK = B.MB_NICK AND C.CTGR_CODE = A.CTGR_CODE AND B.MB_EMAIL = D.MB_EMAIL;


--통계 AREA 관련 VIEW 2
create or replace view stats_table 
AS
SELECT DISTINCT
       (SELECT Count(*)
        FROM   (SELECT *
                FROM   answer)
        WHERE  item_code = e.item_code) AS answer_number,
       b.subj_regdate,
       f.ctgr_nm,
       b.subj_code,
       a.mb_nick,
       a.mb_sex,
       a.mb_birthdate,
       a.mb_addr,
       c.qst_img,
       b.subj_nm,
       b.subj_startdate,
       b.subj_enddate
FROM   member a,
       subject b,
       question c,
       item d,
       answer e,
       category f
WHERE  b.mb_email = a.mb_email
       AND b.subj_code = c.subj_code
       AND c.qst_code = d.qst_code
       AND d.item_code = e.item_code
       AND f.ctgr_code = b.ctgr_code
       
group by b.subj_nm, b.subj_regdate, f.ctgr_nm, a.mb_nick, c.qst_img, b.subj_startdate, b.subj_enddate, e.item_code, a.mb_birthdate, a.mb_addr, a.mb_sex, b.subj_code
order by b.subj_regdate desc;


--설문 목록 관련 VIEW
create or replace view v_research
AS
select ctgr_nm, subj_code, subj_nm, subj_regdate, subj_startdate, subj_enddate 
from category a, subject b
where a.ctgr_code = b.ctgr_code
group by rownum, ctgr_nm, subj_code, subj_nm, subj_regdate, subj_startdate, subj_enddate
order by subj_regdate desc;


CREATE SEQUENCE NEWS_SEQ
INCREMENT BY 1
START WITH 1
nocache;



CREATE SEQUENCE BOARD_SEQ
INCREMENT BY 1
START WITH 1
nocache;

CREATE SEQUENCE REPLY_SEQ
INCREMENT BY 1
START WITH 1
nocache;