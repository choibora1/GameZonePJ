package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.BoardVO;

public interface BoardService {

	// ** Criteria PageList
	List<BoardVO> searchPost(SearchCriteria cri);

	// ** 조건과 일치하는 Rows(글)의 개수
	int countPost(SearchCriteria cri);

	// ** selectOne
	BoardVO readPost(BoardVO vo);

	// ** 게시물 등록
	int writePost(BoardVO vo);

	// ** 게시물 수정
	int modifyPost(BoardVO vo);

	// ** 게시물 삭제
	int removePost(BoardVO vo);

	// ** 조회수 증가
	int countHits(BoardVO vo);

	// ** 게시글에 대한 댓글 등록
	int writeReply(BoardVO vo);
	
	// ** 댓글 삭제
	int removeReply(BoardVO vo);

}