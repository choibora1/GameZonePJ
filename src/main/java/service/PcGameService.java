package service;

import java.util.List;

import criTest.GameSearchCriteria;
import vo.GameVO;
import vo.RankingVO;

public interface PcGameService {

	// ** 랭킹 보여주기
	List<GameVO> showList();

	// ** PGame_GameList
	List<GameVO> pcGameList(GameSearchCriteria gameCriteria);

	int viewCount(GameSearchCriteria gameCriteria);

	GameVO detailPcGame(GameVO vo);

	int insertPcGame(GameVO vo);

	int updatePcGame(GameVO vo);

	int deletePcGame(GameVO vo);

	// ** 게임 조회수 증가
	int countUp(GameVO vo);

	// ** Ranking Table에 값 저장
	int insertInfo(RankingVO rvo);

	// ** Ranking Table에 값이 있는지 확인
	RankingVO selectOne(RankingVO rvo);

}