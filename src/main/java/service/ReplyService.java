package service;

import java.util.List;

import vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> replyList(ReplyVO vo);

	// ** 새 댓글 작성
	int writeReply(ReplyVO vo);

	// ** 댓글 수정
	int modifyReply(ReplyVO vo);

	// ** 댓글 삭제
	int deleteReply(ReplyVO vo);

}