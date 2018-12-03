package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.prod.dao.IOtherDAO;
import kr.or.ddit.prod.dao.OtherDAOImpl;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

public class ProdInsertController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String method = req.getMethod();
		IOtherDAO otherDAO = new OtherDAOImpl();
		List<Map<String,Object>> lprodList = otherDAO.selectLprodList();
		req.setAttribute("lprodList", lprodList);

		if ("get".equalsIgnoreCase(method)) {
			return "prod/prodForm";

		} else if ("post".equalsIgnoreCase(method)) {

			// 특수문자처리
			req.setCharacterEncoding("UTF-8");

			// beanutil populate
			// 파라미터 가져오기
			ProdVO prod = new ProdVO();
			req.setAttribute("prod", prod);
			try {
				BeanUtils.populate(prod, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				throw new RuntimeException(e);
			}
			Map<String, String> errors = new HashMap<>();
			req.setAttribute("errors", errors);
			boolean valid = validate(prod, errors);
			String goPage = "";
			String view = null;
			if (valid) {
				IProdService service = new ProdServiceImpl();
				ServiceResult result = service.createProd(prod);
				if (ServiceResult.OK.equals(result)) {
					view = "redirect:/prod/prodView.do?what=" + prod.getProd_id();
				} else {
					req.setAttribute("message", "서버오류");
					view = "prod/prodForm";
				}

			} else {
				view = "prod/prodForm";
			}
			return view;

		} else {
			resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private boolean validate(ProdVO prod, Map<String, String> errors) {
		boolean valid = true;
		if (StringUtils.isBlank(prod.getProd_id())) {
			valid = false;
			errors.put("prod_id", " 누락");
		}
		if (StringUtils.isBlank(prod.getProd_name())) {
			valid = false;
			errors.put("prod_name", " 누락");
		}
		if (StringUtils.isBlank(prod.getProd_lgu())) {
			valid = false;
			errors.put("prod_lgu", " 누락");
		}
		if (StringUtils.isBlank(prod.getProd_buyer())) {
			valid = false;
			errors.put("prod_buyer", " 누락");
		}
		if (prod.getProd_cost()==null) {
			valid = false;
			errors.put("prod_cost", " 누락");
		}
		if (prod.getProd_price()==null) {
			valid = false;
			errors.put("prod_price", " 누락");
		}
		if (prod.getProd_sale()==null) {
			valid = false;
			errors.put("prod_sale", " 누락");
		}
		if (StringUtils.isBlank(prod.getProd_outline())) {
			valid = false;
			errors.put("prod_outline", " 누락");
		}
		if (StringUtils.isBlank(prod.getProd_img())) {
			valid = false;
			errors.put("prod_img", " 누락");
		}
		if (prod.getProd_totalstock()==null) {
			valid = false;
			errors.put("prod_totalstock", " 누락");
		}
		if (prod.getProd_properstock()==null) {
			valid = false;
			errors.put("prod_properstock", " 누락");
		}
		return valid;
	}
}