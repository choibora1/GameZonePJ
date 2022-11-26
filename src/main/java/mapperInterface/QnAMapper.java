package mapperInterface;

import java.util.List;

import criTest.SearchCriteria;
import vo.QnAVO;

public interface QnAMapper {

	// ** Criteria PageList
	List<QnAVO> searchPost(SearchCriteria cri);

	int countPost(SearchCriteria cri);

	// ** selectOne
	QnAVO readPost(QnAVO vo);

	// ** writePost : 새 게시물 작성
	int writePost(QnAVO vo);

	// ** modifyPost : 게시물 수정
	int modifyPost(QnAVO vo);

	// ** deleteQnA : 게시물 삭제
	int removePost(QnAVO vo);

	// ** countHits : 조회수 증가
	int countHits(QnAVO vo);

	// ** updateStep :
	int updateStep(QnAVO vo);

	// ** writeReply : 답글 달기
	int writeReply(QnAVO vo);

} // interface