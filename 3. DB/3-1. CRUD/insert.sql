-- ȸ��
insert into MEMBER values('aaa@google.com', 'A0000001', '�ֿ���', 'pw01', '����Ư���� ������ ȭ�', 19890101, '��', '01011111111', 'Y', SYSDATE);
insert into MEMBER values('bbb@google.com', 'A0000002', '������', 'pw02', '����Ư���� ������ ��ġ���12�� 7', 19900202, '��', '01022222222', 'Y', SYSDATE);
insert into MEMBER values('ccc@google.com', 'A0000003', '������', 'pw03', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19890303, '��', '01033333333', 'N', SYSDATE);
insert into MEMBER values('ddd@google.com', 'A0000004', '������', 'pw04', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19890404, '��', '01044444444', 'N', SYSDATE);
insert into MEMBER values('eee@google.com', 'A0000005', '������', 'pw05', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19910505, '��', '01055555555', 'Y', SYSDATE);
insert into MEMBER values('fff@google.com', 'A0000006', '�ڵ���', 'pw06', '�λ걤���� �λ����� ���Ϸ� 295', 19920606, '��', '01077777777', 'N', SYSDATE);
insert into MEMBER values('ggg@google.com', 'A0000007', '������', 'pw07', '��õ������ ������ ������ 29 ��õ������û', 19910707, '��', '01088888888', 'N', SYSDATE);
insert into MEMBER values('hhh@google.com', 'A0000008', '�ڻ��', 'pw08', '��õ������ ������ ������ 29 ��õ������û', 19960808, '��', '01099999999', 'Y', SYSDATE);
insert into MEMBER values('iii@google.com', 'A0000009', '������', 'pw09', '��õ������ ������ ������ 29 ��õ������û', 19930909, '��', '01012345678', 'Y', SYSDATE);
insert into MEMBER values('jjj@google.com', 'A0000010', '�ֿ���', 'pw10', '��õ������ ������ ������ 29 ��õ������û', 19901010, '��', '01098765432', 'N', SYSDATE);
insert into MEMBER values('admin@fresearch.com', 'A0000011', 'admin', 'pw11', '����Ư���� ������ ȭ�', 19890101, '��', '01011111111', 'Y', SYSDATE);

-- ī�װ�
insert into CATEGORY values('A0000001', '����, �й�', SYSDATE);
insert into CATEGORY values('B0000001', '��ǻ�� ���', SYSDATE);
insert into CATEGORY values('C0000001', '����', SYSDATE);
insert into CATEGORY values('D0000001', '�������θ�Ʈ, ����', SYSDATE);
insert into CATEGORY values('E0000001', '��Ȱ', SYSDATE);
insert into CATEGORY values('F0000001', '�ǰ�', SYSDATE);
insert into CATEGORY values('G0000001', '��ȸ, ��ġ', SYSDATE);
insert into CATEGORY values('H0000001', '����', SYSDATE);
insert into CATEGORY values('I0000001', '����', SYSDATE);
insert into CATEGORY values('J0000001', '������, ����', SYSDATE);
insert into CATEGORY values('K0000001', '����', SYSDATE);
insert into CATEGORY values('L0000001', '����', SYSDATE);
insert into CATEGORY values('M0000001', '��ȥ', SYSDATE);

-- ����ī�װ�
insert into ATT_CATEGORY values('A0000001', 'aaa@google.com', 'A0000001', 'B0000001', 'C0000001', 'D0000001', 'E0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000002', 'bbb@google.com', 'F0000001', 'G0000001', 'H0000001', 'I0000001', 'J0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000003', 'ccc@google.com', 'K0000001', 'L0000001', 'M0000001', 'A0000001', 'B0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000004', 'ddd@google.com', 'C0000001', 'D0000001', 'E0000001', 'F0000001', 'G0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000005', 'eee@google.com', 'H0000001', 'I0000001', 'J0000001', 'K0000001', 'L0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000006', 'fff@google.com', 'M0000001', 'A0000001', 'B0000001', 'C0000001', 'D0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000007', 'ggg@google.com', 'E0000001', 'F0000001', 'G0000001', 'H0000001', 'I0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000008', 'hhh@google.com', 'J0000001', 'K0000001', 'L0000001', 'M0000001', 'A0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000009', 'iii@google.com', 'B0000001', 'C0000001', 'D0000001', 'E0000001', 'F0000001', '��ȥ', '��', '��', '��');
insert into ATT_CATEGORY values('A0000010', 'jjj@google.com', 'G0000001', 'H0000001', 'I0000001', 'J0000001', 'K0000001', '��ȥ', '��', '��', '��');

-- ���ҽ�
Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (777,'�̺�Ʈ','���� ����Ǵ� ����ġ �̺�Ʈ!!','�ȳ��ϼ���. FreSearch �Դϴ�.

���� 1ȸ ����ġ �̺�Ʈ�� �ö���� �̺�Ʈ �Խ��� ������ Ȯ���� ��, �ش� ����ġ�� �����Ͻø� �˴ϴ�.

�� �̺�Ʈ ��÷ ���� : ��ȭ ��ǰ�� 1���� �� (5��)

�� �̺�Ʈ ��÷ ���� : ��ȭ ��ǰ�� 5õ�� �� (10��)',SYSDATE,'N');


Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (888,'�̺�Ʈ','���� ���� ��� �̺�Ʈ!!','�� EVENT 1. FreSearch ���±�� �̺�Ʈ!


FreSearch �ű� ȸ�������� �Ͻ� �е� �� ��÷�� ���� ��ǰ�� �帳�ϴ�.


* �̺�Ʈ �Ⱓ : 8�� 19��(��) ~ 8�� 26��(��) 
* �̺�Ʈ ��ǰ : ���� ����Ʈī�� 10,000�� (30��)
* ��÷�� ��ǥ : 8�� 28��(��), FreSearch �̺�Ʈ �Խ���',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (111,'�̺�Ʈ','[FreSearch] ����1����?! FreSearch 1���� ��� �������� �̺�Ʈ!','�� Event. ���� 1����!? ��Ű� �Բ��� FreSearch ��������!


FreSearch���� �����ϴ� �������翡 ������ �ּ���~!


�� �̺�Ʈ�Ⱓ : 2019�� 8�� 17��(��) ~ 8�� 24��(��)
�� ��÷�ڹ�ǥ : 2019�� 8�� 21��(��)


�� �̺�Ʈ��ǰ :

�������翡 �����Ͻ� ��� �е鲲 �ڼ���,
��÷�� ���� ��÷�� 54�в��� ������ ���� Ǫ���� ��ǰ�� �帳�ϴ�.

�� �Ｚ ��� ST550 ������ ī�޶� - 1��
�� 24��ġ ���̵� LCD ����� - 3��
�� �Ｚ Yepp YP-P3 (4GB) - 5��
�� ��ȭ��ǰ�� 5������ - 20��

�����մϴ�.
',SYSDATE,'Y');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (333,'����','8�� 24��(��) ���� 2��~6��, FreSearch ���� ���� �ȳ�','8�� 24��(��) ���� 2��~6��, FreSearch ���� ���� �ȳ�

�ȳ��ϼ���. FreSearch �Դϴ�.



8�� 24�� �����, ���� 2�ú��� 6�ñ���
�� 4�ð� ���� FreSearch ���� ������ �����Ǿ� �ֽ��ϴ�.

������ ����Ǵ� ���ȿ��� ����Ʈ �̿��� �����Ͽ���, 
���������� �Ϻ� Ŀ�´�Ƽ �� ����� ��Ȱ���� ���� �� �ִ� ��ŭ
�̿����ֽô� �����е鲲 �̸� ���� ���� �帳�ϴ�.

���� ��Ȳ�� ���� ���� �ð����� ������ �� �ְ�,
���� �Ϸ�� ��, ������ ���� ���� ������ �� �����Դϴ�.
�ִ��� ������ �����Ͽ� ������ �ּ�ȭ�ϵ��� �ϰڽ��ϴ�. 

�̿뿡 ������ �帰 �� �ٽ� �ѹ� ����� ���� �帳�ϴ�.


[FreSearch ���� ���� �ȳ�] 

�Ͻ� : 8�� 24��(��) ���� 2�� ~ ���� 6��
���� ���� : DB OS ��ġ
���� : �ش� �ð� ���� ����Ʈ�� �������ų� �Ҿ������� �� �ֽ��ϴ�.



�ִ��� ���� �ð� �ȿ� ������ ���� ����ϰ� �̿��Ͻ� �� �ֵ��� �ϰڽ��ϴ�.


�����մϴ�.',SYSDATE,'Y');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (444,'����','�Ű� ����� ��� �����˴ϴ�.','�ȳ��ϼ���, FreSearch ���Դϴ�. 

FreSearch �� �Խñ��� ���� ���� ����Ʈ�� ���� ����Ʈ �� 
�ҹ� ����Ʈ ������� �̿��ڿ��� ���ظ� �� �� �ִ� �Ǽ��ڵ� �۵��� 
���� ���� ó���ϱ� ���� ���� �Ű� ����� ��ؿԽ��ϴ�.

������ �ֱ� ���� �Ű� �ý����� �����뿡 ���� ���� �е��� �پ��� �ǰ��� �����ϸ鼭, 
�ش� �ý��ۿ� ���� ����䰡 �ʿ��ϴٰ� �Ǵ��ϰ� �Ǿ����ϴ�.

�̿� �켱������ ���� �Ű� �ý����� ��� �ߴ��ϰ�, �����ؼ� ����信 �� �����Դϴ�.

�� ���� FreSearch �� �Ǳ� ���� �����θ�ŭ ���� �������� ���غ�Ź�帮��, 
���� ����Ʈ�� ���� ����Ʈ �� �ҹ� ����Ʈ �Խù��� �����ϱ⸦ ���� ������ �ֽø�, 
�ִ��� ������ ��ġ�ϵ��� �ϰڽ��ϴ�.

�����մϴ�.',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (555,'����','2019�� 8�� 31�� �̿��� �Ϻ� ���� �ȳ�','�ȳ��ϼ���. FreSearch �Դϴ�.

FreSearch �� �̿����� ���� 2019�� 8�� 31���� ������ �������� �ʾ� 
������ ���ͳ� ����� ȯ���� ��� �ݿ��ϴµ� �������� �־����ϴ�. 

Ư�� �������� ��ȣ�� ���� � �־ �׻� �ֽ� ���, �ֽ� ������ �ؼ��ϰ� �־�����
�̸� ����� ��� ��Ƴ��� ���߾��� �̸� �׻� �ƽ����߾��µ���. 

�Ͽ� ������ ���� �̿����� ������ ȯ�濡 �°Բ� ������ �����Դϴ�. 

�̹� ������ �̷��� ������ �������� �̿��� ���� ������ �Ʒ��� ������ ���� ��Ź�帳�ϴ�. 

���� ���� : 2019�� 8�� 31��
���� ���� : 
- ��� �Խ� ��� �� ���� ������ ���� ��Ȯ�ϰ� ���� 
- ȸ���� �޸�ȸ���� �������� �и� ���� �� ��ȣ �ǹ� ��ȭ
- �Խù� �ӽ���ġ �Ǹ� �߰� 

�Ʒ� ������ 2019�� 8�� 31�� ����� �����Դϴ�. 


��� �ű� ��� �ȳ� 

[����]
�� 2 �� (����� ȿ�� �� ����)
�� �� ����� �� ����Ʈ�� ���Ͽ� �����ϰų� Ȥ�� ȸ���鿡�� ���ڿ������� �뺸�����ν� �� ȿ���� �߻��˴ϴ�.
�� ȸ��� ������ �߿��� ������ �߻��� ��� ���� ���� ���� �� ����� ������ ������ �� ������, ����� ����� ���񽺸� ���Ͽ� �����մϴ�.
�� ȸ���� ����� ����� �������� ���� ��� ȸ�� Ż�� ��û�� �� ������, ����� ����� ȿ�� �߻��� ���� 10�� �̳��� ���� ��û�� ���� ���� ��� ����� ���� ���׿� ������ ������ ���ֵ˴ϴ�.
[����]
�� 2 �� (����� ȿ�� �� ����)
�� �� ����� ������ ȸ���� ���� �� �� �ֵ��� ���� ȭ�鿡 �Խ��մϴ�. 
�� ȸ��� �ʿ��ϴٰ� �����Ǵ� ��� �� ����� ������ �� ������, ȸ�簡 ����� ������ ��쿡�� ���� ���� �� ���� ������ ����Ͽ� ��1���� ������� �� ���� ���� 7�� ������ �����մϴ�. �ٸ�, ȸ������ �Ҹ��� ����� ������ ��쿡�� �ּ� ���� ���� 30�� ������ ȸ�� ������ ����� �̸��Ϸ� ���� �����մϴ�. ��, ȸ������ ���� ������ ����� ��쿡 ���Ͽ� �� ���� ������ �����ν� ���� ������ ������ �����մϴ�. 
�� ȸ�簡 ��2�׿� ���� ���� ����� ���� �Ǵ� �����ϸ鼭 ȸ������ ������� �����ϱ��� �ź� �ǻ� ǥ�ø� ���� ������ ������濡 ������ ������ �����Ѵٴ� ������ ���� �Ǵ� �����Ͽ������� ȸ���� ������� �ź��� �ǻ� ǥ�ø� ���� �ƴ��� ��� ȸ���� ���� ����� ������ ������ ���ϴ�. ȸ���� ����� ��� ���׿� �������� ������ ���� �̿��� �ߴ��ϰ� �̿� ����� ������ �� �ֽ��ϴ�



[����]
�ű� �߰� 
[����]
�� 8 �� (���������Ǻ�ȣ)
�� ȸ���� �޸�ȸ������ �з��� ���, �޸� ȸ���ǰ��� ������ �и��Ͽ� �����մϴ�. ȸ��� ȸ���� ���񽺸� �簳�ϰų� ���ɿ� Ư���� ������ �ִ� ��츦 �����ϰ�� �и��� ���� ������ �̿��ϰų� �������� �ʽ��ϴ�.



�� ����� ��� ���׿� �������� ������ ���� �̿��� �ߴ��ϰ� �̿� ����� ������ �� �ֽ��ϴ�. �̷��� ������� �ź��� �ǻ� ǥ�ø� ���� �ƴ��� ��� ��� ���濡 ������ ������ �����մϴ�. 

�����մϴ�.',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (666,'�̺�Ʈ','��� ���� �̺�Ʈ ''2045�� �츮��?','�� ���� ���
STEP1. �Ʒ��� �� ���� ������ Ȯ���Ѵ�

1. 2045�� 1�ΰ��� ������ ���� ���� �õ���?             
2. 2045�� ���������� ������ ���� ���� �õ���?        
3. 2045�� 65�� �̻� ���� ������ ���� ���� �õ���?

STEP2. ������ �����غ��� ������ �����Ѵ�

STEP3. �� �̺�Ʈ�� ���������ϸ� ��÷Ȯ�� UP!

�� �̺�Ʈ �Ⱓ 
2017. 08. 09(��) ~ 08. 18(��) (10�ϰ�) 

����÷�� ��ǥ
2017.08.23(��) / Fresearch Ȩ������ ��ǥ

���̺�Ʈ ��ǰ
 BHC ��� �� �Ķ��̵� �� + �ݶ� 1.25L   (10��)        
 ��Ÿ���� ��ũ ��ī ����Ǫġ�� Tall   (20��)

',SYSDATE,'N');

Insert into NEWS (NEWS_CODE,NEWS_DIVISION,NEWS_SUBJECT,NEWS_CONTENT,NEWS_REGDATE,NEWS_IS_ATTACH) values (222,'����','�����ο� ����ġ ������ "FreSerach" �� ���񽺸� ���� �Ǿ����ϴ�.','�ȳ��ϼ���, FreSerach �Դϴ�.

�����ο� ����ġ ������ "FreSerach" �� ���񽺸� �����մϴ�.

�ش� ���񽺴� ������ ����ġ�� ������Ʈ�ʹ� ����ȭ�Ǿ� ��Ǵ� ���񽺷�, ������ �����Ӱ� �г� ��û�� �Ͽ� ����ġ�� ����ϰ�, ������ �����Ӱ� ����ġ�� ���� ��踦 Ȯ���� �� �ֽ��ϴ�.

��ó�� ����� �ϱ� ���ؼ��� FreSerach  ȸ�� ������ �ʿ��ϰ�, ������ ������ �ʿ� �մϴ�. ���Ȯ���� ������ ���� �ʿ� ���� ���� ������, ȸ�� ���� �� �ڽ��� �����ִ� �о��� ����ġ�� ��ϵǸ� �˸��� ���� �˴ϴ�. 

ȸ���е��� ���� �̿� �ٶ��ϴ�. 

�����մϴ�.',SYSDATE,'N');

-- �����Խ���
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'aaa@google.com', '�ֿ���', '�ڰ�����1', '�ڰԳ���1',  'A0BCDE', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'bbb@google.com', '������', '�ڰ�����2', '�ڰԳ���2',  'B1CDEF', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ccc@google.com', '������', '�ڰ�����3', '�ڰԳ���3',  'C2DEFG', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ddd@google.com', '������', '�ڰ�����4', '�ڰԳ���4',  'D3EFGH', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'eee@google.com', '������', '�ڰ�����5', '�ڰԳ���5',  'E4FGHI', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'fff@google.com', '�ڵ���', '�ڰ�����6', '�ڰԳ���6',  'F5GHIJ', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ggg@google.com', '������', '�ڰ�����7', '�ڰԳ���7',  'G6HIJK', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'hhh@google.com', '�ڻ��', '�ڰ�����8', '�ڰԳ���8',  'H7IJKL', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'iii@google.com', '������', '�ڰ�����9', '�ڰԳ���9',  'I8JKLM', 0, SYSDATE, 'N');
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'jjj@google.com', '�ֿ���', '�ڰ�����10', '�ڰԳ���10', 'J9KLMN', 0, SYSDATE, 'N');

-- ���
insert into REPLY values(REPLY_SEQ.NEXTVAL, 2, 'aaa@google.com', '�ֿ���', '��۳���1', SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 3, 'bbb@google.com', '������', '��۳���2',  SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 4, 'ccc@google.com', '������', '��۳���3', SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 5, 'ddd@google.com', '������', '��۳���4',  SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 6, 'eee@google.com', '������', '��۳���5', SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 7, 'fff@google.com', '�ڵ���', '��۳���6',  SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 8, 'ggg@google.com', '������', '��۳���7', SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 9, 'hhh@google.com', '�ڻ��', '��۳���8', SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 10, 'iii@google.com', '������', '��۳���9',  SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 11, 'jjj@google.com', '�ֿ���', '��۳���10', SYSDATE);


commit;