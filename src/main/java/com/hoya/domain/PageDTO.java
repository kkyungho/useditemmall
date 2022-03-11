package com.hoya.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage; // 시작페이지번호
	private int endPage;  // 끝페이지번호
	
	// 이전 다음 표시여부
	private boolean prev, next;
	
	private int total; // 총 데이터 개수
	
	// 검색정보.(현재페이지번호(pageNum), 게시물출력 개수(amount), 검색종류(type), 검색어(keyword)
	private Criteria cri;

	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;
		
		int pageSize = 10; // 블럭에서 보여줄 페이지번호의 개수
		int endPageInfo = pageSize - 1;
		
		// 테이블의 전체 데이터개수에 영향을 받는다.
		//   this.endPage = (int) (Math.ceil(5 / 10.0)) * pageSize;
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
		this.startPage = this.endPage - endPageInfo;
		
		// 테이블의 전체 데이터개수를 참조하여, 마지막 페이지수를 구한다. 테이블의 실제 데이타수에 따른 endPage 구함.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		
		if(realEnd <= this.endPage)
		{
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		// 데이타가 더 보여질 게 있으면, true
		this.next = this.endPage < realEnd;
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
