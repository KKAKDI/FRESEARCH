package org.fs.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
public class ResearchServiceImpl implements ResearchService{

	@Setter(onMethod_=@Autowired)
	private ResearchMapper mapper;
	
	/*
	@Override
	public List<ResearchVO> listStatus(ResearchVO vo){
		
		return mapper.listStatus(vo);
		
	}*/
	
	@Override
	public ResearchPageDTO list(Criteria cri) {
		return new ResearchPageDTO(
			mapper.list(cri));
	}


	@Override
	public void researchReg(String values)  {
		String email = "admin@fresearch.com"; //수정할 것
		String subName = null;
		String[] block = values.split("/block");		
		SimpleDateFormat dt = new SimpleDateFormat("yyyy/MM/dd");
		
		for(int i=0;i<block.length;i++) {
			log.info("block"+i+": "+block[i]);
			if(i==0) {
				String[] header = block[i].split("#h#");
				ResearchVO headerVO = new ResearchVO();
				for(int j=0;j<header.length;j++) {					
					log.info("header"+j+": "+header[j]);			
					//주제코드 이메일 닉네임 주제명 등록일 시작일 종료일	
					try {
						switch(j) {
							case 0: headerVO.setSubj_nm(header[j]); subName=header[j]; break;
							case 1: headerVO.setCtgr_code(header[j]); break;						
							case 2:	headerVO.setSubj_startdate(dt.parse(header[j]));	 break;
							case 3: headerVO.setSubj_enddate(dt.parse(header[j])); break;
							//case 4:	headerVO.setMb_nick(header[j]); break;
							//case 5:	headerVO.setMb_email(header[j]); email=header[j]; break;
						}
					} catch (ParseException e) {
						log.info(e);
					}					
				}
				//예제 테스트용
				headerVO.setMb_email(email);
				headerVO.setMb_nick("admin");
				mapper.subjReg(headerVO); //DB저장
			}else {
				String item[] = block[i].split("#t#");
				String [][] items = new String[block.length][item.length];
				for(int k=0;k<item.length;k++) {
					items[i][k]=item[k];
					log.info("item["+i+"]["+k+"]: "+items[i][k]);
					//item[i][k] i 0 = 질문 / i n 은 아이템
					//질문코드 1회 생성 아이템 마다 코드 생성
					if(i>0&&k==0) {
						ResearchVO questionVO = new ResearchVO();
						questionVO.setMb_email(email);
						questionVO.setSubj_nm(subName);
						questionVO.setQst_content(items[i][k]);
						questionVO.setQst_type("객관식"); //수정필요
						questionVO.setQst_img("");//수정필요
						questionVO.setQst_url("");//수정필요
						mapper.qstReg(questionVO);
					}else {
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
}
