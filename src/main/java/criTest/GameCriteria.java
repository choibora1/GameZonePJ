package criTest;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class GameCriteria {
	private int rowsPerPage; // 페이지당 출력 할 Row 갯수
	private int currPage; // 현재 페이지 (출력할 페이지)
	private int sno; // Start RowNo
	private int eno;

	// 1) 필요한 초기값은 생성자로 초기화
	public GameCriteria() {
		this.rowsPerPage = 12;
		this.currPage = 1;
	}

	// 2) setCurrPage : 요청받은(출력할) PageNo set
	public void setCurrPage(int currPage) {
		if (currPage > 1)
			this.currPage = currPage;
		else
			this.currPage = 1;
	}
	// 3) setRowsPerPage
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage > 12 && rowsPerPage <= 50)
			this.rowsPerPage = rowsPerPage;
		else
			this.rowsPerPage = 12;
	}

	// 4) setSnoEno : sno, eno 계산
	public void setSnoEno() {
		if (this.sno < 1)
			this.sno = 1;
		this.sno = (this.currPage - 1) * this.rowsPerPage; // MySql에 적합함.
		this.eno = this.sno + this.rowsPerPage - 1;
	}

} // class