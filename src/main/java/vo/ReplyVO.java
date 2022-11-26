package vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int reply_number;
	private int seq;
	private String id;
	private String content;
	private String regdate;

}