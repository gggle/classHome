package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.service.IBuyerServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.BuyerVO;

public class BuyerInsertController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String method = req.getMethod();
		BuyerVO buyer = new BuyerVO();
		req.setAttribute("buyer", buyer);
		boolean chk = chk(buyer);
		String goPage = null;

		IBuyerService service =  new IBuyerServiceImpl();
			
		List<Map<String,Object>> buyerList = service.selectAllBuyer();
		req.setAttribute("lprodList", lprodList);
		
		if ("get".equalsIgnoreCase(method)) {
			return "buyer/buyerForm";
		} else if ("post".equalsIgnoreCase(method)) {
			try {
				BeanUtils.populate(buyer, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
			if (chk) {
				IBuyerService service = new IBuyerServiceImpl();
				ServiceResult result = service.insertBuyer(buyer);
				System.out.println("확인용 결과값 :ㅣ"+result);
				if (ServiceResult.OK.equals(result)) {
					goPage = "/buyer/buyerList";
				} else {
					goPage = "/buyer/buyerForm";
				}
			} else {
				goPage = "/buyer/buyerForm";
			}
			return goPage;
		}else {
			resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private boolean chk(BuyerVO buyer) {
		// TODO Auto-generated method stub
		return true;
	}

}
