package service;

import java.util.List;

import criTest.GameSearchCriteria;
import vo.GameVO;

public interface FlashGameService {
	
	// FlashGame_List
	List<GameVO> flashGameList(GameSearchCriteria gameCriteria);
	
	// Paging
	int viewCount(GameSearchCriteria gameCriteria);
	
	// 디테일(수정, 삭제 위함)
	GameVO detailFlashGame(GameVO vo);
	
	// 게임 추가
	int insertFlashGame(GameVO vo);

	// 게임 수정
	int updateFlashGame(GameVO vo);

	// 게임 삭제
	int deleteFlashGame(GameVO vo);

} // i_service
