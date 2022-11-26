package criTest; // DTO(Data Transfer Object)의 특성을 가지고 있음

import lombok.Getter;
import lombok.ToString;

// Getter, toString / Setter는 검증이 필요하기 때문에 직접 생성
@Getter
@ToString
public class Criteria {

	private int rowsPerPage; // 1 Page당 출력할 Row 개수
	private int currPage; // 현재 출력(요청 받은) Page
	private int sno; // Start RowNo.
	private int eno; 
	// int의 default = 0
	
	
	 // 1) 생성자를 이용해서 기본값 초기화 
	public Criteria() {
		this.rowsPerPage = 20;
		this.currPage = 1;
	} // 초깃값
	
	
	// 2) setCurrPage : 요청받은(출력할) PageNo set
	public void setCurrPage(int currPage) {
		if (currPage > 1)
			this.currPage = currPage;
		else
			this.currPage = 1;
	} // setCurrPage
	
	
	// 3) setRowsPerPage
	// => 1페이지당 출력할 Row(Record, 튜플) 개수 확인
	// => 제한조건 점검 (50개까지만 허용)
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage > 20 && rowsPerPage <= 50)
			this.rowsPerPage = rowsPerPage;
		else
			this.rowsPerPage = 20; // 초깃값
	} // setRowsPerPage
	
	
	// 4) setSnoEno : sno, eno 계산
	// => currPage, rowsPerPage를 이용해 계산
	// => MySQL 검색조건 : limit sno, n -> sno 제외하고 그 다음부터 n개
	public void setSnoEno() {
		if (this.sno < 1) // sno가 1보다 작은 경우(맨 처음 초깃값(0)일 때)
			this.sno = 1; // sno에 1을 넣어준다
		
		this.sno = (this.currPage - 1) * this.rowsPerPage; // MySQL 적합
		this.eno = this.sno + this.rowsPerPage - 1; 
	} // setSnoEno
	
} // class
