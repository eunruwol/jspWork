package kr.or.ddit.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.db.SqlFactoryBuilder;
import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.ProdVo;
import kr.or.ddit.user.model.UserVo;

public class UserDao implements UserDaoInf{
	public List<UserVo> selectUserAll(){
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		List<UserVo> result = session.selectList("user.selectUserAll");
		// session.rollback();
		// session.commit();
		session.close();
		return result;
	}	
	
	public UserVo selectUser(String userId){
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		UserVo userVo = session.selectOne("user.selectUser", userId);
		session.close();
		return userVo;
	}
	
	public UserVo selectUser(UserVo userVo){
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		UserVo selectUserVo = session.selectOne("user.selectUserByVo", userVo);
		session.close();
		return selectUserVo;
	}

	@Override
	public List<UserVo> selectUserPageList(PageVo pageVo) {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		List<UserVo> userList = session.selectList("user.selectUserPageList", pageVo );
		session.close();
		return userList;
	}

	/**
	* Method : getUserCnt
	* 작성자 : pc18
	* 변경이력 :
	* @return
	* Method 설명 : 사용자 전체 건수 조회
	*/
	@Override
	public int getUserCnt() {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		int totalUserCnt = session.selectOne("user.getUserCnt");
		session.close();
		
		return totalUserCnt;
	}
	
	/**
	* Method : getUserCnt
	* 작성자 : pc18
	* 변경이력 :
	* @return
	* Method 설명 : 제품 전체 건수 조회
	*/
	@Override
	public int getProdCnt() {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		int totalProdCnt = session.selectOne("user.getProdCnt");
		session.close();
		
		return totalProdCnt;
	}
	
	/**
	* Method : insertUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 등록
	*/
	@Override
	public int insertUser(UserVo userVo){
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		int insertCnt = session.insert("user.insertUser", userVo);
		
		session.commit();
		session.close();
		
		return insertCnt;
	}
	
	/**
	* Method : deleteUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사용자 삭제
	 */
	@Override
	public int deleteUser(String userId) {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		int deleteCnt = session.delete("user.deleteUser", userId);
		
		session.commit();
		session.close();
		
		return deleteCnt;
	}

	/**
	* Method : updateUser
	* 작성자 : pc18
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 수정
	*/
	@Override
	public int updateUser(UserVo userVo) {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		int updateCnt = session.update("user.updateUser", userVo);
		
		session.commit();
		session.close();
		
		return updateCnt;
	}

	@Override
	public String selectProfile(String userId) {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		
		String result = session.selectOne("user.selectProfile",  userId);
		session.close();
		
		return result;
	}

	@Override
	public List<ProdVo> selectProdList(PageVo pageVo) {
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		List<ProdVo> userList = session.selectList("user.selectProdList", pageVo);
		session.close();
		return userList;
	}
	
	@Override
	public ProdVo selectProd(String prod_id){
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		ProdVo prodVo = session.selectOne("user.selectProd", prod_id);
		session.close();
		return prodVo;
	}
}