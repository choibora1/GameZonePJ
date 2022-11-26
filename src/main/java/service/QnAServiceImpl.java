package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.SearchCriteria;
import mapperInterface.QnAMapper;
import vo.QnAVO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnAMapper mapper;

	@Override // ver02
	public List<QnAVO> searchPost(SearchCriteria cri) {
		return mapper.searchPost(cri);
	}

	public int countPost(SearchCriteria cri) {
		return mapper.countPost(cri);
	}

	// ** selectOne
	@Override
	public QnAVO readPost(QnAVO vo) {
		return mapper.readPost(vo);
	}

	// ** Insert
	@Override
	public int writePost(QnAVO vo) {
		return mapper.writePost(vo);
	}

	// ** Update
	@Override
	public int modifyPost(QnAVO vo) {
		return mapper.modifyPost(vo);
	}

	// ** Delete
	@Override
	public int removePost(QnAVO vo) {
		return mapper.removePost(vo);
	}

	// ** 조회수 증가
	@Override
	public int countHits(QnAVO vo) {
		return mapper.countHits(vo);
	}

	// ** 답글 등록
	@Override
	public int writeReply(QnAVO vo) {
		int result = mapper.writeReply(vo);
		
		if (result > 0)
			System.out.println("** stepUpdate Count => " + mapper.updateStep(vo));
		else
			result = 0;
		
		return result;
	}

}