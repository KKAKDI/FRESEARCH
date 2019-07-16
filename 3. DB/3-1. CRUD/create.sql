-- 회원
CREATE TABLE MEMBER (
	MB_EMAIL	    VARCHAR2(40)  NOT NULL,        -- 이메일
	MB_ATT_CTGR_CODE    VARCHAR2(20)  NOT NULL,        -- 관심카테고리코드
	MB_NICK		    VARCHAR2(24)  NOT NULL,	   -- 닉네임
	MB_PWD		    VARCHAR2(30)  NOT NULL,        -- 비밀번호
	MB_ADDR		    VARCHAR2(300) NULL,            -- 거주지
	MB_BIRTHDATE        NUMBER        NULL,            -- 생년월일
	MB_SEX              VARCHAR2(10)  NULL,            -- 성별
        MB_PHONE            NUMBER        NULL,            -- 전화번호
	MB_REG_ATRT	    VARCHAR2(10)  NULL,		   -- 등록권한
	MB_EMAIL_CONFIRM    VARCHAR2(10)  NULL,		   -- 이메일인증
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
	NEWS_ATTACH_FILE    VARCHAR2(50)     NULL,           -- 첨부파일
	NEWS_VIEWS	    NUMBER	     NULL,	     -- 조회수
	NEWS_REGDATE	    DATE	     NULL	     -- 등록일
);
ALTER TABLE NEWS ADD CONSTRAINT PK_NEWS PRIMARY KEY (NEWS_CODE);

-- 자유게시판
CREATE TABLE BOARD (
	BRD_CODE	  NUMBER	   NOT NULL,	    -- 게시판코드
	MB_EMAIL	  VARCHAR2(40)	   NOT NULL, -- 이메일
	MB_NICK		  VARCHAR2(24)     NOT NULL, -- 닉네임
	BRD_SUBJECT       VARCHAR2(240)    NULL,	    -- 제목
	BRD_CONTENT	  VARCHAR2(3000)   NULL,            -- 내용
	BRD_ATTACH_FILE   VARCHAR2(50)     NULL,            -- 첨부파일
	BRD_LIKE_CNT      NUMBER           NULL,	    -- 추천수
	BRD_DISLIKE_CNT   NUMBER           NULL,	    -- 비추천수
	BRD_REPORT_CNT    NUMBER           NULL,	    -- 신고횟수
	BRD_REGKEY        VARCHAR2(20)     NULL,            -- 등록키
	BRD_VIEWS         NUMBER           NULL,	    -- 조회수
	BRD_REGDATE       DATE             NULL		    -- 등록일
);
ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (BRD_CODE);

-- 댓글
CREATE TABLE REPLY (
	RPL_CODE	  NUMBER	  NOT NULL,	   -- 댓글코드
	BRD_CODE	  NUMBER	  NULL,		   -- 게시판코드
	MB_EMAIL	  VARCHAR2(40)    NOT NULL, -- 이메일
	MB_NICK		  VARCHAR2(24)    NOT NULL, -- 닉네임
	RPL_CONTENT	  VARCHAR2(1000)  NULL,		   -- 내용
	RPL_IMG		  VARCHAR2(50)    NULL,		   -- 이미지
	RPL_LIKE_CNT      NUMBER	  NULL,		   -- 추천수
	RPL_DISLIKE_CNT   NUMBER	  NULL,		   -- 비추천수
	RPL_REGDATE	  DATE            NULL		   -- 등록일
);
ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (RPL_CODE);
ALTER TABLE REPLY ADD CONSTRAINT FK_BOARD_TO_REPLY FOREIGN KEY (BRD_CODE) REFERENCES BOARD (BRD_CODE) ON DELETE CASCADE;


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