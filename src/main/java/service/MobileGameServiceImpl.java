package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.GameSearchCriteria;
import mapperInterface.MobileGameMapper;
import vo.GameVO;
import vo.RankingVO;

@Service
public class MobileGameServiceImpl implements MobileGameService {

	@Autowired
	MobileGameMapper mapper;
	
	@Override
	public List<GameVO> showList() {
		return mapper.showList();
	}

	// ** MobileGame_List
	@Override
	public List<GameVO> mobileGameList(GameSearchCriteria cri) {
		return mapper.mobileGameList(cri);
	}
	
	@Override
	public int viewCount(GameSearchCriteria cri) {
		return mapper.viewCount(cri);
	}
	
	@Override
	public GameVO detailMobileGame(GameVO vo) {
		return mapper.detailMobileGame(vo);
	}
	
	@Override
	public int insertMobileGame(GameVO vo) {
		return mapper.insertMobileGame(vo);
	}
	
	@Override
	public int updateMobileGame(GameVO vo) {
		return mapper.updateMobileGame(vo);
	}
	
	@Override
	public int deleteMobileGame(GameVO vo) {
		return mapper.deleteMobileGame(vo);
	}
	
	@Override
	public int countUp(GameVO vo) {
		return mapper.countUp(vo);
	}

	@Override
	public int insertInfo(RankingVO rvo) {
		return mapper.insertInfo(rvo);
	}

	@Override
	public RankingVO selectOne(RankingVO rvo) {
		return mapper.selectOne(rvo);
	}
	
}
