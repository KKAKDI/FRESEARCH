package org.fs.domain;

import java.util.Date;
import lombok.Data;

@Data
public class AnswerVO {
	
	//�亯 
	private String asw_code; //�亯�ڵ�
	private String item_code; //�������ڵ�
	private String mb_email; //�亯�� �̸���
	private String mb_nick; //�亯�� �г���
	private String asw_content; //�亯 ����
	private Date asw_regdate; //�亯 �����
}
