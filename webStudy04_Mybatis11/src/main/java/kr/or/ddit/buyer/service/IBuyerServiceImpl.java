package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService {

	IBuyerDAO buyerDAO = new BuyerDAOImpl();

	/**
	 * 전체 정보 출력 메서드
	 */
	@Override
	public List<BuyerVO> selectAllBuyer() {
		List<BuyerVO> buyerlist = buyerDAO.selectAllBuyer();
		return buyerlist;
	}

	/**
	 * 바이어 상세정보 조회
	 */
	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		BuyerVO buyer = buyerDAO.selectBuyer(buyer_id);
		if (buyer == null) {
			throw new CommonException();
		}
		return buyer;
	}

	/**
	 * 신규 바이어 등록
	 */
	@Override
	public ServiceResult insertBuyer(BuyerVO buyer) {
		String newBuyer = buyerDAO.insertBuyer(buyer);
		ServiceResult result = null;
		System.out.println("1차 로 여기는 오나요 ?");
		if(newBuyer != null) {
			System.out.println("여기 타나요 ?");
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
}
