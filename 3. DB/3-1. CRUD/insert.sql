-- ȸ��
insert into MEMBER values('aaa@google.com', 'A0000001', '�ֿ���', 'pw01', '����Ư���� ������ ȭ�', 19890101, '��', '01011111111', '�г�', 'Y', SYSDATE);
insert into MEMBER values('bbb@google.com', 'A0000002', '������', 'pw02', '����Ư���� ������ ��ġ���12�� 7', 19900202, '��', '01022222222', '�г�', 'Y', SYSDATE);
insert into MEMBER values('ccc@google.com', 'A0000003', '������', 'pw03', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19890303, '��', '01033333333', '�Ϲ�', 'N', SYSDATE);
insert into MEMBER values('ddd@google.com', 'A0000004', '������', 'pw04', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19890404, '��', '01044444444', '�Ϲ�', 'N', SYSDATE);
insert into MEMBER values('eee@google.com', 'A0000005', '������', 'pw05', '��⵵ ���� ������ ��û�ձ� 2 ����û ����', 19910505, '��', '01055555555', '�г�', 'Y', SYSDATE);
insert into MEMBER values('fff@google.com', 'A0000006', '�ڵ���', 'pw06', '�λ걤���� �λ����� ���Ϸ� 295', 19920606, '��', '01077777777', '�Ϲ�', 'N', SYSDATE);
insert into MEMBER values('ggg@google.com', 'A0000007', '������', 'pw07', '��õ������ ������ ������ 29 ��õ������û', 19910707, '��', '01088888888', '�Ϲ�', 'N', SYSDATE);
insert into MEMBER values('hhh@google.com', 'A0000008', '�ڻ��', 'pw08', '��õ������ ������ ������ 29 ��õ������û', 19960808, '��', '01099999999', '�г�', 'Y', SYSDATE);
insert into MEMBER values('iii@google.com', 'A0000009', '������', 'pw09', '��õ������ ������ ������ 29 ��õ������û', 19930909, '��', '01012345678', '�г�', 'Y', SYSDATE);
insert into MEMBER values('jjj@google.com', 'A0000010', '�ֿ���', 'pw10', '��õ������ ������ ������ 29 ��õ������û', 19901010, '��', '01098765432', '�Ϲ�', 'N', SYSDATE);

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

-- ����
insert into SUBJECT values('C0000001', 'A0000001', 'aaa@google.com', '�ֿ���', '����1', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000002', 'B0000001', 'bbb@google.com', '������', '����2', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000003', 'C0000001', 'ccc@google.com', '������', '����3', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000004', 'D0000001', 'ddd@google.com', '������', '����4', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000005', 'E0000001', 'eee@google.com', '������', '����5', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000006', 'F0000001', 'fff@google.com', '�ڵ���', '����6', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000007', 'G0000001', 'ggg@google.com', '������', '����7', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000008', 'H0000001', 'hhh@google.com', '�ڻ��', '����8', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000009', 'I0000001', 'iii@google.com', '������', '����9', SYSDATE, SYSDATE, SYSDATE);
insert into SUBJECT values('C0000010', 'J0000001', 'jjj@google.com', '�ֿ���', '����10', SYSDATE, SYSDATE, SYSDATE);

-- ����
insert into QUESTION values('D0000001', 'C0000001', '����1', '������', null, null, SYSDATE);
insert into QUESTION values('D0000002', 'C0000002', '����2', '�ְ���', null, null, SYSDATE);
insert into QUESTION values('D0000003', 'C0000003', '����3', '������', null, null, SYSDATE);
insert into QUESTION values('D0000004', 'C0000004', '����4', '������', null, null, SYSDATE);
insert into QUESTION values('D0000005', 'C0000005', '����5', '�ְ���', null, null, SYSDATE);
insert into QUESTION values('D0000006', 'C0000006', '����6', '������', null, null, SYSDATE);
insert into QUESTION values('D0000007', 'C0000007', '����7', '�ְ���', null, null, SYSDATE);
insert into QUESTION values('D0000008', 'C0000008', '����8', '�ְ���', null, null, SYSDATE);
insert into QUESTION values('D0000009', 'C0000009', '����9', '������', null, null, SYSDATE);
insert into QUESTION values('D0000010', 'C0000010', '����10', '�ְ���', null, null, SYSDATE);

-- ������
insert into ITEM values('E0000001', 'D0000001', '�����۳���1', null, SYSDATE);
insert into ITEM values('E0000002', 'D0000002', '�����۳���2', null, SYSDATE);
insert into ITEM values('E0000003', 'D0000003', '�����۳���3', null, SYSDATE);
insert into ITEM values('E0000004', 'D0000004', '�����۳���4', null, SYSDATE);
insert into ITEM values('E0000005', 'D0000005', '�����۳���5', null, SYSDATE);
insert into ITEM values('E0000006', 'D0000006', '�����۳���6', null, SYSDATE);
insert into ITEM values('E0000007', 'D0000007', '�����۳���7', null, SYSDATE);
insert into ITEM values('E0000008', 'D0000008', '�����۳���8', null, SYSDATE);
insert into ITEM values('E0000009', 'D0000009', '�����۳���9', null, SYSDATE);
insert into ITEM values('E0000010', 'D0000010', '�����۳���10', null, SYSDATE);

-- �亯
insert into ANSWER values('F0000001', 'E0000001', 'aaa@google.com', '�ֿ���', '�亯����1', SYSDATE);
insert into ANSWER values('F0000002', 'E0000002', 'bbb@google.com', '������', '�亯����2', SYSDATE);
insert into ANSWER values('F0000003', 'E0000003', 'ccc@google.com', '������', '�亯����3', SYSDATE);
insert into ANSWER values('F0000004', 'E0000004', 'ddd@google.com', '������', '�亯����4', SYSDATE);
insert into ANSWER values('F0000005', 'E0000005', 'eee@google.com', '������', '�亯����5', SYSDATE);
insert into ANSWER values('F0000006', 'E0000006', 'fff@google.com', '�ڵ���', '�亯����6', SYSDATE);
insert into ANSWER values('F0000007', 'E0000007', 'ggg@google.com', '������', '�亯����7', SYSDATE);
insert into ANSWER values('F0000008', 'E0000008', 'hhh@google.com', '�ڻ��', '�亯����8', SYSDATE);
insert into ANSWER values('F0000009', 'E0000009', 'iii@google.com', '������', '�亯����9', SYSDATE);
insert into ANSWER values('F0000010', 'E0000010', 'jjj@google.com', '�ֿ���', '�亯����10', SYSDATE);

-- �˸�
insert into NOTICE values('G0000001', 'aaa@google.com', 'A0000001', '�˸��޽���1', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000002', 'bbb@google.com', 'A0000002', '�˸��޽���2', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000003', 'ccc@google.com', 'A0000003', '�˸��޽���3', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000004', 'ddd@google.com', 'A0000004', '�˸��޽���4', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000005', 'eee@google.com', 'A0000005', '�˸��޽���5', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000006', 'fff@google.com', 'A0000006', '�˸��޽���6', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000007', 'ggg@google.com', 'A0000007', '�˸��޽���7', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000008', 'hhh@google.com', 'A0000008', '�˸��޽���8', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000009', 'iii@google.com', 'A0000009', '�˸��޽���9', SYSDATE, SYSDATE, SYSDATE);
insert into NOTICE values('G0000010', 'jjj@google.com', 'A0000010', '�˸��޽���10', SYSDATE, SYSDATE, SYSDATE);

-- ���ҽ�
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����1', '���ҽĳ���1', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����2', '���ҽĳ���2', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '�̺�Ʈ', '���ҽ�����3', '���ҽĳ���3', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '�̺�Ʈ', '���ҽ�����4', '���ҽĳ���4', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����5', '���ҽĳ���5', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '�̺�Ʈ', '���ҽ�����6', '���ҽĳ���6', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����7', '���ҽĳ���7', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '�̺�Ʈ', '���ҽ�����8', '���ҽĳ���8', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����9', '���ҽĳ���9', 0, SYSDATE);
insert into NEWS values(NEWS_SEQ.NEXTVAL, '����', '���ҽ�����10', '���ҽĳ���10', 0, SYSDATE);

-- �����Խ���
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'aaa@google.com', '�ֿ���', '�ڰ�����1', '�ڰԳ���1', 0, 0, 0, 'A0BCDE', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'bbb@google.com', '������', '�ڰ�����2', '�ڰԳ���2', 0, 0, 0, 'B1CDEF', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ccc@google.com', '������', '�ڰ�����3', '�ڰԳ���3', 0, 0, 0, 'C2DEFG', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ddd@google.com', '������', '�ڰ�����4', '�ڰԳ���4', 0, 0, 0, 'D3EFGH', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'eee@google.com', '������', '�ڰ�����5', '�ڰԳ���5', 0, 0, 0, 'E4FGHI', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'fff@google.com', '�ڵ���', '�ڰ�����6', '�ڰԳ���6', 0, 0, 0, 'F5GHIJ', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'ggg@google.com', '������', '�ڰ�����7', '�ڰԳ���7', 0, 0, 0, 'G6HIJK', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'hhh@google.com', '�ڻ��', '�ڰ�����8', '�ڰԳ���8', 0, 0, 0, 'H7IJKL', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'iii@google.com', '������', '�ڰ�����9', '�ڰԳ���9', 0, 0, 0, 'I8JKLM', 0, SYSDATE);
insert into BOARD values(BOARD_SEQ.NEXTVAL, 'jjj@google.com', '�ֿ���', '�ڰ�����10', '�ڰԳ���10', 0, 0, 0, 'J9KLMN', 0, SYSDATE);

-- ���
insert into REPLY values(REPLY_SEQ.NEXTVAL, 2, 'aaa@google.com', '�ֿ���', '��۳���1', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 3, 'bbb@google.com', '������', '��۳���2', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 4, 'ccc@google.com', '������', '��۳���3', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 5, 'ddd@google.com', '������', '��۳���4', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 6, 'eee@google.com', '������', '��۳���5', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 7, 'fff@google.com', '�ڵ���', '��۳���6', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 8, 'ggg@google.com', '������', '��۳���7', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 9, 'hhh@google.com', '�ڻ��', '��۳���8', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 10, 'iii@google.com', '������', '��۳���9', 0, 0, SYSDATE);
insert into REPLY values(REPLY_SEQ.NEXTVAL, 11, 'jjj@google.com', '�ֿ���', '��۳���10', 0, 0, SYSDATE);


commit;