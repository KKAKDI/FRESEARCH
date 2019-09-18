package org.fs.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;	//페이지 번호
	private int amount;		//페이지에 표시되는 게시글의 갯수
	private String type;	//페이지 검색 타입
	private String keyword;	//페이지 검색 키워드

	public Criteria() {
		this(1,10);	// 한 페이지에 10개의 게시글이 표시된다
	}
	public Criteria(int pageNum, int amount) {

		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {	//검색조건이 각 글자별로 되어있으므로 검색조건을 배열로 만들어서 한번에 처리

		return type == null? new String[] {}: type.split("");
	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}
}
