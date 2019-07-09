--회원 (권한 - 0:관리자, 1:일반회원)
insert into MEMBER values('bit@naver.com', '비트','1', '1q2w3e4r!','비트캠프', '국민은행', 134256854943,01055765483 ,1000000, 100, SYSDATE);
insert into MEMBER values('king@naver.com', '킹' ,'0', '1q2w3e4r!','왕', '국민은행' , 138549345934,01047568345,3000000,80, SYSDATE);
insert into MEMBER values('aaa@google.com','운학','0','1q2w3e4r!', '최운학', '국민은행',111122223333,01011112222,2000000,90,SYSDATE);
insert into MEMBER values('bbb@google.com','지훈','0','1q2w3e4r!', '곽지훈','신한은행',444455556666,01033334444,2000000,90,SYSDATE);
insert into MEMBER values('ccc@naver.com','성식','0','1q2w3e4r!', '조성식','카카오뱅크',124578435892,01012345678,2000000,90,SYSDATE);
insert into MEMBER values('ddd@naver.com','정우','0','1q2w3e4r!', '변정우','우리은행',777788889999,01055556666,2000000,90,SYSDATE);
insert into MEMBER values('eee@daum.net', '동진','0','1q2w3e4r!', '박동진','기업은행',987654321234,01098765432,2000000,90,SYSDATE);
insert into MEMBER values('fff@naver.com', '채연' ,'1', '1q2w3e4r!','정채연', '국민은행', 139706594945,01043583223, 2000000, 70 , SYSDATE);
insert into MEMBER values('ggg@naver.com','나리','0', '1q2w3e4r!','김나리', '신한은행' , 448689574056,01065943452,800000, 75,  SYSDATE);
insert into MEMBER values('hhh@naver.com', '영훈' ,'1', '1q2w3e4r!','최영훈', '신한은행', 448658095464,01086747432, 1200000, 85 , SYSDATE);
insert into MEMBER values('iii@google.com','성호' ,'0', '1q2w3e4r!','신성호', '신한은행', 445848794033,01032656473, 600000, 95 ,   SYSDATE);
insert into MEMBER values('jjj@google.com','현서' ,'1', '1q2w3e4r!','정현서', '카카오뱅크', 123869540943,01095663734,800000, 60 , SYSDATE);
insert into MEMBER values('kkk@daum.net','찬우' ,'0', '1q2w3e4r!','정찬우', '카카오뱅크', 124669940345,01067743822,1000000, 75,   SYSDATE);
insert into MEMBER values('lll@daum.net' ,'재현','1', '1q2w3e4r!','김재현', '우리은행', 774583492524,01054783432,1500000, 80, SYSDATE);
insert into MEMBER values('mmm@daum.net', '호균','0', '1q2w3e4r!','이호균', '우리은행',772347543892,01027374234, 2000000, 90 ,  SYSDATE);

-- 회원 금융 정보
insert into MONEY_MEMBER values('최운학', '01011112222', '국민은행', '111122223333', '최운학');
insert into MONEY_MEMBER values('곽지훈', '01033334444', '신한은행', '444455556666', '곽지훈');
insert into MONEY_MEMBER values('조성식', '01012345678', '카카오뱅크', '123456789012', '조성식');
insert into MONEY_MEMBER values('변정우', '01055556666', '우리은행', '777788889999', '변정우');
insert into MONEY_MEMBER values('박동진', '01098765432', '기업은행', '987654321234', '박동진');


--상품 (진행상태 - 0:판매중, 1:거래중, 2:거래완료 / 상품유형 - 0:팝니다, 1:삽니다)
--인성팝니다
insert into PRODUCT values(1, 'bit@naver.com', '비트', 100, '판매중', null, '기타', '팝니다', 500000, '인성 팝니다', '흐르는 인성 나눠드리려고 팝니다.', 0, 0, 'iPad.jpg', 'iPad_copy01.jpg',SYSDATE); 
--정신머리 팝니다
insert into PRODUCT values(2, 'king@naver.com', '킹', 80, '판매중', null, '기타', '팝니다', 13000, '정신머리 팝니다', '정신머리 필요하신분 사가세요.',1, 0, 'handifan.jpg', 'handifan_copy02.jpg',SYSDATE);
--영혼팝니다
insert into PRODUCT values(3, 'aaa@google.com','운학', 90, '판매중', null, '기타', '팝니다', 700000, '영혼 팝니다', '혹시 거주지가 지옥불반도 이신분 계신가요', 0, 0, 'gram.jpg', 'gram_copy03.jpg',SYSDATE);
--월요일 팝니다
insert into PRODUCT values(4, 'bbb@google.com','지훈', 90, '판매중', null, '기타', '팝니다', 600000, '월요일 팝니다', '월요병도 같이 드려요.', 0, 0, 'gtx1080.jpg', 'gtx1080_copy04.jpg',SYSDATE);
--근윽 팝니다
insert into PRODUCT values(5, 'ccc@naver.com','성식', 90, '판매중', null, '기타', '팝니다', 300000, '근육 팝니다', '헬창 성님들 질 좋은 그뉵 필요하지 않으십니까', 1, 0, 'cap.jpg', 'cap_copy05.jpg', SYSDATE);
--출근자 삽니다 
insert into PRODUCT values(6, 'ddd@naver.com','정우', 90, '구매중', null, '기타', '삽니다', 250000, '출근자 삽니다', '노동력 필요합니다 급하게 구해요', 1, 0, 'monitor.jpg', 'monitor_copy06.jpg', SYSDATE);
--여포 삽니다
insert into PRODUCT values(7, 'eee@daum.net', '동진', 90, '구매중', null, '기타', '삽니다', 150000, '여포 삽니다','부모님께 "아 알아서 한다고" 5회 이상 해보신분.', 0, 0, 'nike.jpg', 'nike_copy07.jpg', SYSDATE);
--주말 삽니다
insert into PRODUCT values(8, 'fff@naver.com','채연',70, '구매중', null, '기타', '삽니다', 20000, '주말 삽니다', '제가 부주의 해서 주말을 잃어버렸습니다 혹시 남는 주말 있으신분.', 1, 0, 'cupbab.jpg', 'cupbab_copy08.jpg',SYSDATE);
--머리카락 삽니다
insert into PRODUCT values(9, 'ggg@naver.com','나리',75, '구매중', null,   '기타', '삽니다', 750000, '머리카락 삽니다', '자라나라 머리머리',0, 0, 'series9.jpg', 'series9_copy09.jpg',SYSDATE);
--저는 서울 삽니다
insert into PRODUCT values(10,'hhh@naver.com', '영훈',85, '구매중', null,  '기타', '삽니다', 20000, '저는 서울 삽니다', '유사 서울 안삽니다.', 1, 0, 'book.jpg', 'book_copy10.jpg',SYSDATE); 
--주말 팝니다
insert into PRODUCT values(11,'iii@google.com','성호',95, '판매중', null,  '기타', '팝니다', 100000, '주말 팝니다', '자택 24시간 근무자 입니다 주말 너무 길어요.', 1, 0, 'eleccigr.jpg', 'eleccigr_copy11.jpg',SYSDATE);
--정신머리 팝니다
insert into PRODUCT values(12,'jjj@google.com','현서',60, '판매중', null,   '기타', '팝니다', 500000, '정신머리 삽니다', '국민학교 졸업한 19살 군필 여고생입니다 동년배들이 전부 정신머리가 없읍니다 ', 0, 0, 'gucci.jpg', 'gucci_copy12.jpg',SYSDATE);
--룰루랄라 삽니다
insert into PRODUCT values(13,'kkk@daum.net','찬우',75, '구매중', null,   '기타', '삽니다', 300000, '룰루랄라 삽니다', '즐겁게 삽시다', 0, 0, 'luisvit.jpg', 'luisvit_copy13.jpg',SYSDATE); 
--노래주머니 팝니다
insert into PRODUCT values(14,'lll@daum.net','재현',80, '판매중', null,  '기타', '팝니다', 140000, '노래주머니 팝니다','싱싱합니다 노래주머니', 1, 0, 'airpod.jpg', 'airpod_copy14.jpg',SYSDATE);
-- 전 잘삽니다
insert into PRODUCT values(15,'mmm@daum.net', '호균',90,  '구매중', null,  '기타',  '삽니다', 70000, '전 잘 삽니다', '아시겠어요?', 1, 0, 'BTspeaker.jpg', 'BTspeaker_copy15.jpg',SYSDATE);


--결제
insert into PAYMENT values(1, 1, '비트', '국민은행', 134256854943, '형규', null, 123456789012, 500000, 500000, SYSDATE, '서울시 양천구 월정로 29길 22 태산주택 502호' , '구매확인', '판매확인');
insert into PAYMENT values(2, 2, '킹','국민은행', 138549345934, '인희',null, null, 13000, 13000, SYSDATE, '화곡역 5번 출구', '구매확인', '판매확인');
insert into PAYMENT values(3, 3, '운학','국민은행', 111122223333, '시욱',null, 777788889999, 700000, 700000, SYSDATE, '서울대역', '구매안함', '판매확인');
insert into PAYMENT values(4, 4, '지훈','신한은행', 444455556666, '채현',null, 987654321234, 600000, 600000, SYSDATE, '비트캠프', '구매확인', '판매안함');

--거래기록
insert into HISTORY values(1, '비트', 1342568574943, '형규', 123456789012, 500000, SYSDATE);
insert into HISTORY values(2, '킹', 138549345934, '인희', null, 13000, SYSDATE);

--상품댓글
insert into P_REPLY values(1, 1, 'bit@naver.com', '비트', '아이패드 3만원 할인가능한가요?', 'iPad.jpg', 'iPad_copy01.jpg', SYSDATE);
insert into P_REPLY values(2, 3, 'aaa@google.com', '운학', '직거래하면 만원 빼주시나요?', 'gram.jpg', 'gram_copy03.jpg', SYSDATE);


--신고목록
insert into REPORT values(1,'닉네임 성식님 사기 신고', '이 사람 그냥 사기꾼이라서 사기를 당했습니다', 'a.jpg', 'a_copy.jpg', 'ddd@naver.com', '정우', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.
', '사기신고');
insert into REPORT values(2, '운학 << 이님 사기 신고', '120만원짜리 10만원에 팜 개이득', 'b.jpg', 'b_copy.jpg', 'ccc@naver.com', '성식', SYSDATE, '처리완료', '환불조치해 드렸습니다', '사기신고');
insert into REPORT values(3, '사이트가 버벅이는거 같아요..', '사이트 이동할때 마다 렉이 있네요', 'c.jpg', 'c_copy.jpg', 'ccc@naver.com', '성식', SYSDATE, '처리완료', '고객님의 의견을 반영하여 빠른 시일내에 개선하도록 하겠습니다.', '불편신고');
insert into REPORT values(4, '닉네임 찬우 라는사람 허위매물', '이분 중고나라에 비행기 판다고 올리셧네요 확인바랍니다..', 'd.jpg', 'd_copy.jpg', 'bbb@google.com', '지훈', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.', '허위상품신고');
insert into REPORT values(5, '배송비 사기!!', '물건값 내리고 배송비 엄청 늘려서 올리는사람 많아요 찾아서 재제 때려주세요', 'e.jpg', 'e_copy.jpg', 'king@naver.com', '킹', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.', '사기신고');
insert into REPORT values(6, '중고책 상태;;', '닉네임 비트 이분꺼 중고책 구매했는데 DB책 삿는데 자바관련 책 배송오고 연락두절됨', 'f.jpg', 'f_copy.jpg', 'kkk@daum.net', '찬우', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.', '사기신고');
insert into REPORT values(7, '자유게시판에 도배글', '자게에 갑자기 도배글이 많아졌는데 처리좀 해주세요 ', 'g.jpg', 'g_copy.jpg', 'iii@google.com', '성호', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.', '불편신고');
insert into REPORT values(8, '닉넴 킹 사기 신고', '상품 내용과 맞지않는 물품을 보내는 사기를 당했습니다', 'a.jpg', 'a_copy.jpg', 'eee@daum.net', '동진', SYSDATE, '처리중', '신고가 처리 중 이며, 빠른시일 내에 답변 예정입니다.', '사기신고');
insert into REPORT values(9, '사기 신고', ' 6/5에 거래했던거 물품을 아직도 보내지 않습니다. ', 'p.jpg', 'p_copy.jpg', 'ggg@naver.com', '나리', SYSDATE, '처리완료', '해당 회원에 대해 거래 정지와 함께 고객님의 환불조치가 완료 되었습니다.', '사기신고');
--새소식 ( 구분 - 0:공지사항, 1:이벤트)
insert into NEWS values(1, 'aaa@google.com', '운학', '사기 대처 방법', '유저 간 거래 시 사기를 당할 경우 빠르게 신고 바랍니다', 0, SYSDATE, '공지사항');
insert into NEWS values(2, 'bbb@google.com', '지훈', '첫 결제 시 수수료 감면 이벤트', '첫 결제 시 수수료를 감면해주는 이벤트를 진행합니다 지금 참여하세요', 0, SYSDATE, '이벤트');
insert into NEWS values(3, 'ccc@naver.com', '성식' ,'거래방법', 'TAKE A LOOK 의 모든거래는 미리 구매자에게 돈을 입금받아 관리자가 거래를 확인하고 체크하여 확인이 되면 판매자에게 돈이 입금되는 안전거래 시스템입니다', 0, SYSDATE, '공지사항');
insert into NEWS values(4,'ddd@naver.com', '정우', '오픈공지','가장 안전한 중고거래장터 TAKE A LOOK 이 오픈하였습니다 자유롭고 안전한 거래를 지금 바로 시작해보세요',0, SYSDATE, '공지사항');
insert into NEWS values(5,'eee@daum.net', '동진','신뢰도시스템','중고거래 장터 TAKE A LOOK은 신뢰도 시스템을 이용하여 판매자들의 신뢰도를 체크하여 공개함으로서 구매자들의 중고거래에 대한 부담감을 대폭 감소시켰습니다',0, SYSDATE, '공지사항');
insert into NEWS values(6,'aaa@google.com', '운학','포인트 적립','첫 구매시 구매금액의 1%를 포인트로 적립 해 드립니다', 0, SYSDATE, '이벤트');
insert into NEWS values(7,'bbb@google.com', '지훈','배송비 지원','이벤트에 당첨되신 10명의 회원에게는 구매한 상품 중 원하는 상품의 배송비를 1회 지원해드립니다', 0, SYSDATE, '이벤트');
insert into NEWS values(8, 'ccc@naver.com', '성식','부정거래','부정거래시 신뢰도시스템에 의거 신뢰도가 대폭 감소되며 차후 상품의 판매를 정지당할 수 있음을 알려드립니다',0, SYSDATE, '공지사항');
insert into NEWS values(9,'ddd@naver.com', '정우','거래안내','TAKE A LOOK 은 상품의 변질이나 기타 판매자의 관리소홀로 문제가 되는 부분에 대해서 보상해드리지 않음을 알려드립니다 ', 0, SYSDATE, '공지사항');
insert into NEWS values(10,'eee@daum.net', '동진','TAKE A LOOK 이 쏜다','이벤트에 당첨되신 한분께는 중고장터에서 사용하실수 있는 50000포인트를 적립해 드립니다', 0, SYSDATE, '이벤트');

--자유게시판
insert into BOARD values(1, 'aaa@google.com', '운학', '갤S10 5G', '님들 요새 갤S10 5G 나왔던데 쓸만함?', 'aa.jpg', 'aa_copy01.jpg', 0, 0, SYSDATE, 0);
insert into BOARD values(2, 'bbb@google.com', '지훈', '다이슨 청소기', '다이슨 청소기 중고가도 너무 비싸던데...', 'bb.jpg', 'bb_copy01.jpg', 0, 0, SYSDATE, 0);
insert into BOARD values(3, 'ccc@naver.com', '성식', '에어팟', '에어팟1이랑 에어팟2 성능 차이 많이남?', null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(4, 'ddd@naver.com', '정우', '그램','그램 30만원에 싸게 매입합니다' , null, null,0, 0, SYSDATE, 0);
insert into BOARD values(5, 'eee@daum.net', '동진','데스크탑','컴퓨터 장비 싸게 매입합니다 문의주세여',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(6, 'fff@naver.com', '채연','컵밥', '컵밥은 중고로 판매 안하나요?',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(7, 'ggg@naver.com', '나리','닌텐도', '닌텐도 스위치 가장 싼 가격이 얼마인가요?',null, null,0, 0, SYSDATE, 0);
insert into BOARD values(8, 'hhh@naver.com', '영훈','풋살화', '풋살화 싸게 팝니다 문의주세요',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(9, 'iii@google.com', '성호','전자담배', '전자담배 팔아요 종류별로있습니다 문의주세요',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(10, 'jjj@google.com', '현서','노트북', '요즘 가성비 좋은 노트북 종류가 뭐가있나요?',null, null, 0, 0, SYSDATE, 0);

--자게댓글
insert into B_REPLY values(1, 1, 'bbb@google.com', '지훈', 'ㅇㅇ갤S10이쁨 근데 아직은 5G는 잘안터지더라', SYSDATE, 'aaa.png', 'aaa_copy01.png', 0, 0,'bbb@naver.com', '지훈');
insert into B_REPLY values(2, 2, 'iii@google.com', '성호',  '그냥 중고로 살바엔 새거로 사는게 훨씬 이득입니다', SYSDATE, 'bbb.png', 'bbb_copy01.png', 0, 0, 'iii@google.com', '성호');
insert into B_REPLY values(3, 3, 'hhh@naver.com', '영훈', '에어팟1 살바엔 에어팟2 사는게 훨씬 이득임', SYSDATE, 'ccc.png', 'ccc_copy01.png', 0, 0, 'hhh@naver.com', '영훈');

commit;