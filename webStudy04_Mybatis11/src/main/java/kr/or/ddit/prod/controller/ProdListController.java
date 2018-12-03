package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.prod.dao.IOtherDAO;
import kr.or.ddit.prod.dao.OtherDAOImpl;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ProdVO;

public class ProdListController implements ICommandHandler{
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 1번 완료 uri 등록
		// 2. 요청분석(주소, 파라미터, 메서드, 헤더들...)
		ProdVO searchVO = new ProdVO();
		searchVO.setProd_lgu(req.getParameter("prod_lgu"));
		searchVO.setProd_buyer(req.getParameter("prod_buyer"));
		searchVO.setProd_name(req.getParameter("prod_name"));

		String page = req.getParameter("page"); // 어떤 페이지가 필요한지
		int currentPage = 1; // 1로 초기화

		if (StringUtils.isNumeric(page)) {
			currentPage = Integer.parseInt(page);
		}
		PagingInfoVO<ProdVO> pagingVO = new PagingInfoVO(7, 4); // 스크린 사이즈, 블럭 사이즈
		pagingVO.setCurrentPage(currentPage); // 스타트 페이지 엔드 페이지 결정
		pagingVO.setSearchVO(searchVO);
		// 3. BLL 과의 의존관계 형성
		IProdService service = new ProdServiceImpl(); // 객체 생성
		IOtherDAO otherDAO = new OtherDAOImpl();
		List<Map<String,Object>> lprodList = otherDAO.selectLprodList();
		List<BuyerVO> buyerList = otherDAO.selectBuyerList(null);
		req.setAttribute("lprodList", lprodList);
		req.setAttribute("buyerList", buyerList);
		// 4. 로직선택 -> service.retrieveMemberList();
		// 5. 컨텐츠(Model) 확보 -> List<MemberVO> memberList

		long totalRecord = service.retrieveProdCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord); // 토탈페이지 연산
		List<ProdVO> prodList = service.retrieveProdList(pagingVO);
		pagingVO.setDataList(prodList); // 데이터 삽입

	      //Accept 헤더를 통해 동기 / 비동기 요청 여부를 판단
	      // 동기요청이면 View Layer 를 통해 응답이
	      // 비동기 요청이면 PagingVO를 통해 마샬링

		String accept = req.getHeader("accept");
		if (accept.toLowerCase().contains("json")) {
			// json
			resp.setContentType("application/json;charset=UTF-8");
			ObjectMapper mapper = new ObjectMapper();
	    	  try(
	    			  PrintWriter out = resp.getWriter();
	    			  ){
	    		  	mapper.writeValue(out, pagingVO);
	    	  }
			return null;
		} else {
			// html

			// 6. VL을 선택 - serverside 절대경로 방식
			// String view = "prod/prodList";
			// 7. Scope 를 통해 Model 공유
			req.setAttribute("pagingVO", pagingVO);
			// 8. 이동방식을 결정하고, VL로 이동
//	      RequestDispatcher rd = req.getRequestDispatcher(view);
//	      rd.forward(req, resp);
			return "prod/prodList";
		}
	}
}
