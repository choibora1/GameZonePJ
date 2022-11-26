package criTest;

import lombok.Data;

@Data
public class GameSearchCriteria extends GameCriteria {

	private String searchType; // 필요 시 사용

	private String keyword;

	private String[] check;
	
} // class