package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MypagelistVO {
	private String subj_code;
	private String mb_email;
	private String mb_nick;
	private String subj_nm;
	private String ctgr_nm;
	private Date subj_startdate;
	private Date subj_enddate;
}
