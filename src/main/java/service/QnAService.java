package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.QnAVO;

public interface QnAService {

	// ** Criteria PageList
	List<QnAVO> searchPost(SearchCriteria cri);

	// ** 조건과 일치하는 Rows(글)의 개수
	int countPost(SearchCriteria cri);

	// ** selectOne
	QnAVO readPost(QnAVO vo);

	// ** 게시물 등록
	int writePost(QnAVO vo);

	// ** 게시물 수정
	int modifyPost(QnAVO vo);

	// ** 게시물 삭제
	int removePost(QnAVO vo);

	// ** 조회수 증가
	int countHits(QnAVO vo);

	// ** 게시글에 대한 답글 등록
	int writeReply(QnAVO vo);

}