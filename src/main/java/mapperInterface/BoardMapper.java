package mapperInterface;

import java.util.List;

import criTest.SearchCriteria;
import vo.BoardVO;

public interface BoardMapper {

	// ** Criteria PageList
	List<BoardVO> searchPost(SearchCriteria cri);

	int countPost(SearchCriteria cri);

	// ** Detail(selectOne)
	BoardVO readPost(BoardVO vo);

	// ** writePost : 새 게시물 작성
	int writePost(BoardVO vo);

	// ** modifyPost : 게시물 수정
	int modifyPost(BoardVO vo);

	// ** deleteBoard : 게시물 삭제
	int removePost(BoardVO vo);

	// ** countHits : 조회수 증가
	int countHits(BoardVO vo);

	// ** updateStep : 
	int updateStep(BoardVO vo);

	// ** writeReply : 댓글 달기
	int writeReply(BoardVO vo);
	
	// ** 댓글 삭제
	int removeReply(BoardVO vo);

} // interface