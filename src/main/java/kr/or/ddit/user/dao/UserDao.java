package kr.or.ddit.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.db.SqlFactoryBuilder;
import kr.or.ddit.user.model.PageVo;
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
}