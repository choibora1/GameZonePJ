package vo;

import lombok.Data;


@Data
public class BoardVO {
   
	private int seq;
	private String id;
	private String title;
	private String content;
	private String regdate; // 날짜는 Java에서 String으로 넣는 것이 편하다.
	private int cnt;
	private int root;
	private int step;
	private int indent;
	private int replyCount;

} // class