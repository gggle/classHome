package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.service.IBuyerServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.BuyerVO;

public class BuyerListController implements ICommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 1단계 완료
		
		// 2단계 받을 파라미터 없음 패스
		// 객체에 담기
		
		List<BuyerVO> buyerList = new ArrayList<BuyerVO>();
		IBuyerService service = new IBuyerServiceImpl();
		buyerList = service.selectAllBuyer();
		req.setAttribute("buyerList", buyerList);
		return "buyer/buyerList";
	}

}
