<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11/elObject.jsp</title>
</head>
<body>
<h4> EL의 기본객체 </h4>
<pre>
   <%
      pageContext.setAttribute("test+5", "테스트 벨류");
   %>

   1. Scope 객체(Map&lt;String,Object&gt;) : pageScope, requestScope, sessionScope, applicationScope
<%--    ${pageScope.test 5 },  --%>
      ${pageScope["test 5"] }
      ${not empty sessonScope.authMember? sessionScope.authMember["mem_id"]:"로그인 안함" }
   2. Parameter 객체 param(Map&lt;String,String&gt;), paramValues(Map&lt;String,String[]&gt;)
   ${param.test }, ${param["test"] }
   ${paramValues.test[0] }, ${paramValues["test"][1] }
   3. Header 객체 header(Map&lt;String,String&gt;),headerValues
 		accept :  ${header.accept },
  		유저해더 : ${header["user-agent"] }
 		<%-- accept :  ${headerValues.accept }, --%>
  		유저해더 : ${headerValues["user-agent"] }
   4. Cookie 객체
   ${cookie.JSESSIONID.value }, ${cookie["JSESSIONID"]["value"] }
   5. 컨텍스트 파라미터 객체 initParam(Map&lt;String,String&gt;)
   ${initParam.contentFolder }, <%=application.getInitParameter("contentFolder") %>
   ${initParam["contentFolder"] }, 
   
   6. pageContext
   

</pre>

</body>
</html>