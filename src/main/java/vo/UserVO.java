package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {
	
	private int user_number;
	private String uploadimg;
	private String id;
	private String password;
	private String user_name;
	private String birthday;
	private int gender;
	private String email;
	private String domain;
	private String phone;
	
	private MultipartFile uploadimgfile;
	
} // class
