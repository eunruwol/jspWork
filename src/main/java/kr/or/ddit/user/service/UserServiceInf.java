package kr.or.ddit.user.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.ProdVo;
import kr.or.ddit.user.model.UserVo;

public interface UserServiceInf {
	
	List<UserVo> selectUserAll();
	
	UserVo selectUser(String userId);
	
	UserVo selectUser(UserVo userVo);
	
	/**
	* Method : selectUserPageList
	* 작성자 : pc18
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 사용자 페이징 조회
	*/
	Map<String, Object> selectUserPageList(PageVo pageVo);
	
	/**
	* Method : insertUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 등록
	*/
	int insertUser(UserVo userVo);
	
	/**
	* Method : deleteUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사용자 삭제
	*/
	int deleteUser(String userId);
	
	/**
	* Method : updateUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 수정
	*/
	int updateUser(UserVo userVo);
	
	/**
	* Method : selectProfile
	* 작성자 : pc18
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 해당 profile 조회
	*/
	String selectProfile(String userId);
	
	/**
	* Method : selectProdList
	* 작성자 : pc18
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 제품 조회
	*/
	Map<String, Object> selectProdList(PageVo pageVo);
	
	/**
	* Method : selectUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 제품 상세 조회
	*/
	ProdVo selectProd(String prod_id);
}
