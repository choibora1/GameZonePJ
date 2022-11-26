package mapperInterface;

import java.util.List;


import criTest.SearchCriteria;
import vo.UserVO;

public interface UserMapper {
	
	// ** 전체 User List
	List<UserVO> userList(SearchCriteria cri);
	
	int viewCount(SearchCriteria cri);
		
	// ** 한 명의 정보 보기
	UserVO detailUser(UserVO vo);
	
	// ** 회원가입
	int joinUser(UserVO vo);

	// ** 정보 수정
	int updateProfile(UserVO vo);
	
	// ** 비밀번호 수정
	int updatePassword(UserVO vo);

	// ** 회원 탈퇴
	int deleteUser(UserVO vo);
	
} // interface
