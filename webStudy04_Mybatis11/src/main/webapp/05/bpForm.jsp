<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public Map<String,String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001" ,new String[]{"제니","/WEB-INF/BLACKPINK/jenny.jsp"});	
	singerMap.put("B002" ,new String[]{"지수","/WEB-INF/BLACKPINK/jisoo.jsp"});	
	singerMap.put("B003" ,new String[]{"리사","/WEB-INF/BLACKPINK/lisa.jsp"});	
	singerMap.put("B004" ,new String[]{"로제","/WEB-INF/BLACKPINK/rose.jsp"});	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/bpForm.jsp</title>
<script type="text/javascript">
	function eventHandler(){
		var form = document.forms[0];
		form.submit();
	}
</script>
</head>
<body>
<form action="<%=request.getContextPath() %>/05/getBp.jsp">
	<select name = "member" onchange="eventHandler();">
		<option value="">멤버검색</option>
<!-- 	1.일일이 다 쓰지 않고 향상된 for문을 돌려서 <option value="B001">제니</option> 형식 만들기 -->
		<%
			for(Entry<String, String[]> entry : singerMap.entrySet()){
				String name = entry.getKey();
				String value = entry.getValue()[0];
				out.println(String.format("<option value='%s'>%s</option>",name,value));
			}
		%>
	</select>
</form>
</body>
</html>