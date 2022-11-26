package criTest;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class GamePageMaker { 
   private int totalRowsCount; // 전체 Row 개수 (전체 Page 수 계산을 위해 필요함) 
   private int spageNo; // view에 표시할 첫 페이지 번호를 의미 
   private int epageNo; // view에 표시할 마지막 페이지 번호를 의미 
   private int displayPageNo = 5; // 한 페이지당 표시할 페이지 번호의 개수를 의미. 
   private int lastPageNo;
   // => 출력 가능한 마지막 PageNo를 의미 (totalRowCount, rowsPerPage로 계산함)
   
   private boolean prev; // 이전 PageBlock 으로
   private boolean next; // 다음 PageBlock 으로
   
   private GameSearchCriteria gameCriteria;
   
   // ** 필요한 값 Set
   public void setCri(GameSearchCriteria gameCriteria) {
      this.gameCriteria = gameCriteria;
   }
   
   // 2) totalRowsCount
   public void setTotalRowsCount(int totalRowsCount) {
      this.totalRowsCount = totalRowsCount;
      calcData();
   }
   
   // 3) 기타 나머지 필요한 값 계산하기
   public void calcData() {
      // 3.1) currPage가 속한 페이지블럭의 epageNo 를 계산
      epageNo = (int)Math.ceil(gameCriteria.getCurrPage() / (double)displayPageNo) * displayPageNo;
       spageNo = (epageNo-displayPageNo) + 1 ;
      
      // 3.2) lastPageNo 계산, epageNo 확인하기
       lastPageNo = (int)Math.ceil(totalRowsCount / (double)gameCriteria.getRowsPerPage()) ;
       if ( epageNo > lastPageNo ) epageNo = lastPageNo;
       
      // 3.3) prev, next 계산
       prev = spageNo == 1 ? false : true;
       next = epageNo == lastPageNo ? false : true;
   } //calcData
   
   // 4) QueryString 자동 생성하기
   public String makeQuery(int currPage) {
	   
      UriComponents uriComponents = 
            UriComponentsBuilder.newInstance().
            queryParam("currPage", currPage).
            queryParam("rowsPerPage", gameCriteria.getRowsPerPage()).
            build();
      return uriComponents.toString();
   } //makeQuery
   
   public String searchQuery(int currPage) {
	// ** check 처리
	// => MultiValueMap 생성
	   MultiValueMap<String, String> checkMap = new LinkedMultiValueMap<String, String>();
	   // => check에 선택한 값이 있는 경우에만 배열 check의 원소들을 Map으로
	   if (gameCriteria.getCheck() != null) {
		   for (String c : gameCriteria.getCheck()) {
			   checkMap.add("check", c);
		   } // for
	   } else
		   checkMap = null;
	   
	   UriComponents uriComponents = UriComponentsBuilder.newInstance().
			   queryParam("currPage", currPage).
			   queryParam("rowsPerPage", gameCriteria.getRowsPerPage()).
			   queryParam("searchType", gameCriteria.getSearchType()).
			   queryParam("keyword", gameCriteria.getKeyword()).
			   queryParams(checkMap).
			   build();
      
	   return uriComponents.toString();
      
   	} //searchQuery
   
} //PageMaker