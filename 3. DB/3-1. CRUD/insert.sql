-- 회원
insert into MEMBER values('aaa@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), '최운학', 'pw01', '부천', 19890101, '남', 01011111111, '패널', '미혼', '무', '무', '유', SYSDATE);
insert into MEMBER values('bbb@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw02', '서울', 19900202, '남', 01022222222, '패널', '기혼', '유', '유', '유', SYSDATE);
insert into MEMBER values('ccc@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw03', '인천', 19890303, '남', 01033333333, '일반', '미혼', '무', '유', '유', SYSDATE);
insert into MEMBER values('ddd@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw04', '성남', 19890404, '남', 01044444444, '일반', '미혼', '무', '무', '무', SYSDATE);
insert into MEMBER values('eee@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw05', '대구', 19910505, '여', 01055555555, '패널', '기혼', '유', '유', '유', SYSDATE);
insert into MEMBER values('fff@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw06', '부산', 19920606, '남', 01077777777, '일반', '기혼', '유', '유', '무', SYSDATE);
insert into MEMBER values('ggg@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw07', '대전', 19910707, '남', 01088888888, '일반', '기혼', '유', '무', '유', SYSDATE);
insert into MEMBER values('hhh@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw08', '전주', 19960808, '남', 01099999999, '패널', '미혼', '무', '무', '유', SYSDATE);
insert into MEMBER values('iii@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw09', '제주', 19930909, '여', 01012345678, '패널', '미혼', '무', '유', '유', SYSDATE);
insert into MEMBER values('jjj@google.com', 'A'||LPAD(ATT_CATEGORY_SEQ.nextval, 3, 0), 'pw10', '경주', 19901010, '남', 01098765432, '일반', '기혼', '유', '유', '유', SYSDATE);

-- 카테고리
insert into CATEGORY values('B001', '교육, 학문', SYSDATE);
insert into CATEGORY values('B002', '컴퓨터 통신', SYSDATE);
insert into CATEGORY values('B003', '게임', SYSDATE);
insert into CATEGORY values('B004', '엔터테인먼트, 예술', SYSDATE);
insert into CATEGORY values('B005', '생활', SYSDATE);
insert into CATEGORY values('B006', '건강', SYSDATE);
insert into CATEGORY values('B007', '사회, 정치', SYSDATE);
insert into CATEGORY values('B008', '경제', SYSDATE);
insert into CATEGORY values('B009', '여행', SYSDATE);
insert into CATEGORY values('B010', '스포츠, 레저', SYSDATE);
insert into CATEGORY values('B011', '쇼핑', SYSDATE);
insert into CATEGORY values('B012', '지역', SYSDATE);
insert into CATEGORY values('B013', '결혼', SYSDATE);

-- 관심카테고리
insert into ATT_CATEGORY values('A001', 'aaa@google.com', 'B001', 'B002', 'B003', 'B004', 'B005', '미혼', '무', '무', '유');
insert into ATT_CATEGORY values('A002', 'bbb@google.com', 'B006', 'B007', 'B008', 'B009', 'B010', '기혼', '유', '유', '유');
insert into ATT_CATEGORY values('A003', 'ccc@google.com', 'B011', 'B012', 'B013', 'B001', 'B002', '미혼', '무', '유', '유');
insert into ATT_CATEGORY values('A004', 'ddd@google.com', 'B003', 'B004', 'B005', 'B006', 'B007', '미혼', '무', '무', '무');
insert into ATT_CATEGORY values('A005', 'eee@google.com', 'B008', 'B009', 'B010', 'B011', 'B012', '기혼', '유', '유', '유');
insert into ATT_CATEGORY values('A006', 'fff@google.com', 'B013', 'B001', 'B002', 'B003', 'B004', '기혼', '유', '유', '무');
insert into ATT_CATEGORY values('A007', 'ggg@google.com', 'B005', 'B006', 'B007', 'B008', 'B009', '기혼', '유', '무', '유');
insert into ATT_CATEGORY values('A008', 'hhh@google.com', 'B010', 'B011', 'B012', 'B013', 'B001', '미혼', '무', '무', '유');
insert into ATT_CATEGORY values('A009', 'iii@google.com', 'B002', 'B003', 'B004', 'B005', 'B006', '미혼', '무', '유', '유');
insert into ATT_CATEGORY values('A010', 'jjj@google.com', 'B007', 'B008', 'B009', 'B010', 'B011', '기혼', '유', '유', '유');

-- 주제
insert into SUBJECT values('C001', 'B001', 'B002', 'B003', 'aaa@google.com', '최운학', '주제1', SYSDATE);
insert into SUBJECT values('C002', 'B006', 'B007', 'B008', 'bbb@google.com', '곽지훈', '주제2', SYSDATE);
insert into SUBJECT values('C003', 'B011', 'B012', 'B013', 'ccc@google.com', '변정우', '주제3', SYSDATE);
insert into SUBJECT values('C004', 'B003', 'B004', 'B005', 'ddd@google.com', '이재하', '주제4', SYSDATE);
insert into SUBJECT values('C005', 'B008', 'B009', 'B010', 'eee@google.com', '조성식', '주제5', SYSDATE);
insert into SUBJECT values('C006', 'B013', 'B001', 'B002', 'fff@google.com', '박동진', '주제6', SYSDATE);
insert into SUBJECT values('C007', 'B005', 'B006', 'B007', 'ggg@google.com', '손현준', '주제7', SYSDATE);
insert into SUBJECT values('C008', 'B010', 'B011', 'B012', 'hhh@google.com', '박상우', '주제8', SYSDATE);
insert into SUBJECT values('C009', 'B002', 'B003', 'B004', 'iii@google.com', '최정인', '주제9', SYSDATE);
insert into SUBJECT values('C010', 'B007', 'B008', 'B009', 'jjj@google.com', '최영훈', '주제10', SYSDATE);

-- 질문
insert into QUESTION values('D001', 'C001', '질문1', '객관식', null, null, SYSDATE);
insert into QUESTION values('D002', 'C002', '질문2', '주관식', null, null, SYSDATE);
insert into QUESTION values('D003', 'C003', '질문3', '객관식', null, null, SYSDATE);
insert into QUESTION values('D004', 'C004', '질문4', '객관식', null, null, SYSDATE);
insert into QUESTION values('D005', 'C005', '질문5', '주관식', null, null, SYSDATE);
insert into QUESTION values('D006', 'C006', '질문6', '객관식', null, null, SYSDATE);
insert into QUESTION values('D007', 'C007', '질문7', '주관식', null, null, SYSDATE);
insert into QUESTION values('D008', 'C008', '질문8', '주관식', null, null, SYSDATE);
insert into QUESTION values('D009', 'C009', '질문9', '객관식', null, null, SYSDATE);
insert into QUESTION values('D010', 'C010', '질문10', '주관식', null, null, SYSDATE);

-- 아이템
insert into ITEM values('E001', 'D001', '아이템내용1', null, SYSDATE);
insert into ITEM values('E002', 'D002', '아이템내용2', null, SYSDATE);
insert into ITEM values('E003', 'D003', '아이템내용3', null, SYSDATE);
insert into ITEM values('E004', 'D004', '아이템내용4', null, SYSDATE);
insert into ITEM values('E005', 'D005', '아이템내용5', null, SYSDATE);
insert into ITEM values('E006', 'D006', '아이템내용6', null, SYSDATE);
insert into ITEM values('E007', 'D007', '아이템내용7', null, SYSDATE);
insert into ITEM values('E008', 'D008', '아이템내용8', null, SYSDATE);
insert into ITEM values('E009', 'D009', '아이템내용9', null, SYSDATE);
insert into ITEM values('E010', 'D010', '아이템내용10', null, SYSDATE);

-- 답변
insert into ANSWER values('F001', 'E001', 'aaa@google.com', '최운학', '답변내용1', SYSDATE);
insert into ANSWER values('F002', 'E002', 'bbb@google.com', '곽지훈', '답변내용2', SYSDATE);
insert into ANSWER values('F003', 'E003', 'ccc@google.com', '변정우', '답변내용3', SYSDATE);
insert into ANSWER values('F004', 'E004', 'ddd@google.com', '이재하', '답변내용4', SYSDATE);
insert into ANSWER values('F005', 'E005', 'eee@google.com', '조성식', '답변내용5', SYSDATE);
insert into ANSWER values('F006', 'E006', 'fff@google.com', '박동진', '답변내용6', SYSDATE);
insert into ANSWER values('F007', 'E007', 'ggg@google.com', '손현준', '답변내용7', SYSDATE);
insert into ANSWER values('F008', 'E008', 'hhh@google.com', '박상우', '답변내용8', SYSDATE);
insert into ANSWER values('F009', 'E009', 'iii@google.com', '최정인', '답변내용9', SYSDATE);
insert into ANSWER values('F010', 'E010', 'jjj@google.com', '최영훈', '답변내용10', SYSDATE);

-- 알림
insert into NOTICE values('G001', 'aaa@google.com', 'A001', '알림메시지1');
insert into NOTICE values('G002', 'bbb@google.com', 'A002', '알림메시지2');
insert into NOTICE values('G003', 'ccc@google.com', 'A003', '알림메시지3');
insert into NOTICE values('G004', 'ddd@google.com', 'A004', '알림메시지4');
insert into NOTICE values('G005', 'eee@google.com', 'A005', '알림메시지5');
insert into NOTICE values('G006', 'fff@google.com', 'A006', '알림메시지6');
insert into NOTICE values('G007', 'ggg@google.com', 'A007', '알림메시지7');
insert into NOTICE values('G008', 'hhh@google.com', 'A008', '알림메시지8');
insert into NOTICE values('G009', 'iii@google.com', 'A009', '알림메시지9');
insert into NOTICE values('G010', 'jjj@google.com', 'A010', '알림메시지10');

-- 새소식
insert into NEWS values('H001', '새소식제목1', '새소식내용1', null, 0, SYSDATE);
insert into NEWS values('H002', '새소식제목2', '새소식내용2', null, 0, SYSDATE);
insert into NEWS values('H003', '새소식제목3', '새소식내용3', null, 0, SYSDATE);
insert into NEWS values('H004', '새소식제목4', '새소식내용4', null, 0, SYSDATE);
insert into NEWS values('H005', '새소식제목5', '새소식내용5', null, 0, SYSDATE);
insert into NEWS values('H006', '새소식제목6', '새소식내용6', null, 0, SYSDATE);
insert into NEWS values('H007', '새소식제목7', '새소식내용7', null, 0, SYSDATE);
insert into NEWS values('H008', '새소식제목8', '새소식내용8', null, 0, SYSDATE);
insert into NEWS values('H009', '새소식제목9', '새소식내용9', null, 0, SYSDATE);
insert into NEWS values('H010', '새소식제목10', '새소식내용10', null, 0, SYSDATE);

-- 자유게시판
insert into BOARD values('I001', 'aaa@google.com', '최운학', '자게제목1', '자게내용1', null, 0, 0, 0, 'A0BCDE', 0, SYSDATE);
insert into BOARD values('I002', 'bbb@google.com', '곽지훈', '자게제목2', '자게내용2', null, 0, 0, 0, 'B1CDEF', 0, SYSDATE);
insert into BOARD values('I003', 'ccc@google.com', '변정우', '자게제목3', '자게내용3', null, 0, 0, 0, 'C2DEFG', 0, SYSDATE);
insert into BOARD values('I004', 'ddd@google.com', '이재하', '자게제목4', '자게내용4', null, 0, 0, 0, 'D3EFGH', 0, SYSDATE);
insert into BOARD values('I005', 'eee@google.com', '조성식', '자게제목5', '자게내용5', null, 0, 0, 0, 'E4FGHI', 0, SYSDATE);
insert into BOARD values('I006', 'fff@google.com', '박동진', '자게제목6', '자게내용6', null, 0, 0, 0, 'F5GHIJ', 0, SYSDATE);
insert into BOARD values('I007', 'ggg@google.com', '손현준', '자게제목7', '자게내용7', null, 0, 0, 0, 'G6HIJK', 0, SYSDATE);
insert into BOARD values('I008', 'hhh@google.com', '박상우', '자게제목8', '자게내용8', null, 0, 0, 0, 'H7IJKL', 0, SYSDATE);
insert into BOARD values('I009', 'iii@google.com', '최정인', '자게제목9', '자게내용9', null, 0, 0, 0, 'I8JKLM', 0, SYSDATE);
insert into BOARD values('I010', 'jjj@google.com', '최영훈', '자게제목10', '자게내용10', null, 0, 0, 0, 'J9KLMN', 0, SYSDATE);

-- 댓글
insert into REPLY values('J001', 'I001', 'aaa@google.com', '최운학', '댓글내용1', null, 0, 0, SYSDATE);
insert into REPLY values('J002', 'I002', 'bbb@google.com', '곽지훈', '댓글내용2', null, 0, 0, SYSDATE);
insert into REPLY values('J003', 'I003', 'ccc@google.com', '변정우', '댓글내용3', null, 0, 0, SYSDATE);
insert into REPLY values('J004', 'I004', 'ddd@google.com', '이재하', '댓글내용4', null, 0, 0, SYSDATE);
insert into REPLY values('J005', 'I005', 'eee@google.com', '조성식', '댓글내용5', null, 0, 0, SYSDATE);
insert into REPLY values('J006', 'I006', 'fff@google.com', '박동진', '댓글내용6', null, 0, 0, SYSDATE);
insert into REPLY values('J007', 'I007', 'ggg@google.com', '손현준', '댓글내용7', null, 0, 0, SYSDATE);
insert into REPLY values('J008', 'I008', 'hhh@google.com', '박상우', '댓글내용8', null, 0, 0, SYSDATE);
insert into REPLY values('J009', 'I009', 'iii@google.com', '최정인', '댓글내용9', null, 0, 0, SYSDATE);
insert into REPLY values('J010', 'I010', 'jjj@google.com', '최영훈', '댓글내용10', null, 0, 0, SYSDATE);


commit;