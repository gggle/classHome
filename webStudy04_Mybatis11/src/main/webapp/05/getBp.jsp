<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 파라미터 확보 -->
<!-- 2. 검증(필수데이터 검증, 유효데이터 검증) -->
<!-- 3. 불통 -->
<!--    1) 필수데이터 누락 : 400 -->
<!--    2) 우리가 관리하지 않는 멤버를 요구한 경우 : 404 -->
<!-- 4. 통과 -->
<!--      이동(맵에 있는 개인페이지, 클라이언트가 멤버 개인페이지의 주소를 모르도록) -->
<!-- 	   이동(맵에 있는 개인 페이지, getBp에서 원본요청을 모두 처리했을 경우, UI 페이지로 이동할때) -->
<%!
	public Map<String,String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001" ,new String[]{"제니","/WEB-INF/BLACKPINK/jenny.jsp"});	
	singerMap.put("B002" ,new String[]{"지수","/WEB-INF/BLACKPINK/jisoo.jsp"});	
	singerMap.put("B003" ,new String[]{"리사","/WEB-INF/BLACKPINK/lisa.jsp"});	
	singerMap.put("B004" ,new String[]{"로제","/WEB-INF/BLACKPINK/rose.jsp"});	
}
%>
<%
	request.setCharacterEncoding("UTF-8");
	//1.파라미터 확보
	String name = request.getParameter("member");
	
	//2.검증
	if(name == null || name.trim().length()==0){
		//필수데이터 누락 : 400
		response.sendError(response.SC_BAD_REQUEST);
	}else if(singerMap.get(name)==null){
		//우리가 관리하지 않는 멤버를 요구한 경우 : 404
		response.sendError(response.SC_NOT_FOUND);
	}else{
		RequestDispatcher rd = request.getRequestDispatcher(singerMap.get(name)[1]);
		rd.forward(request, response);
	}
	
%>




















