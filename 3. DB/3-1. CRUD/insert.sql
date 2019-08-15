-- 회원
insert into MEMBER values('aaa@google.com', 'A0000001', '최운학', 'pw01', '서울특별시 강서구 화곡동', 19890101, '남', '01011111111', '패널', 'Y', SYSDATE);
insert into MEMBER values('bbb@google.com', 'A0000002', '곽지훈', 'pw02', '서울특별시 강서구 까치산로12길 7', 19900202, '남', '01022222222', '패널', 'Y', SYSDATE);
insert into MEMBER values('ccc@google.com', 'A0000003', '변정우', 'pw03', '경기도 양평군 양평읍 군청앞길 2 양평군청 본관', 19890303, '남', '01033333333', '일반', 'N', SYSDATE);
insert into MEMBER values('ddd@google.com', 'A0000004', '이재하', 'pw04', '경기도 양평군 양평읍 군청앞길 2 양평군청 본관', 19890404, '남', '01044444444', '일반', 'N', SYSDATE);
insert into MEMBER values('eee@google.com', 'A0000005', '조성식', 'pw05', '경기도 양평군 양평읍 군청앞길 2 양평군청 본관', 19910505, '여', '01055555555', '패널', 'Y', SYSDATE);
insert into MEMBER values('fff@google.com', 'A0000006', '박동진', 'pw06', '부산광역시 부산진구 새싹로 295', 19920606, '남', '01077777777', '일반', 'N', SYSDATE);
insert into MEMBER values('ggg@google.com', 'A0000007', '손현준', 'pw07', '인천광역시 남동구 정각로 29 인천광역시청', 19910707, '남', '01088888888', '일반', 'N', SYSDATE);
insert into MEMBER values('hhh@google.com', 'A0000008', '박상우', 'pw08', '인천광역시 남동구 정각로 29 인천광역시청', 19960808, '남', '01099999999', '패널', 'Y', SYSDATE);
insert into MEMBER values('iii@google.com', 'A0000009', '최정인', 'pw09', '인천광역시 남동구 정각로 29 인천광역시청', 19930909, '여', '01012345678', '패널', 'Y', SYSDATE);
insert into MEMBER values('jjj@google.com', 'A0000010', '최영훈', 'pw10', '인천광역시 남동구 정각로 29 인천광역시청', 19901010, '남', '01098765432', '일반', 'N', SYSDATE);
insert into MEMBER values('admin@fresearch.com', 'A0000011', 'admin', 'pw11', '서울특별시 강서구 화곡동', 19890101, '남', '01011111111', '관리자', 'Y', SYSDATE);

-- 카테고리
insert into CATEGORY values('A0000001', '교육, 학문', SYSDATE);
insert into CATEGORY values('B0000001', '컴퓨터 통신', SYSDATE);
insert into CATEGORY values('C0000001', '게임', SYSDATE);
insert into CATEGORY values('D0000001', '엔터테인먼트, 예술', SYSDATE);
insert into CATEGORY values('E0000001', '생활', SYSDATE);
insert into CATEGORY values('F0000001', '건강', SYSDATE);
insert into CATEGORY values('G0000001', '사회, 정치', SYSDATE);
insert into CATEGORY values('H0000001', '경제', SYSDATE);
insert into CATEGORY values('I0000001', '여행', SYSDATE);
insert into CATEGORY values('J0000001', '스포츠, 레저', SYSDATE);
insert into CATEGORY values('K0000001', '쇼핑', SYSDATE);
insert into CATEGORY values('L0000001', '지역', SYSDATE);
insert into CATEGORY values('M0000001', '결혼', SYSDATE);

-- 관심카테고리
insert into ATT_CATEGORY values('A0000001', 'aaa@google.com', 'A0000001', 'B0000001', 'C0000001', 'D0000001', 'E0000001', '미혼', '무', '무', '유');
insert into ATT_CATEGORY values('A0000002', 'bbb@google.com', 'F0000001', 'G0000001', 'H0000001', 'I0000001', 'J0000001', '기혼', '유', '유', '유');
insert into ATT_CATEGORY values('A0000003', 'ccc@google.com', 'K0000001', 'L0000001', 'M0000001', 'A0000001', 'B0000001', '미혼', '무', '유', '유');
insert into ATT_CATEGORY values('A0000004', 'ddd@google.com', 'C0000001', 'D0000001', 'E0000001', 'F0000001', 'G0000001', '미혼', '무', '무', '무');
insert into ATT_CATEGORY values('A0000005', 'eee@google.com', 'H0000001', 'I0000001', 'J0000001', 'K0000001', 'L0000001', '기혼', '유', '유', '유');
insert into ATT_CATEGORY values('A0000006', 'fff@google.com', 'M0000001', 'A0000001', 'B0000001', 'C0000001', 'D0000001', '기혼', '유', '유', '무');
insert into ATT_CATEGORY values('A0000007', 'ggg@google.com', 'E0000001', 'F0000001', 'G0000001', 'H0000001', 'I0000001', '기혼', '유', '무', '유');
insert into ATT_CATEGORY values('A0000008', 'hhh@google.com', 'J0000001', 'K0000001', 'L0000001', 'M0000001', 'A0000001', '미혼', '무', '무', '유');
insert into ATT_CATEGORY values('A0000009', 'iii@google.com', 'B0000001', 'C0000001', 'D0000001', 'E0000001', 'F0000001', '미혼', '무', '유', '유');
insert into ATT_CATEGORY values('A0000010', 'jjj@google.com', 'G0000001', 'H0000001', 'I0000001', 'J0000001', 'K0000001', '기혼', '유', '유', '유');

-- 주제
insert into SUBJECT values('C0000001', 'A0000001', 'aaa@google.com', '최운학', '당신이 교육, 학문 카테고리에서 가장 좋아하는 설문 주제는?', '19/05/20', '19/06/01', '19/06/20');
insert into SUBJECT values('C0000002', 'B0000001', 'bbb@google.com', '곽지훈', '당신이 컴퓨터 통신 카테고리에서 가장 좋아하는 설문 주제는?', '19/05/21', '19/06/02', '19/06/21');
insert into SUBJECT values('C0000003', 'C0000001', 'ccc@google.com', '변정우', '당신이 게임 카테고리에서 가장 좋아하는 설문 주제는?', '19/05/22', '19/06/03', '19/06/22');
insert into SUBJECT values('C0000004', 'D0000001', 'ddd@google.com', '이재하', '당신이 엔터테인먼트, 예술 카테고리에서 가장 좋아하는 설문 주제는?', '19/05/23', '19/06/04', '19/06/23');
insert into SUBJECT values('C0000005', 'E0000001', 'eee@google.com', '조성식', '당신이 생활 카테고리에서 가장 좋아하는 설문 주제는?', '19/05/24', '19/06/05', '19/06/24');
insert into SUBJECT values('C0000006', 'F0000001', 'fff@google.com', '박동진', '당신이 건강 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/05', '19/07/07', '19/09/06');
insert into SUBJECT values('C0000007', 'G0000001', 'ggg@google.com', '손현준', '당신이 사회, 정치 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/06', '19/07/08', '19/09/07');
insert into SUBJECT values('C0000008', 'H0000001', 'hhh@google.com', '박상우', '당신이 경제 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/07', '19/07/09', '19/09/08');
insert into SUBJECT values('C0000009', 'I0000001', 'iii@google.com', '최정인', '당신이 여행 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/08', '19/07/10', '19/09/09');
insert into SUBJECT values('C0000010', 'J0000001', 'jjj@google.com', '최영훈', '당신이 스포츠, 레저 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/09', '19/07/11', '19/09/10');
insert into SUBJECT values('C0000011', 'A0000001', 'aaa@google.com', '최운학', '당신이 교육, 학문 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/01', '19/07/02', '19/07/10');
insert into SUBJECT values('C0000012', 'B0000001', 'bbb@google.com', '곽지훈', '당신이 컴퓨터 통신 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/02', '19/07/02', '19/07/11');
insert into SUBJECT values('C0000013', 'C0000001', 'ccc@google.com', '변정우', '당신이 게임 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/03', '19/07/02', '19/07/12');
insert into SUBJECT values('C0000014', 'D0000001', 'ddd@google.com', '이재하', '당신이 엔터테인먼트, 예술 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/04', '19/07/02', '19/07/13');
insert into SUBJECT values('C0000015', 'E0000001', 'eee@google.com', '조성식', '당신이 생활 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/05', '19/07/02', '19/07/14');
insert into SUBJECT values('C0000016', 'F0000001', 'fff@google.com', '박동진', '당신이 건강 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/06', '19/07/02', '19/07/15');
insert into SUBJECT values('C0000017', 'G0000001', 'ggg@google.com', '손현준', '당신이 사회, 정치 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/07', '19/07/02', '19/07/16');
insert into SUBJECT values('C0000018', 'H0000001', 'hhh@google.com', '박상우', '당신이 경제 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/08', '19/07/02', '19/07/17');
insert into SUBJECT values('C0000019', 'I0000001', 'iii@google.com', '최정인', '당신이 여행 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/09', '19/07/02', '19/07/18');
insert into SUBJECT values('C0000020', 'J0000001', 'jjj@google.com', '최영훈', '당신이 스포츠, 레저 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/10', '19/07/02', '19/07/19');
insert into SUBJECT values('C0000021', 'K0000001', 'kkk@google.com', '신성호', '당신이 쇼핑 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/11', '19/07/02', '19/07/20');
insert into SUBJECT values('C0000022', 'L0000001', 'lll@google.com', '정찬우', '당신이 지역 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/12', '19/07/02', '19/07/21');
insert into SUBJECT values('C0000023', 'M0000001', 'mmm@google.com', '이호균', '당신이 결혼 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/13', '19/07/02', '19/07/22');
insert into SUBJECT values('C0000024', 'A0000001', 'aaa@google.com', '최운학', '당신이 교육, 학문 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/14', '19/07/02', '19/07/23');
insert into SUBJECT values('C0000025', 'B0000001', 'bbb@google.com', '곽지훈', '당신이 컴퓨터 통신 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/15', '19/07/02', '19/07/24');
insert into SUBJECT values('C0000026', 'C0000001', 'ccc@google.com', '변정우', '당신이 게임 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/16', '19/07/02', '19/07/25');
insert into SUBJECT values('C0000027', 'D0000001', 'ddd@google.com', '이재하', '당신이 엔터테인먼트, 예술 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/17', '19/07/02', '19/07/26');
insert into SUBJECT values('C0000028', 'A0000001', 'aaa@google.com', '최운학', '당신이 교육, 학문 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/18', '19/07/02', '19/08/20');
insert into SUBJECT values('C0000029', 'B0000001', 'bbb@google.com', '곽지훈', '당신이 컴퓨터 통신 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/19', '19/07/02', '19/08/21');
insert into SUBJECT values('C0000030', 'C0000001', 'ccc@google.com', '변정우', '당신이 게임 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/20', '19/07/02', '19/08/22');
insert into SUBJECT values('C0000031', 'D0000001', 'ddd@google.com', '이재하', '당신이 엔터테인먼트, 예술 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/21', '19/07/02', '19/08/23');
insert into SUBJECT values('C0000032', 'E0000001', 'eee@google.com', '조성식', '당신이 생활 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/22', '19/07/02', '19/08/24');
insert into SUBJECT values('C0000033', 'F0000001', 'fff@google.com', '박동진', '당신이 건강 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/23', '19/07/02', '19/08/25');
insert into SUBJECT values('C0000034', 'G0000001', 'ggg@google.com', '손현준', '당신이 사회, 정치 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/24', '19/07/02', '19/08/26');
insert into SUBJECT values('C0000035', 'H0000001', 'hhh@google.com', '박상우', '당신이 경제 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/25', '19/07/02', '19/08/27');
insert into SUBJECT values('C0000036', 'I0000001', 'iii@google.com', '최정인', '당신이 여행 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/26', '19/07/02', '19/08/28');
insert into SUBJECT values('C0000037', 'J0000001', 'jjj@google.com', '최영훈', '당신이 스포츠, 레저 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/27', '19/07/02', '19/08/29');
insert into SUBJECT values('C0000038', 'K0000001', 'kkk@google.com', '신성호', '당신이 쇼핑 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/28', '19/07/02', '19/08/30');
insert into SUBJECT values('C0000039', 'L0000001', 'lll@google.com', '정찬우', '당신이 지역 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/29', '19/07/02', '19/08/31');
insert into SUBJECT values('C0000040', 'M0000001', 'mmm@google.com', '이호균', '당신이 결혼 카테고리에서 가장 좋아하는 설문 주제는?', '19/06/30', '19/07/02', '19/09/01');
insert into SUBJECT values('C0000041', 'A0000001', 'aaa@google.com', '최운학', '당신이 교육, 학문 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/01', '19/07/02', '19/09/02');
insert into SUBJECT values('C0000042', 'B0000001', 'bbb@google.com', '곽지훈', '당신이 컴퓨터 통신 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/02', '19/07/03', '19/09/03');
insert into SUBJECT values('C0000043', 'C0000001', 'ccc@google.com', '변정우', '당신이 게임 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/03', '19/07/05', '19/09/04');
insert into SUBJECT values('C0000044', 'D0000001', 'ddd@google.com', '이재하', '당신이 엔터테인먼트, 예술 카테고리에서 가장 좋아하는 설문 주제는?', '19/07/04', '19/07/06', '19/09/05');

-- 질문
insert into QUESTION values('D0000001', 'C0000001', '질문1', '객관식', null, null, SYSDATE);
insert into QUESTION values('D0000002', 'C0000002', '질문2', '주관식', null, null, SYSDATE);
insert into QUESTION values('D0000003', 'C0000003', '질문3', '객관식', null, null, SYSDATE);
insert into QUESTION values('D0000004', 'C0000004', '질문4', '객관식', null, null, SYSDATE);
insert into QUESTION values('D0000005', 'C0000005', '질문5', '주관식', null, null, SYSDATE);
insert into QUESTION values('D0000006', 'C0000006', '질문6', '객관식', null, null, SYSDATE);
insert into QUESTION values('D0000007', 'C0000007', '질문7', '주관식', null, null, SYSDATE);
insert into QUESTION values('D0000008', 'C0000008', '질문8', '주관식', null, null, SYSDATE);
insert into QUESTION values('D0000009', 'C0000009', '질문9', '객관식', null, null, SYSDATE);
insert into QUESTION values('D0000010', 'C0000010', '질문10', '주관식', null, null, SYSDATE);

-- 아이템
insert into ITEM values('E0000001', 'D0000001', '아이템내용1', null, SYSDATE);
insert into ITEM values('E0000002', 'D0000002', '아이템내용2', null, SYSDATE);
insert into ITEM values('E0000003', 'D0000003', '아이템내용3', null, SYSDATE);
insert into ITEM values('E0000004', 'D0000004', '아이템내용4', null, SYSDATE);
insert into ITEM values('E0000005', 'D0000005', '아이템내용5', null, SYSDATE);
insert into ITEM values('E0000006', 'D0000006', '아이템내용6', null, SYSDATE);
insert into ITEM values('E0000007', 'D0000007', '아이템내용7', null, SYSDATE);
insert into ITEM values('E0000008', 'D0000008', '아이템내용8', null, SYSDATE);
insert into ITEM values('E0000009', 'D0000009', '아이템내용9', null, SYSDATE);
insert into ITEM values('E0000010', 'D0000010', '아이템내용10', null, SYSDATE);

-- 답변
insert into ANSWER values('F0000001', 'E0000001', 'aaa@google.com', '최운학', '답변내용1', SYSDATE);
insert into ANSWER values('F0000002', 'E0000002', 'bbb@google.com', '곽지훈', '답변내용2', SYSDATE);
insert into ANSWER values('F0000003', 'E0000003', 'ccc@google.com', '변정우', '답변내용3', SYSDATE);
insert into ANSWER values('F0000004', 'E0000004', 'ddd@google.com', '이재하', '답변내용4', SYSDATE);
insert into ANSWER values('F0000005', 'E0000005', 'eee@google.com', '조성식', '답변내용5', SYSDATE);
insert into ANSWER values('F0000006', 'E0000006', 'fff@google.com', '박동진', '답변내용6', SYSDATE);
insert into ANSWER values('F0000007', 'E0000007', 'ggg@google.com', '손현준', '답변내용7', SYSDATE);
insert into ANSWER values('F0000008', 'E0000008', 'hhh@google.com', '박상우', '답변내용8', SYSDATE);
insert into ANSWER values('F0000009', 'E0000009', 'iii@google.com', '최정인', '답변내용9', SYSDATE);
insert into ANSWER values('F0000010', 'E0000010', 'jjj@google.com', '최영훈', '답변내용10', SYSDATE);

-- 알림
insert into NOTICE values('G0000001', 'aaa@google.com', 'A0000001', '알림메시지1', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000002', 'bbb@google.com', 'A0000002', '알림메시지2', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000003', 'ccc@google.com', 'A0000003', '알림메시지3', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000004', 'ddd@google.com', 'A0000004', '알림메시지4', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000005', 'eee@google.com', 'A0000005', '알림메시지5', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000006', 'fff@google.com', 'A0000006', '알림메시지6', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000007', 'ggg@google.com', 'A0000007', '알림메시지7', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000008', 'hhh@google.com', 'A0000008', '알림메시지8', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000009', 'iii@google.com', 'A0000009', '알림메시지9', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000010', 'jjj@google.com', 'A0000010', '알림메시지10', SYSDATE, SYSDATE, SYSDATE);

-- 새소식
Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (777,'이벤트','매주 진행되는 리서치 이벤트!!','안녕하세요. FreSearch 입니다.

매주 1회 리서치 이벤트가 올라오면 이벤트 게시판 내용을 확인한 후, 해당 리서치를 참여하시면 됩니다.

※ 이벤트 추첨 보상 : 문화 상품권 1만원 권 (5명)

※ 이벤트 추첨 보상 : 문화 상품권 5천원 권 (10명)',SYSDATE,'N');


Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (888,'이벤트','서비스 오픈 기념 이벤트!!','■ EVENT 1. FreSearch 오픈기념 이벤트!


FreSearch 신규 회원가입을 하신 분들 중 추첨을 통해 상품을 드립니다.


* 이벤트 기간 : 8월 19일(월) ~ 8월 26일(월) 
* 이벤트 상품 : 구글 기프트카드 10,000원 (30명)
* 당첨자 발표 : 8월 28일(수), FreSearch 이벤트 게시판',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (111,'이벤트','[FreSearch] 벌써1주일?! FreSearch 1주일 기념 설문조사 이벤트!','◆ Event. 벌써 1주일!? 당신과 함께한 FreSearch 설문조사!


FreSearch에서 제공하는 설문조사에 참여해 주세요~!


■ 이벤트기간 : 2019년 8월 17일(토) ~ 8월 24일(토)
■ 당첨자발표 : 2019년 8월 21일(수)


■ 이벤트상품 :

설문조사에 참여하신 모든 분들께 박수를,
추첨을 통해 당첨된 54분께는 다음과 같은 푸짐한 상품을 드립니다.

ㅁ 삼성 블루 ST550 디지털 카메라 - 1명
ㅁ 24인치 와이드 LCD 모니터 - 3명
ㅁ 삼성 Yepp YP-P3 (4GB) - 5명
ㅁ 문화상품권 5만원권 - 20명

감사합니다.
',SYSDATE,'Y');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (333,'공지','8월 24일(토) 오전 2시~6시, FreSearch 서버 점검 안내','8월 24일(토) 오전 2시~6시, FreSearch 서버 점검 안내

안녕하세요. FreSearch 입니다.



8월 24일 토요일, 오전 2시부터 6시까지
약 4시간 동안 FreSearch 서버 점검이 예정되어 있습니다.

점검이 진행되는 동안에도 사이트 이용은 가능하오나, 
간헐적으로 일부 커뮤니티 내 기능이 원활하지 않을 수 있는 만큼
이용해주시는 여러분들께 미리 양해 말씀 드립니다.

점검 상황에 따라 예정 시간보다 지연될 수 있고,
조기 완료될 시, 점검이 더욱 일찍 마무리 될 예정입니다.
최대한 빠르게 진행하여 불편을 최소화하도록 하겠습니다. 

이용에 불편을 드린 점 다시 한번 사과의 말씀 드립니다.


[FreSearch 서버 점검 안내] 

일시 : 8월 24일(토) 오전 2시 ~ 오전 6시
점검 내용 : DB OS 패치
영향 : 해당 시간 동안 사이트가 느려지거나 불안정해질 수 있습니다.



최대한 빠른 시간 안에 점검을 마쳐 편안하게 이용하실 수 있도록 하겠습니다.


감사합니다.',SYSDATE,'Y');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (444,'공지','신고 기능이 잠시 중지됩니다.','안녕하세요, FreSearch 팀입니다. 

FreSearch 는 게시글의 성인 음란 사이트나 도박 사이트 등 
불법 사이트 광고부터 이용자에게 피해를 줄 수 있는 악성코드 글들을 
보다 빨리 처리하기 위해 광고 신고 기능을 운영해왔습니다.

하지만 최근 광고 신고 시스템의 오남용에 대한 많은 분들의 다양한 의견을 취합하면서, 
해당 시스템에 대해 재검토가 필요하다고 판단하게 되었습니다.

이에 우선적으로 광고 신고 시스템을 잠시 중단하고, 관련해서 재검토에 들어갈 예정입니다.

더 나은 FreSearch 가 되기 위한 결정인만큼 넓은 마음으로 양해부탁드리며, 
성인 사이트나 도박 사이트 등 불법 사이트 게시물은 문의하기를 통해 내용을 주시면, 
최대한 빠르게 조치하도록 하겠습니다.

감사합니다.',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (555,'공지','2019년 8월 31일 이용약관 일부 개정 안내','안녕하세요. FreSearch 입니다.

FreSearch 의 이용약관은 지난 2019년 8월 31일을 끝으로 개정되지 않아 
현재의 인터넷 사용자 환경을 모두 반영하는데 부족함이 있었습니다. 

특히 개인정보 보호나 보안 등에 있어서 항상 최신 방식, 최신 규정을 준수하고 있었으나
이를 약관에 모두 담아내지 못했었고 이를 항상 아쉬워했었는데요. 

하여 앞으로 점차 이용약관을 현재의 환경에 맞게끔 수정할 예정입니다. 

이번 개정은 이러한 수정의 시작으로 이용약관 변경 내용은 아래와 같으니 참고 부탁드립니다. 

적용 일자 : 2019년 8월 31일
변경 내용 : 
- 약관 게시 방법 및 개정 절차를 보다 명확하게 변경 
- 회사의 휴면회원의 개인정보 분리 보관 및 보호 의무 강화
- 게시물 임시조치 권리 추가 

아래 내용은 2019년 8월 31일 적용될 예정입니다. 


약관 신구 대비 안내 

[기존]
제 2 조 (약관의 효력 및 변경)
① 이 약관은 웹 사이트를 통하여 공지하거나 혹은 회원들에게 전자우편으로 통보함으로써 그 효력이 발생됩니다.
② 회사는 사정상 중요한 사유가 발생될 경우 사전 고지 없이 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 서비스를 통하여 공지합니다.
③ 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 10일 이내에 해지 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
[변경]
제 2 조 (약관의 효력 및 변경)
① 본 약관의 내용은 회원이 쉽게 알 수 있도록 서비스 화면에 게시합니다. 
② 회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용 일자 및 변경 내용을 명시하여 제1항의 방법으로 그 적용 일자 7일 전부터 공지합니다. 다만, 회원에게 불리한 약관의 변경인 경우에는 최소 적용 일자 30일 전까지 회원 정보에 기재된 이메일로 개별 통지합니다. 단, 회원에게 개별 통지가 어려운 경우에 한하여 본 항의 공지를 함으로써 개별 통지한 것으로 간주합니다. 
③ 회사가 제2항에 따라 변경 약관을 공지 또는 통지하면서 회원에게 약관변경 적용일까지 거부 의사 표시를 하지 않으면 약관변경에 동의한 것으로 간주한다는 내용을 공지 또는 통지하였음에도 회원이 명시적인 거부의 의사 표시를 하지 아니할 경우 회원이 변경 약관에 동의한 것으로 봅니다. 회원은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수 있습니다



[기존]
신규 추가 
[변경]
제 8 조 (개인정보의보호)
⑥ 회원이 휴면회원으로 분류될 경우, 휴면 회원의개인 정보는 분리하여 보관합니다. 회사는 회원이 서비스를 재개하거나 법령에 특별한 규정이 있는 경우를 제외하고는 분리된 개인 정보를 이용하거나 제공하지 않습니다.



※ 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수 있습니다. 이러한 명시적인 거부의 의사 표시를 하지 아니할 경우 약관 변경에 동의한 것으로 간주합니다. 

감사합니다.',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (666,'이벤트','통계 예측 이벤트 ''2045년 우리는?','▶ 참여 방법
STEP1. 아래의 세 가지 설문을 확인한다

1. 2045년 1인가구 비중이 가장 많은 시도는?             
2. 2045년 여성가구주 비중이 가장 많은 시도는?        
3. 2045년 65세 이상 가구 비중이 가장 많은 시도는?

STEP2. 문제를 예측해보고 설문에 참여한다

STEP3. 본 이벤트를 ‘공유’하면 당첨확률 UP!

▶ 이벤트 기간 
2017. 08. 09(수) ~ 08. 18(금) (10일간) 

▶당첨자 발표
2017.08.23(수) / Fresearch 홈페이지 발표

▶이벤트 경품
 BHC 양념 반 후라이드 반 + 콜라 1.25L   (10명)        
 스타벅스 다크 모카 프라푸치노 Tall   (20명)

',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (222,'공지','자유로운 리서치 서비스인 "FreSerach" 가 서비스를 시작 되었습니다.','안녕하세요, FreSerach 입니다.

자유로운 리서치 서비스인 "FreSerach" 가 서비스를 시작합니다.

해당 서비스는 기존의 리서치나 통계사이트와는 차별화되어 운영되는 서비스로, 누구나 자유롭게 패널 신청을 하여 리서치를 등록하고, 누구나 자유롭게 리서치에 대한 통계를 확인할 수 있습니다.

리처스 등록을 하기 위해서는 FreSerach  회원 가입이 필요하고, 별도의 승인이 필요 합니다. 통계확인은 별도의 가입 필요 없이 가능 하지만, 회원 가입 시 자신이 관심있는 분야의 리서치가 등록되면 알림이 설정 됩니다. 

회원분들의 많은 이용 바랍니다. 

감사합니다.',SYSDATE,'N');

-- 자유게시판
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'aaa@google.com', '최운학', '자게제목1', '자게내용1', 0, 0, 0, 'A0BCDE', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'bbb@google.com', '곽지훈', '자게제목2', '자게내용2', 0, 0, 0, 'B1CDEF', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ccc@google.com', '변정우', '자게제목3', '자게내용3', 0, 0, 0, 'C2DEFG', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ddd@google.com', '이재하', '자게제목4', '자게내용4', 0, 0, 0, 'D3EFGH', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'eee@google.com', '조성식', '자게제목5', '자게내용5', 0, 0, 0, 'E4FGHI', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'fff@google.com', '박동진', '자게제목6', '자게내용6', 0, 0, 0, 'F5GHIJ', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ggg@google.com', '손현준', '자게제목7', '자게내용7', 0, 0, 0, 'G6HIJK', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'hhh@google.com', '박상우', '자게제목8', '자게내용8', 0, 0, 0, 'H7IJKL', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'iii@google.com', '최정인', '자게제목9', '자게내용9', 0, 0, 0, 'I8JKLM', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'jjj@google.com', '최영훈', '자게제목10', '자게내용10', 0, 0, 0, 'J9KLMN', 0, SYSDATE);

-- 댓글
insert into REPLY values(REPLY_SEQ.NEXTVAL, 2, 'aaa@google.com', '최운학', '댓글내용1', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 3, 'bbb@google.com', '곽지훈', '댓글내용2', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 4, 'ccc@google.com', '변정우', '댓글내용3', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 5, 'ddd@google.com', '이재하', '댓글내용4', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 6, 'eee@google.com', '조성식', '댓글내용5', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 7, 'fff@google.com', '박동진', '댓글내용6', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 8, 'ggg@google.com', '손현준', '댓글내용7', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 9, 'hhh@google.com', '박상우', '댓글내용8', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 10, 'iii@google.com', '최정인', '댓글내용9', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 11, 'jjj@google.com', '최영훈', '댓글내용10', 0, 0, SYSDATE);


commit;