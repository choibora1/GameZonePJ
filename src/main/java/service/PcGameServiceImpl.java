package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.GameSearchCriteria;
import mapperInterface.PcGameMapper;
import vo.GameVO;
import vo.RankingVO;

@Service
public class PcGameServiceImpl implements PcGameService {

   @Autowired
   PcGameMapper mapper;
   
   // ** 랭킹 보여주기
   @Override
	public List<GameVO> showList() {
		return mapper.showList();
   }
   
   // ** PGame_List
   @Override
   public List<GameVO> pcGameList(GameSearchCriteria gameCriteria) {
      return mapper.pcGameList(gameCriteria);
   }
   
   @Override
   public int viewCount(GameSearchCriteria gameCriteria) {
      return mapper.viewCount(gameCriteria);
   }
   
   @Override
   public GameVO detailPcGame(GameVO vo) {
      
      return mapper.detailPcGame(vo);
   }
   
   @Override
   public int insertPcGame(GameVO vo) {
      return mapper.insertPcGame(vo);
   }
   
   @Override
   public int updatePcGame(GameVO vo) {
      return mapper.updatePcGame(vo);
   }
   
   @Override
   public int deletePcGame(GameVO vo) {
      return mapper.deletePcGame(vo);
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