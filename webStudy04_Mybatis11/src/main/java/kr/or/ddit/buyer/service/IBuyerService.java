package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	
	/**
	 * 바이어 전체 출력 메서드
	 * @return
	 */
	public List<BuyerVO> selectAllBuyer();
	
	/**
	 * 바이어 상세정보 조회
	 * @param buyer_id
	 * @return
	 */
	public BuyerVO selectBuyer(String buyer_id);
	
	/**
	 * 신규바이어 등록
	 * @param 
	 * @return
	 */
	public ServiceResult insertBuyer(BuyerVO buyer);
}
