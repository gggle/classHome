<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	BigDecimal factorial(int operand)	{
		if(operand < 0){
			throw new IllegalArgumentException("음수는 팩토리얼 연산 불가");
			//SQLException 에러 메세지는 사용하지 못한다. 이 예외 처리를 할때는 throws혹은 try-catch를 해야한다.
		}else if(operand <= 1){
			return new BigDecimal(operand);			
		}else{
			return new BigDecimal(operand).multiply(factorial(operand-1));
		}
	}
%>  
<%
	String opStr = request.getParameter("operand");
	boolean flag = false;
	if(opStr !=null && opStr.matches("\\d{2}|100")){
		flag=true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/factorial.jsp</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/02/factorial.jsp">
		Factorial operand : <input type="number" min="1" max="100" name ="operand" value="<%=opStr%>"/>
		<button type="submit">전송</button>
	</form>
	<%
// 		String operandStr = request.getParameter("operand");
		//검증(null인 경우)
// 		if(operandStr == null || operandStr.length() == 0){
// 			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
// 			return;
// 		}
		//통과
// 		int operand = Integer.parseInt(operandStr);
// 		//검증(1보다 작은경우, 100보다 큰경우)
// 		if(operand < 1 || operand > 100){
// 			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
// 			return;
// 		}
		if(flag){
			int operand = Integer.parseInt(opStr);
	%>
	<div>
		<%=factorial(operand) %>
	</div>
	<%
		}
	%>
</body>
</html>