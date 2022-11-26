package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.UserVO;

public interface UserService {
	
	List<UserVO> userList(SearchCriteria cri);
	
	int viewCount(SearchCriteria cri);

	// ** selectOne
	UserVO detailUser(UserVO vo);

	// Insert
	int joinUser(UserVO vo);

	// Update
	int updateProfile(UserVO vo);
	
	// Password Update
	int updatePassword(UserVO vo);

	// Delete
	int deleteUser(UserVO vo);

} // i_UserService