package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.AnswerVO;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchVO;

public interface ResearchMapper {

	public List<ResearchVO> list(	@Param("cri") Criteria cri,	@Param("research") String research); // 설문 목록
	public int getCountBySubjCode(	@Param("research") String research);							 // 설문 갯수
	public int subjReg(ResearchVO vo);																 // 질문 등록
	public int qstReg(ResearchVO vo);																 // 답변 등록
	public int itemReg(ResearchVO vo);																 // 아이템 등록
	public List<ResearchVO> researchGet(String subj_code);											 
	public int answerReg(AnswerVO vo);
	public int researchDelete(String subj_code);
}
