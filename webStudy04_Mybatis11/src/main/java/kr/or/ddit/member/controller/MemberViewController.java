package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.MemberVO;

public class MemberViewController implements ICommandHandler{

	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mem_id = req.getParameter("who");
		System.out.println(mem_id);
		if(StringUtils.isBlank(mem_id)) {
			System.out.println("뷰 서블릿");
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;  // 결정에 따라서는 뷰가 결정이 안됌
		}
		IMemberService service = new MemberServiceImpl();
		MemberVO member = service.retrieveMember(mem_id);
		// 이정보를 프론로 넘김
		String view = "member/memberView";
		req.setAttribute("member", member);
		
		return view;
	}
}
