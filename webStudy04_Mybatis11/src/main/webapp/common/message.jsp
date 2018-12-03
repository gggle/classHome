<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>공통 메세지 뷰</h4>
	<%
		String goLink = (String) session.getAttribute("goLink");
		String message = (String) session.getAttribute("message");
	%>
		<%=message%>
		<br>
		<%
		if (StringUtils.isNotBlank(goLink) && StringUtils.isNotBlank(message)) {
		%>
		<a href="<%=request.getContextPath()%><%=goLink%>">요기로 가세요~</a>
	<%
			session.removeAttribute("message");
			session.removeAttribute("goLink");
			
		}
		if(new Boolean(true).equals(session.getAttribute("isRemoved"))){
			session.invalidate(); // 세션 만료
		}
	%>
</body>
</html>