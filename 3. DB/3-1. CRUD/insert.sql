--ȸ�� (���� - 0:������, 1:�Ϲ�ȸ��)
insert into MEMBER values('bit@naver.com', '��Ʈ','1', '1q2w3e4r!','��Ʈķ��', '��������', 134256854943,01055765483 ,1000000, 100, SYSDATE);
insert into MEMBER values('king@naver.com', 'ŷ' ,'0', '1q2w3e4r!','��', '��������' , 138549345934,01047568345,3000000,80, SYSDATE);
insert into MEMBER values('aaa@google.com','����','0','1q2w3e4r!', '�ֿ���', '��������',111122223333,01011112222,2000000,90,SYSDATE);
insert into MEMBER values('bbb@google.com','����','0','1q2w3e4r!', '������','��������',444455556666,01033334444,2000000,90,SYSDATE);
insert into MEMBER values('ccc@naver.com','����','0','1q2w3e4r!', '������','īī����ũ',124578435892,01012345678,2000000,90,SYSDATE);
insert into MEMBER values('ddd@naver.com','����','0','1q2w3e4r!', '������','�츮����',777788889999,01055556666,2000000,90,SYSDATE);
insert into MEMBER values('eee@daum.net', '����','0','1q2w3e4r!', '�ڵ���','�������',987654321234,01098765432,2000000,90,SYSDATE);
insert into MEMBER values('fff@naver.com', 'ä��' ,'1', '1q2w3e4r!','��ä��', '��������', 139706594945,01043583223, 2000000, 70 , SYSDATE);
insert into MEMBER values('ggg@naver.com','����','0', '1q2w3e4r!','�質��', '��������' , 448689574056,01065943452,800000, 75,  SYSDATE);
insert into MEMBER values('hhh@naver.com', '����' ,'1', '1q2w3e4r!','�ֿ���', '��������', 448658095464,01086747432, 1200000, 85 , SYSDATE);
insert into MEMBER values('iii@google.com','��ȣ' ,'0', '1q2w3e4r!','�ż�ȣ', '��������', 445848794033,01032656473, 600000, 95 ,   SYSDATE);
insert into MEMBER values('jjj@google.com','����' ,'1', '1q2w3e4r!','������', 'īī����ũ', 123869540943,01095663734,800000, 60 , SYSDATE);
insert into MEMBER values('kkk@daum.net','����' ,'0', '1q2w3e4r!','������', 'īī����ũ', 124669940345,01067743822,1000000, 75,   SYSDATE);
insert into MEMBER values('lll@daum.net' ,'����','1', '1q2w3e4r!','������', '�츮����', 774583492524,01054783432,1500000, 80, SYSDATE);
insert into MEMBER values('mmm@daum.net', 'ȣ��','0', '1q2w3e4r!','��ȣ��', '�츮����',772347543892,01027374234, 2000000, 90 ,  SYSDATE);

-- ȸ�� ���� ����
insert into MONEY_MEMBER values('�ֿ���', '01011112222', '��������', '111122223333', '�ֿ���');
insert into MONEY_MEMBER values('������', '01033334444', '��������', '444455556666', '������');
insert into MONEY_MEMBER values('������', '01012345678', 'īī����ũ', '123456789012', '������');
insert into MONEY_MEMBER values('������', '01055556666', '�츮����', '777788889999', '������');
insert into MONEY_MEMBER values('�ڵ���', '01098765432', '�������', '987654321234', '�ڵ���');


--��ǰ (������� - 0:�Ǹ���, 1:�ŷ���, 2:�ŷ��Ϸ� / ��ǰ���� - 0:�˴ϴ�, 1:��ϴ�)
--�μ��˴ϴ�
insert into PRODUCT values(1, 'bit@naver.com', '��Ʈ', 100, '�Ǹ���', null, '��Ÿ', '�˴ϴ�', 500000, '�μ� �˴ϴ�', '�帣�� �μ� �����帮���� �˴ϴ�.', 0, 0, 'iPad.jpg', 'iPad_copy01.jpg',SYSDATE); 
--���ŸӸ� �˴ϴ�
insert into PRODUCT values(2, 'king@naver.com', 'ŷ', 80, '�Ǹ���', null, '��Ÿ', '�˴ϴ�', 13000, '���ŸӸ� �˴ϴ�', '���ŸӸ� �ʿ��Ͻź� �簡����.',1, 0, 'handifan.jpg', 'handifan_copy02.jpg',SYSDATE);
--��ȥ�˴ϴ�
insert into PRODUCT values(3, 'aaa@google.com','����', 90, '�Ǹ���', null, '��Ÿ', '�˴ϴ�', 700000, '��ȥ �˴ϴ�', 'Ȥ�� �������� �����ҹݵ� �̽ź� ��Ű���', 0, 0, 'gram.jpg', 'gram_copy03.jpg',SYSDATE);
--������ �˴ϴ�
insert into PRODUCT values(4, 'bbb@google.com','����', 90, '�Ǹ���', null, '��Ÿ', '�˴ϴ�', 600000, '������ �˴ϴ�', '���亴�� ���� �����.', 0, 0, 'gtx1080.jpg', 'gtx1080_copy04.jpg',SYSDATE);
--���� �˴ϴ�
insert into PRODUCT values(5, 'ccc@naver.com','����', 90, '�Ǹ���', null, '��Ÿ', '�˴ϴ�', 300000, '���� �˴ϴ�', '��â ���Ե� �� ���� �״� �ʿ����� �����ʴϱ�', 1, 0, 'cap.jpg', 'cap_copy05.jpg', SYSDATE);
--����� ��ϴ� 
insert into PRODUCT values(6, 'ddd@naver.com','����', 90, '������', null, '��Ÿ', '��ϴ�', 250000, '����� ��ϴ�', '�뵿�� �ʿ��մϴ� ���ϰ� ���ؿ�', 1, 0, 'monitor.jpg', 'monitor_copy06.jpg', SYSDATE);
--���� ��ϴ�
insert into PRODUCT values(7, 'eee@daum.net', '����', 90, '������', null, '��Ÿ', '��ϴ�', 150000, '���� ��ϴ�','�θ�Բ� "�� �˾Ƽ� �Ѵٰ�" 5ȸ �̻� �غ��ź�.', 0, 0, 'nike.jpg', 'nike_copy07.jpg', SYSDATE);
--�ָ� ��ϴ�
insert into PRODUCT values(8, 'fff@naver.com','ä��',70, '������', null, '��Ÿ', '��ϴ�', 20000, '�ָ� ��ϴ�', '���� ������ �ؼ� �ָ��� �Ҿ���Ƚ��ϴ� Ȥ�� ���� �ָ� �����ź�.', 1, 0, 'cupbab.jpg', 'cupbab_copy08.jpg',SYSDATE);
--�Ӹ�ī�� ��ϴ�
insert into PRODUCT values(9, 'ggg@naver.com','����',75, '������', null,   '��Ÿ', '��ϴ�', 750000, '�Ӹ�ī�� ��ϴ�', '�ڶ󳪶� �Ӹ��Ӹ�',0, 0, 'series9.jpg', 'series9_copy09.jpg',SYSDATE);
--���� ���� ��ϴ�
insert into PRODUCT values(10,'hhh@naver.com', '����',85, '������', null,  '��Ÿ', '��ϴ�', 20000, '���� ���� ��ϴ�', '���� ���� �Ȼ�ϴ�.', 1, 0, 'book.jpg', 'book_copy10.jpg',SYSDATE); 
--�ָ� �˴ϴ�
insert into PRODUCT values(11,'iii@google.com','��ȣ',95, '�Ǹ���', null,  '��Ÿ', '�˴ϴ�', 100000, '�ָ� �˴ϴ�', '���� 24�ð� �ٹ��� �Դϴ� �ָ� �ʹ� ����.', 1, 0, 'eleccigr.jpg', 'eleccigr_copy11.jpg',SYSDATE);
--���ŸӸ� �˴ϴ�
insert into PRODUCT values(12,'jjj@google.com','����',60, '�Ǹ���', null,   '��Ÿ', '�˴ϴ�', 500000, '���ŸӸ� ��ϴ�', '�����б� ������ 19�� ���� ������Դϴ� �������� ���� ���ŸӸ��� �����ϴ� ', 0, 0, 'gucci.jpg', 'gucci_copy12.jpg',SYSDATE);
--������ ��ϴ�
insert into PRODUCT values(13,'kkk@daum.net','����',75, '������', null,   '��Ÿ', '��ϴ�', 300000, '������ ��ϴ�', '��̰� ��ô�', 0, 0, 'luisvit.jpg', 'luisvit_copy13.jpg',SYSDATE); 
--�뷡�ָӴ� �˴ϴ�
insert into PRODUCT values(14,'lll@daum.net','����',80, '�Ǹ���', null,  '��Ÿ', '�˴ϴ�', 140000, '�뷡�ָӴ� �˴ϴ�','�̽��մϴ� �뷡�ָӴ�', 1, 0, 'airpod.jpg', 'airpod_copy14.jpg',SYSDATE);
-- �� �߻�ϴ�
insert into PRODUCT values(15,'mmm@daum.net', 'ȣ��',90,  '������', null,  '��Ÿ',  '��ϴ�', 70000, '�� �� ��ϴ�', '�ƽðھ��?', 1, 0, 'BTspeaker.jpg', 'BTspeaker_copy15.jpg',SYSDATE);


--����
insert into PAYMENT values(1, 1, '��Ʈ', '��������', 134256854943, '����', null, 123456789012, 500000, 500000, SYSDATE, '����� ��õ�� ������ 29�� 22 �»����� 502ȣ' , '����Ȯ��', '�Ǹ�Ȯ��');
insert into PAYMENT values(2, 2, 'ŷ','��������', 138549345934, '����',null, null, 13000, 13000, SYSDATE, 'ȭ� 5�� �ⱸ', '����Ȯ��', '�Ǹ�Ȯ��');
insert into PAYMENT values(3, 3, '����','��������', 111122223333, '�ÿ�',null, 777788889999, 700000, 700000, SYSDATE, '����뿪', '���ž���', '�Ǹ�Ȯ��');
insert into PAYMENT values(4, 4, '����','��������', 444455556666, 'ä��',null, 987654321234, 600000, 600000, SYSDATE, '��Ʈķ��', '����Ȯ��', '�Ǹž���');

--�ŷ����
insert into HISTORY values(1, '��Ʈ', 1342568574943, '����', 123456789012, 500000, SYSDATE);
insert into HISTORY values(2, 'ŷ', 138549345934, '����', null, 13000, SYSDATE);

--��ǰ���
insert into P_REPLY values(1, 1, 'bit@naver.com', '��Ʈ', '�����е� 3���� ���ΰ����Ѱ���?', 'iPad.jpg', 'iPad_copy01.jpg', SYSDATE);
insert into P_REPLY values(2, 3, 'aaa@google.com', '����', '���ŷ��ϸ� ���� ���ֽó���?', 'gram.jpg', 'gram_copy03.jpg', SYSDATE);


--�Ű���
insert into REPORT values(1,'�г��� ���Ĵ� ��� �Ű�', '�� ��� �׳� �����̶� ��⸦ ���߽��ϴ�', 'a.jpg', 'a_copy.jpg', 'ddd@naver.com', '����', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.
', '���Ű�');
insert into REPORT values(2, '���� << �̴� ��� �Ű�', '120����¥�� 10������ �� ���̵�', 'b.jpg', 'b_copy.jpg', 'ccc@naver.com', '����', SYSDATE, 'ó���Ϸ�', 'ȯ����ġ�� ��Ƚ��ϴ�', '���Ű�');
insert into REPORT values(3, '����Ʈ�� �����̴°� ���ƿ�..', '����Ʈ �̵��Ҷ� ���� ���� �ֳ׿�', 'c.jpg', 'c_copy.jpg', 'ccc@naver.com', '����', SYSDATE, 'ó���Ϸ�', '������ �ǰ��� �ݿ��Ͽ� ���� ���ϳ��� �����ϵ��� �ϰڽ��ϴ�.', '����Ű�');
insert into REPORT values(4, '�г��� ���� ��»�� �����Ź�', '�̺� �߰��� ����� �Ǵٰ� �ø��˳׿� Ȯ�ιٶ��ϴ�..', 'd.jpg', 'd_copy.jpg', 'bbb@google.com', '����', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.', '������ǰ�Ű�');
insert into REPORT values(5, '��ۺ� ���!!', '���ǰ� ������ ��ۺ� ��û �÷��� �ø��»�� ���ƿ� ã�Ƽ� ���� �����ּ���', 'e.jpg', 'e_copy.jpg', 'king@naver.com', 'ŷ', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.', '���Ű�');
insert into REPORT values(6, '�߰�å ����;;', '�г��� ��Ʈ �̺в� �߰�å �����ߴµ� DBå ��µ� �ڹٰ��� å ��ۿ��� ����������', 'f.jpg', 'f_copy.jpg', 'kkk@daum.net', '����', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.', '���Ű�');
insert into REPORT values(7, '�����Խ��ǿ� �����', '�ڰԿ� ���ڱ� ������� �������µ� ó���� ���ּ��� ', 'g.jpg', 'g_copy.jpg', 'iii@google.com', '��ȣ', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.', '����Ű�');
insert into REPORT values(8, '�г� ŷ ��� �Ű�', '��ǰ ����� �����ʴ� ��ǰ�� ������ ��⸦ ���߽��ϴ�', 'a.jpg', 'a_copy.jpg', 'eee@daum.net', '����', SYSDATE, 'ó����', '�Ű� ó�� �� �̸�, �������� ���� �亯 �����Դϴ�.', '���Ű�');
insert into REPORT values(9, '��� �Ű�', ' 6/5�� �ŷ��ߴ��� ��ǰ�� ������ ������ �ʽ��ϴ�. ', 'p.jpg', 'p_copy.jpg', 'ggg@naver.com', '����', SYSDATE, 'ó���Ϸ�', '�ش� ȸ���� ���� �ŷ� ������ �Բ� ������ ȯ����ġ�� �Ϸ� �Ǿ����ϴ�.', '���Ű�');
--���ҽ� ( ���� - 0:��������, 1:�̺�Ʈ)
insert into NEWS values(1, 'aaa@google.com', '����', '��� ��ó ���', '���� �� �ŷ� �� ��⸦ ���� ��� ������ �Ű� �ٶ��ϴ�', 0, SYSDATE, '��������');
insert into NEWS values(2, 'bbb@google.com', '����', 'ù ���� �� ������ ���� �̺�Ʈ', 'ù ���� �� �����Ḧ �������ִ� �̺�Ʈ�� �����մϴ� ���� �����ϼ���', 0, SYSDATE, '�̺�Ʈ');
insert into NEWS values(3, 'ccc@naver.com', '����' ,'�ŷ����', 'TAKE A LOOK �� ���ŷ��� �̸� �����ڿ��� ���� �Աݹ޾� �����ڰ� �ŷ��� Ȯ���ϰ� üũ�Ͽ� Ȯ���� �Ǹ� �Ǹ��ڿ��� ���� �ԱݵǴ� �����ŷ� �ý����Դϴ�', 0, SYSDATE, '��������');
insert into NEWS values(4,'ddd@naver.com', '����', '���°���','���� ������ �߰�ŷ����� TAKE A LOOK �� �����Ͽ����ϴ� �����Ӱ� ������ �ŷ��� ���� �ٷ� �����غ�����',0, SYSDATE, '��������');
insert into NEWS values(5,'eee@daum.net', '����','�ŷڵ��ý���','�߰�ŷ� ���� TAKE A LOOK�� �ŷڵ� �ý����� �̿��Ͽ� �Ǹ��ڵ��� �ŷڵ��� üũ�Ͽ� ���������μ� �����ڵ��� �߰�ŷ��� ���� �δ㰨�� ���� ���ҽ��׽��ϴ�',0, SYSDATE, '��������');
insert into NEWS values(6,'aaa@google.com', '����','����Ʈ ����','ù ���Ž� ���űݾ��� 1%�� ����Ʈ�� ���� �� �帳�ϴ�', 0, SYSDATE, '�̺�Ʈ');
insert into NEWS values(7,'bbb@google.com', '����','��ۺ� ����','�̺�Ʈ�� ��÷�ǽ� 10���� ȸ�����Դ� ������ ��ǰ �� ���ϴ� ��ǰ�� ��ۺ� 1ȸ �����ص帳�ϴ�', 0, SYSDATE, '�̺�Ʈ');
insert into NEWS values(8, 'ccc@naver.com', '����','�����ŷ�','�����ŷ��� �ŷڵ��ý��ۿ� �ǰ� �ŷڵ��� ���� ���ҵǸ� ���� ��ǰ�� �ǸŸ� �������� �� ������ �˷��帳�ϴ�',0, SYSDATE, '��������');
insert into NEWS values(9,'ddd@naver.com', '����','�ŷ��ȳ�','TAKE A LOOK �� ��ǰ�� �����̳� ��Ÿ �Ǹ����� ������Ȧ�� ������ �Ǵ� �κп� ���ؼ� �����ص帮�� ������ �˷��帳�ϴ� ', 0, SYSDATE, '��������');
insert into NEWS values(10,'eee@daum.net', '����','TAKE A LOOK �� ���','�̺�Ʈ�� ��÷�ǽ� �Ѻв��� �߰����Ϳ��� ����ϽǼ� �ִ� 50000����Ʈ�� ������ �帳�ϴ�', 0, SYSDATE, '�̺�Ʈ');

--�����Խ���
insert into BOARD values(1, 'aaa@google.com', '����', '��S10 5G', '�Ե� ��� ��S10 5G ���Դ��� ������?', 'aa.jpg', 'aa_copy01.jpg', 0, 0, SYSDATE, 0);
insert into BOARD values(2, 'bbb@google.com', '����', '���̽� û�ұ�', '���̽� û�ұ� �߰��� �ʹ� ��δ���...', 'bb.jpg', 'bb_copy01.jpg', 0, 0, SYSDATE, 0);
insert into BOARD values(3, 'ccc@naver.com', '����', '������', '������1�̶� ������2 ���� ���� ���̳�?', null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(4, 'ddd@naver.com', '����', '�׷�','�׷� 30������ �ΰ� �����մϴ�' , null, null,0, 0, SYSDATE, 0);
insert into BOARD values(5, 'eee@daum.net', '����','����ũž','��ǻ�� ��� �ΰ� �����մϴ� �����ּ���',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(6, 'fff@naver.com', 'ä��','�Ź�', '�Ź��� �߰�� �Ǹ� ���ϳ���?',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(7, 'ggg@naver.com', '����','���ٵ�', '���ٵ� ����ġ ���� �� ������ ���ΰ���?',null, null,0, 0, SYSDATE, 0);
insert into BOARD values(8, 'hhh@naver.com', '����','ǲ��ȭ', 'ǲ��ȭ �ΰ� �˴ϴ� �����ּ���',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(9, 'iii@google.com', '��ȣ','���ڴ��', '���ڴ�� �Ⱦƿ� ���������ֽ��ϴ� �����ּ���',null, null, 0, 0, SYSDATE, 0);
insert into BOARD values(10, 'jjj@google.com', '����','��Ʈ��', '���� ������ ���� ��Ʈ�� ������ �����ֳ���?',null, null, 0, 0, SYSDATE, 0);

--�ڰԴ��
insert into B_REPLY values(1, 1, 'bbb@google.com', '����', '������S10�̻� �ٵ� ������ 5G�� �߾���������', SYSDATE, 'aaa.png', 'aaa_copy01.png', 0, 0,'bbb@naver.com', '����');
insert into B_REPLY values(2, 2, 'iii@google.com', '��ȣ',  '�׳� �߰�� ��ٿ� ���ŷ� ��°� �ξ� �̵��Դϴ�', SYSDATE, 'bbb.png', 'bbb_copy01.png', 0, 0, 'iii@google.com', '��ȣ');
insert into B_REPLY values(3, 3, 'hhh@naver.com', '����', '������1 ��ٿ� ������2 ��°� �ξ� �̵���', SYSDATE, 'ccc.png', 'ccc_copy01.png', 0, 0, 'hhh@naver.com', '����');

commit;