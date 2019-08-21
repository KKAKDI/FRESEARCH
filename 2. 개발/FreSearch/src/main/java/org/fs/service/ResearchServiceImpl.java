package org.fs.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.fs.domain.AnswerVO;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;
import org.fs.mapper.ResearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ResearchServiceImpl implements ResearchService {

	@Setter(onMethod_ = @Autowired)
	private ResearchMapper mapper;

	/*
	 * @Override public List<ResearchVO> listStatus(ResearchVO vo){
	 * 
	 * return mapper.listStatus(vo);
	 * 
	 * }
	 */

	@Override
	public ResearchPageDTO list(Criteria cri, String research) {
		return new ResearchPageDTO(mapper.getCountBySubjCode(research), mapper.list(cri, research));
	}

	@Override
	public void researchReg(String values) {
		String email = "admin@fresearch.com"; 
		String subName = null;
		String[] block = values.split("/block");
		SimpleDateFormat dt = new SimpleDateFormat("yyyy/MM/dd");

		for (int i = 0; i < block.length; i++) {
			log.info("block" + i + ": " + block[i]);
			if (i == 0) {
				String[] header = block[i].split("#h#");
				ResearchVO headerVO = new ResearchVO();
				for (int j = 0; j < header.length; j++) {
					log.info("header" + j + ": " + header[j]);
					try {
						switch (j) {
						case 0:
							headerVO.setSubj_nm(header[j]);
							subName = header[j];
							break;
						case 1:
							headerVO.setCtgr_code(header[j]);
							break;
						case 2:
							headerVO.setSubj_startdate(dt.parse(header[j]));
							break;
						case 3:
							headerVO.setSubj_enddate(dt.parse(header[j]));
							break;
						}
					} catch (ParseException e) {
						log.info(e);
					}
				}
				headerVO.setMb_email(email);
				headerVO.setMb_nick("admin");
				mapper.subjReg(headerVO); 
			} else {
				String item[] = block[i].split("#t#");
				String[][] items = new String[block.length][item.length];
				for (int k = 0; k < item.length; k++) {
					items[i][k] = item[k];
					log.info("item[" + i + "][" + k + "]: " + items[i][k]);
					ResearchVO questionVO = new ResearchVO();
					if(i>0 && k==1){
						questionVO.setMb_email(email);
						questionVO.setSubj_nm(subName);
						questionVO.setQst_content(items[i][0]);						
						questionVO.setQst_img("");
						questionVO.setQst_url("");			
						questionVO.setQst_type(items[i][k]); 
						mapper.qstReg(questionVO);
					}else if(k>1){
						ResearchVO itemVO = new ResearchVO();
						itemVO.setMb_email(email);
						itemVO.setSubj_nm(subName);
						itemVO.setItem_content(items[i][k]);
						itemVO.setItem_img("");
						itemVO.setRowNum(i);
						mapper.itemReg(itemVO);
					}
				}
			}
		}
	}

	@Override
	public List<ResearchVO> researchContent(String subj_code) {
		List<ResearchVO> content = mapper.researchGet(subj_code);
		return content;
	}

	@Override
	public void researchAnswer(String values) {
		String[] email = values.split("#email#");
		for (int i = 0; i < email.length; i++) {
			AnswerVO answer = new AnswerVO();
			log.info("email[" + i + "] : " + email[i]);			
			if(i>0){
				String[] nick = email[i].split("#nick#");
				for (int j = 0; j < nick.length; j++) {
					log.info("nick[" + j + "] : " + nick[j]);
					if(j==0) {
						answer.setMb_nick(nick[0]);					
						answer.setMb_email(email[0]);			
					}
					else{
						String[] content = nick[j].split("#value#");
						for (int k = 0; k < content.length; k++) {
							String[] value = content[k].split("#code#");
							log.info("content[" + k + "] : " + content[k]);							
							log.info("code: " + value[0]);
							log.info("value: " + value[1]);
							answer.setItem_code(value[0]);
							answer.setAsw_content(value[1]);
							log.info(answer);
							//mapper 호출
							mapper.answerReg(answer);
						}
					}					
				}
			}
		}
	}
}
