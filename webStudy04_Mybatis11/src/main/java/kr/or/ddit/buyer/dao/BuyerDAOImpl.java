package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.BuyerVO;

public class BuyerDAOImpl implements IBuyerDAO {

	SqlSessionFactory sqlSessionFactory = CustomSqlSessionFactoryBuilder.getSqlSessionFactory();
	
	@Override
	public List<BuyerVO> selectAllBuyer() {
		 try(
		      SqlSession session = sqlSessionFactory.openSession();
		 ) {
		     IBuyerDAO mapper = session.getMapper(IBuyerDAO.class);
		     return mapper.selectAllBuyer();
		     }
	}
	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		try(
				 SqlSession session = sqlSessionFactory.openSession();
				 ) {
			IBuyerDAO mapper = session.getMapper(IBuyerDAO.class);
			 return mapper.selectBuyer(buyer_id);
		 }
	}
	@Override
	public String insertBuyer(BuyerVO buyer) {
		try(
				 SqlSession session = sqlSessionFactory.openSession();
				 ) {
			IBuyerDAO mapper = session.getMapper(IBuyerDAO.class);
			 return mapper.insertBuyer(buyer);
		 }
	}

}
