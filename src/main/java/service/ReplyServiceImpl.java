package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.ReplyMapper;
import vo.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;

	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		return mapper.replyList(vo);
	}

	// ** Insert
	@Override
	public int writeReply(ReplyVO vo) {
		return mapper.writeReply(vo);
	}

	// ** Update
	@Override
	public int modifyReply(ReplyVO vo) {
		return mapper.modifyReply(vo);
	}

	// ** Delete
	@Override
	public int deleteReply(ReplyVO vo) {
		return mapper.deleteReply(vo);
	}

} // class