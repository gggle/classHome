<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12/jstlDesc.jsp</title>
</head>
<body>
   
<h4>JSTL(Jsp Standard Tag Library)</h4>
<pre>
   : 커스텀 태그들을 모아 놓은 라이브러리 형태
   커스텀 태그의 사용방법 : &lt;prefix:tagName attributes ... /&gt;
   
   ** JSTL 사용을 위해 먼저, taglib 로딩
   1.Core 태그
      1) EL 변수(속성) 지원 : set, remove
         &lt;c:set var="속성명" value="속성값" scope="영역"/&gt;
         &lt;c:remove var="속성명" scope="영역"/&gt; -**속성 삭제시 영역을 명시할 것
         <c:set var="testAttr" value="테스트" scope="request" />
         ${requestScope.testAttr }
         <c:remove var="testAttr" scope="session" />
         ${requestScope.testAttr }
      2) 제어문
         - 조건문 : if(조건식){조건블럭}
            <c:if test="${empty requestScope.testAttr }">
               testAttr이 지워짐
            </c:if>
            <c:if test="${not empty requestScope.testAttr }">
               testAttr이 지워지지 않았음
            </c:if>
         - 다중조건문 : choose when(조건) otherwise
         <c:choose>
               <c:when test="${empty requestScope.testAttr }">
                  testAttr이 지워짐
               </c:when>
            <c:otherwise>
               testAttr이 지워지지 않았음
            </c:otherwise>
         </c:choose>
         - 반복문 : forEach forTokens
            **LoopTagStatus 객체 : begin, end , step, index, count, first(boolean), last(boolean)
            for(선언절;조건절;증감절){}, for(블럭변수선언:반복대상집합객체){}
           <c:set var="sampleList" value='<%=Arrays.asList("listvalue1","listvalue2") %>'></c:set>
           <c:forEach items="" var=""></c:forEach>
      3) URL 재처리(Rewrite)
      4) 기타기능
   2.Fmt 태그
   3.Fn 라이브러리







</pre>






</body>
</html>