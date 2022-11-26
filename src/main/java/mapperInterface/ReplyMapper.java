package mapperInterface;

import java.util.List;

import vo.ReplyVO;

public interface ReplyMapper {

	List<ReplyVO> replyList(ReplyVO vo);

	// ** writeReply : 새 댓글 작성
	int writeReply(ReplyVO vo);

	// ** modifyReply : 댓글 수정
	int modifyReply(ReplyVO vo);

	// ** deleteReply : 댓글 삭제
	int deleteReply(ReplyVO vo);

} // interface