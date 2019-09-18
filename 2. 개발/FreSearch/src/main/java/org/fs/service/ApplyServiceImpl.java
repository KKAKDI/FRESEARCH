package org.fs.service;

import java.util.List;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;
import org.fs.mapper.ApplyMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ApplyServiceImpl implements ApplyService {

	private ApplyMapper mapper;

	@Override
	public ApplyVO registedChk(String mb_email) {
		// 멤버 컬럼의 권한 체크 후 리턴 권한 있으면 패널신청 x
		log.info("chk");

		return mapper.selectEmail(mb_email);
	}

	@Override
	public boolean regist(ApplyVO apply) {


		return mapper.insertApply(apply);	
	}

	@Override
	public String applyChk(String mb_email) {

		return mapper.applyChk(mb_email);
	}

	@Override
	public String atrtChk(String mb_email) {

		return mapper.atrtChk(mb_email);
	}


	@Override
	public int getTotal(Criteria cri) { // 페이징

		log.info("get totalCount");

		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ApplyVO> getList(Criteria cri) {
		log.info("getList......");

		return mapper.getListWithPaging(cri);
	}

	@Transactional
	@Override
	public boolean approval(String mb_email) { // 승인 메소드 (member권한, approvaldate 모두 true일때만 업데이트)
		boolean chk = false;

		log.info("########1mapper.applyChk(mb_email)" + mapper.applyChk(mb_email));
		if(mapper.applyChk(mb_email) != null) {
			log.info("########111111");
			chk = mapper.updateApproval(mb_email);
		}
		if(chk == true) {
			mapper.updateAtrt(mb_email);
			log.info("########2222222");
			return true;
		} else if(chk == false){	
			log.info("########3333333");
			return false;
		}
		log.info("########여기 타면 안됨");
		return false;
	}
}
