package kr.or.ddit.buyer.dao;

import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDAO {

	
	/**
	 * 바이어 전체 목록 출력
	 * @return
	 */
	public List<BuyerVO> selectAllBuyer();
	/**
	 * 바이어 상세 정보 출력
	 * @param buyer_id
	 * @return
	 */
	public BuyerVO selectBuyer(String buyer_id);
	
	public String insertBuyer(BuyerVO buyer);
}
