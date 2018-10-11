package kr.or.ddit.db;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TempDao {
	
	
	public Map<String, Object> getTemp(){
		Map<String, Object> result = null;
		
		SqlSessionFactory sqlFactory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session = sqlFactory.openSession();
		result = session.selectOne("temp.temp");
		
		return result;
	}
	
}
