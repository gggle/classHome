package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.service.IBuyerServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.BuyerVO;

public class BuyerViewController implements ICommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String buyer_id = req.getParameter("what");
		System.out.println("buyer_id="+buyer_id);
		if(StringUtils.isBlank(buyer_id)) {
			resp.sendError(404);
			return null;
		}
		
		IBuyerService service = new IBuyerServiceImpl();
		BuyerVO buyer = service.selectBuyer(buyer_id);
		req.setAttribute("buyer", buyer);
		return "buyer/buyerView";
	}

}
