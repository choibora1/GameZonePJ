package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.SearchCriteria;
import mapperInterface.UserMapper;
import vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public List<UserVO> userList(SearchCriteria cri) {
		return mapper.userList(cri);
	} // userList
	
	@Override
	public int viewCount(SearchCriteria cri) {
		return mapper.viewCount(cri);
	} // viewCount
	
//--------------------------------------------------
	
	// ** selectOne ( 한 명의 정보 보기 )
	@Override
	public UserVO detailUser(UserVO vo) {
		return mapper.detailUser(vo);
	} // detailUser
	
//--------------------------------------------------
	
	// Insert
	@Override
	public int joinUser(UserVO vo) {
		return mapper.joinUser(vo);
	} // joinUser
	
//--------------------------------------------------
	
	// Update
	@Override
	public int updateProfile(UserVO vo) {
		return mapper.updateProfile(vo);
	} // updateProfile
	
//--------------------------------------------------
	
	// Password Update
	@Override
	public int updatePassword(UserVO vo) {
		return mapper.updatePassword(vo);
	} // updatePassword
		
//--------------------------------------------------

	// Delete
	@Override
	public int deleteUser(UserVO vo) {
		return mapper.deleteUser(vo);
	} // deleteUser

} // class
