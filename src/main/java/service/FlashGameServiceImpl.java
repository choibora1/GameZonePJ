package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.GameSearchCriteria;
import mapperInterface.FlashGameMapper;
import vo.GameVO;

@Service
public class FlashGameServiceImpl implements FlashGameService {
	
	@Autowired
	FlashGameMapper mapper;
	
	// FlashGame_List
	@Override
	public List<GameVO> flashGameList(GameSearchCriteria gameCriteria) {
		return mapper.flashGameList(gameCriteria);
	}
	
	@Override
	public int viewCount(GameSearchCriteria gameCriteria) {
		return mapper.viewCount(gameCriteria);
	}
	
	@Override
	public GameVO detailFlashGame(GameVO vo) {
		return mapper.detailFlashGame(vo);
	}
	
	@Override
	public int insertFlashGame(GameVO vo) {
		return mapper.insertFlashGame(vo);
	}
	
	@Override
	public int updateFlashGame(GameVO vo) {
		return mapper.updateFlashGame(vo);
	}
	
	@Override
	public int deleteFlashGame(GameVO vo) {
		return mapper.deleteFlashGame(vo);
	}

}
