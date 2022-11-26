package mapperInterface;

import java.util.List;

import criTest.GameSearchCriteria;
import vo.GameVO;
import vo.RankingVO;

public interface MobileGameMapper {
	
	// ** 랭킹 보여주기
	List<GameVO> showList();
	
	// MobileGame_List
	List<GameVO> mobileGameList(GameSearchCriteria cri);
	
	int viewCount(GameSearchCriteria cri);
	
	GameVO detailMobileGame(GameVO vo);
	
	int insertMobileGame(GameVO vo);
	
	int updateMobileGame(GameVO vo);
	
	int deleteMobileGame(GameVO vo);
	
	// ** 게임 조회수 증가
	int countUp(GameVO vo);

	// ** Ranking Table에 값 저장
	int insertInfo(RankingVO rvo);

	// ** Ranking Table에 값이 있는지 확인
	RankingVO selectOne(RankingVO rvo);
	
}
