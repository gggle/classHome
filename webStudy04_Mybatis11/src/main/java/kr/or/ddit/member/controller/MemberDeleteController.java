package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.MemberVO;
public class MemberDeleteController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// id 패스워드를 받아 온다.
		// 아이디 패스워드가 누락이면 불통
		// 리무브 멤버 로 로직 작성
		// 비즈니스 로직 객체 작석
		req.setCharacterEncoding("UTF-8");
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
		try {
			BeanUtils.populate(member, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new CommonException(e);
		} // 파라미터 19번을 부르지 않아도 됨

		String goPage = null;

		String message = null;
		Map<String, String> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		// 3. 검증
		boolean valid = validate(member, errors);
		System.err.println(valid);

		if (valid) {
			IMemberService service = new MemberServiceImpl();
			ServiceResult result = service.removeMember(member);
			switch (result) {
			case INVALIDPASSWORD:
				//goPage = "/WEB-INF/views/member/memberView.do";
				System.out.println("여기타나요?");
				goPage = "redirect:/member/mypage.do";
				message = "비밀번호 불일치";
				break;
			case FAILED:
				//goPage = "/WEB-INF/views/member/memberView.jsp";
				goPage = "/member/mypage.do";
				message = "서버 오류로 인한 실패";
				break;
			case OK:
				goPage = "redirect:/common/message.jsp";
				message = "탈퇴약관 : 일주일이내 같은 아이디 가입 불가";
				req.getSession().setAttribute("goLink", "/"); // 웰컴페이지 링크
				req.getSession().setAttribute("isRemoved", new Boolean(true)); // 웰컴페이지 링크
				//req.getSession().invalidate(); // 세션 만료
				break;
			}
			req.getSession().setAttribute("message", message);
		} else {
			goPage = "member/memberView";
		}
		return goPage;
	}

	// 통과를 하지 못하면 memberview.jsp
	// 기존 입력데이터 . 에러메세지를 가지고 돌아간다 .

	private boolean validate(MemberVO member, Map<String, String> errors) {
		boolean valid = true;
		// 검증 룰
		if (StringUtils.isBlank(member.getMem_pass())) {
			valid = false;
			errors.put("mem_pass", "비밀번호 누락");
		}
		if (StringUtils.isBlank(member.getMem_id())) {
			valid = false;
			errors.put("mem_id", "아이디 누락");
		}
		
		return valid;
	}
}
