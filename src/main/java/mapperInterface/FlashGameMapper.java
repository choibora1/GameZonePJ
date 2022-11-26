package mapperInterface;

import java.util.List;

import criTest.GameSearchCriteria;
import vo.GameVO;

public interface FlashGameMapper {
	
	// ** FlashGame_List
	List<GameVO> flashGameList(GameSearchCriteria gameCriteria);
	
	// ** Paging
	int viewCount(GameSearchCriteria gameCriteria);
	
	// ** 디테일(수정, 삭제하기 위함)
	GameVO detailFlashGame(GameVO vo);
	
	// ** 게임 추가
	int insertFlashGame(GameVO vo);

	// ** 게임 수정
	int updateFlashGame(GameVO vo);

	// ** 게임 삭제
	int deleteFlashGame(GameVO vo);

} // i
