package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.ibatis.sqlmap.engine.type.IntegerTypeHandler;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;
public class MemberListController implements ICommandHandler{

   public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //2. 요청분석(주소, 파라미터, 메서드, 헤더들...)
	   String searchWord = req.getParameter("searchWord");
	   String searchType = req.getParameter("searchType");
      int currentPage = 1;
      String page = req.getParameter("page");
      if(StringUtils.isNumeric(page)) {
         currentPage = Integer.parseInt(page);
      }
      PagingInfoVO<MemberVO> pagingVO = new PagingInfoVO(5,2); // 스크린 사이즈 블럭 사이즈
      pagingVO.setCurrentPage(currentPage);
      pagingVO.setSearchWord(searchWord);
      pagingVO.setSearchType(searchType);
      //3. BLL 과의 의존관계 형성
      IMemberService service = new MemberServiceImpl();
      //4. 로직선택   -> service.retrieveMemberList();
      //5. 컨텐츠(Model) 확보 -> List<MemberVO> memberList
      long totalRecord =  service.retrieveMemberCount(pagingVO);
      pagingVO.setTotalRecord(totalRecord);
      List<MemberVO> memberList =  service.retrieveMemberList(pagingVO);
      pagingVO.setDataList(memberList);
      //6. VL을 선택 - serverside 절대경로 방식
      String view = "member/memberList";
      //7. Scope 를 통해 Model 공유
      req.setAttribute("memberList",memberList);
      req.setAttribute("pagingVO",pagingVO);
      //8. 이동방식을 결정하고, VL로 이동
//      RequestDispatcher rd = req.getRequestDispatcher(view);
//      rd.forward(req, resp);
      
      return view;
   }
   
}










































