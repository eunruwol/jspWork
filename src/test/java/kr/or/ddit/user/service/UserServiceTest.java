package kr.or.ddit.user.service;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.UserVo;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class UserServiceTest {

	private UserServiceInf userService;
	
	@BeforeClass
	public static void beforeClass(){
		System.out.println("beforeClass");
	}
	
	@AfterClass
	public static void afterClass(){
		System.out.println("afterClass");
	}
	
	@Before
	public void before(){
		System.out.println("before");
		userService = new UserService();
	}
	
	@After
	public void after(){
		System.out.println("after");
	}
	
	@Test
	public void selectUserAllTest() {
		
		/***Given***/
		/***When***/
		List<UserVo> result = userService.selectUserAll();
		/***Then***/
		assertEquals(105, result.size());
	}

	@Test
	public void selectUserByUserIdTest() {
		/***Given***/
		String userId = "brown";
		/***When***/
		UserVo result = userService.selectUser(userId);
		
		/***Then***/
		assertEquals("브라운", result.getName());
	}

	@Test
	public void selectUserByUserVo() {
		/***Given***/
		UserVo userVo = new UserVo();
		userVo.setUserId("brown");
		/***When***/
		
		UserVo result = userService.selectUser(userVo);
		
		/***Then***/
		assertEquals("브라운", result.getName());
	}
	
	@Test
	public void selectUserPageListTest(){
		
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);

		/***When***/
		Map<String, Object> resultMap = userService.selectUserPageList(pageVo);
		
		// 페이지 리스트
		List<UserVo> userList = (List<UserVo>) resultMap.get("userList");
		
		int pageCnt = (Integer)resultMap.get("pageCnt");
		
		/***Then***/
		for(UserVo userVo : userList){
			System.out.println(userVo.getRnum());
		}
		assertEquals(10, userList.size());
		assertEquals(11, pageCnt);
		
		
	}
	
}
