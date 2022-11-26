package vo;

import lombok.Data;

@Data
public class QnAVO {

	private int seq;
	private String id;
	private String title;
	private String content;
	private String regdate;
	private int cnt;
	private int root;
	private int step;
	private int indent;
	private String secret;

} // class