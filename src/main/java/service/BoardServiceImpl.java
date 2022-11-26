package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.SearchCriteria;
import mapperInterface.BoardMapper;
import vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;

	@Override
	public List<BoardVO> searchPost(SearchCriteria cri) {
		return mapper.searchPost(cri);
	}

	public int countPost(SearchCriteria cri) {
		return mapper.countPost(cri);
	}

	// ** selectOne
	@Override
	public BoardVO readPost(BoardVO vo) {
		return mapper.readPost(vo);
	}

	// ** Insert
	@Override
	public int writePost(BoardVO vo) {
		return mapper.writePost(vo);
	}

	// ** Update
	@Override
	public int modifyPost(BoardVO vo) {
		return mapper.modifyPost(vo);
	}

	// ** Delete
	@Override
	public int removePost(BoardVO vo) {
		return mapper.removePost(vo);
	}

	// ** 조회수 증가
	@Override
	public int countHits(BoardVO vo) {
		return mapper.countHits(vo);
	}

	// ** 댓글 등록
	@Override
	public int writeReply(BoardVO vo) {
		int result = mapper.writeReply(vo);
		
		if (result > 0)
			System.out.println("** stepUpdate Count => " + mapper.updateStep(vo));
		else
			result = 0;
		
		return result;
	}
	
	// ** 댓글 삭제
	@Override
	public int removeReply(BoardVO vo) {
		return mapper.removeReply(vo);
	}

} // class