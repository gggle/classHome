package kr.or.ddit.member.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import kr.or.ddit.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl implements IMemberDAO {

   SqlSessionFactory sqlSessionFactory = CustomSqlSessionFactoryBuilder.getSqlSessionFactory();
   
   
	@Override
	public int insertMember(MemberVO member) {
		try (SqlSession session = sqlSessionFactory.openSession();
				) {
			IMemberDAO mapper = session.getMapper(IMemberDAO.class);
			int rowCont = mapper.insertMember(member);
			// 쿼리문을 실행 후 커밋을 해주자
			if(rowCont >0) {  // 로우카운트가 0보다 크다면 성공 했겟지 ?
				session.commit(); // 그렇다면 커밋을 하는거야 insert,delete,update 를 할때는 트랙잭션의 락을 풀어주는거야 ok?
			}
			return rowCont;
		}
	}

   @Override
   public long selectTotalRecord(PagingInfoVO pagingVO) {
      try(
         SqlSession session = sqlSessionFactory.openSession();
      ) {
//         return session.selectOne("kr.or.ddit.member.dao.IMemberDAO.selectTotalRecord",pagingVO);
         IMemberDAO mapper = session.getMapper(IMemberDAO.class);
         return mapper.selectTotalRecord(pagingVO);
      }
   }

   @Override
   public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
      try(
         SqlSession session = sqlSessionFactory.openSession();
      ){
//         return session.selectList("kr.or.ddit.member.dao.IMemberDAO.selectMemberList",pagingVO);
         IMemberDAO mapper = session.getMapper(IMemberDAO.class);
         return mapper.selectMemberList(pagingVO);
      }
   }

   @Override
   public MemberVO selectMember(String mem_id) {
      try(
         SqlSession session = sqlSessionFactory.openSession();
      ){
         IMemberDAO mapper = session.getMapper(IMemberDAO.class);
         return mapper.selectMember(mem_id);
      }
   }

   @Override
   public int updateMember(MemberVO member) {
      try(
    		  SqlSession session = sqlSessionFactory.openSession();
    		  ){
    	  IMemberDAO mapper = session.getMapper(IMemberDAO.class);
    	  int rowCont = mapper.updateMember(member);
			// 쿼리문을 실행 후 커밋을 해주자
			if(rowCont >0) {  // 로우카운트가 0보다 크다면 성공 했겟지 ?
				session.commit(); // 그렇다면 커밋을 하는거야 insert,delete,update 를 할때는 트랙잭션의 락을 풀어주는거야 ok?
			}
			return rowCont;
      }
   }

	@Override
	public int deleteMember(String mem_id) {
		try (SqlSession session = sqlSessionFactory.openSession();) {
			IMemberDAO mapper = session.getMapper(IMemberDAO.class);
			int rowCont = mapper.deleteMember(mem_id);
			if (rowCont > 0) { // 로우카운트가 0보다 크다면 성공 했겟지 ?
				session.commit(); // 그렇다면 커밋을 하는거야 insert,delete,update 를 할때는 트랙잭션의 락을 풀어주는거야 ok?
			}
			return rowCont;
		}
	}

   

}