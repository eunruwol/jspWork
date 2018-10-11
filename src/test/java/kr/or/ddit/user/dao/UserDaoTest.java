package kr.or.ddit.user.dao;
import java.text.SimpleDateFormat;
import java.util.List;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.UserVo;


public class UserDaoTest {
	
	private UserDaoInf userDao;
	
	@Before
	public void setup(){
		userDao = new UserDao();
	}

	@Test
	public void selectUserAllTest(){
		/***Given***/
		
		
		/***When***/
		List<UserVo> result = userDao.selectUserAll();
		
		/***Then***/
		assertEquals(105, result.size());
	}
	
	@Test
	public void selectUserTest(){
		/***Given***/
		String userId = "brown";
		
		/***When***/
		UserVo userVo = userDao.selectUser(userId);
		
		/***Then***/
		assertNotNull(userVo);
		assertEquals("brown", userVo.getUserId());
		assertEquals("브라운", userVo.getName());
	}
	
	@Test
	public void selectUserByVoTest(){
		
		/***Given***/
		UserVo userVo = new UserVo();
		userVo.setUserId("brown");
		userVo.setName("브라운");
		
		/***When***/
		UserVo result = userDao.selectUser(userVo);
		
		/***Then***/
		assertNotNull(result);
		assertEquals("brown", result.getUserId());
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
		assertEquals("18/08/08", format.format(result.getBirth()));
		
	}
	
	@Test
	public void selectUserPageListTest(){
		
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);

		/***When***/
		List<UserVo> result = userDao.selectUserPageList(pageVo);
		
		/***Then***/
		for(UserVo userVo : result){
			System.out.println(userVo.getRnum());
		}
		assertEquals(10, result.size());
	}
	
	/**
	* Method : getUserCntTest
	* 작성자 : pc18
	* 변경이력 :
	* Method 설명 : 사용자 전체 건수 조회 테스트
	*/
	@Test
	public void getUserCntTest(){
		
		/***Given***/		

		/***When***/
		int totalUserCnt = userDao.getUserCnt();

		/***Then***/
		assertEquals(105, totalUserCnt);
		
	}
}