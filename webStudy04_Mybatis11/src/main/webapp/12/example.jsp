<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12/example.jsp</title>
<style>
   .green{color:green;}
   .yellow{color:yellow;}
   .red{color:red; background-color: red; }
   .silver{color:silver;}
   .aqua{color:aqua; background-color: aqua;}
   .orange{color:orange;}
   

</style>
</head>
<body>
<form>
		2단부터 9단까지 구구단을 승수 1~9까지 table태그로 출력 첫번째단은 파란색 배경 네번째 단은 빨간색 배경 
		<c:set var="mindan" value="${empty param.mindan?2:param.mindan }"></c:set>
		<c:set var="maxdan" value="${empty param.mindan?9:param.mindan }"></c:set>
		
		 최소 단 :<input	type="number" name="mindan" value="${mindan }">
		최대단 :<input type="number" name="maxdan" value="${maxdan }">
		<table>

			<c:forEach var="gugudan" begin="${mindan }"
				end="${maxdan }" varStatus="lts">
				<c:set var="colorClz" value="normal"></c:set>
				<c:if test="${lts.first}">
					<c:set var="colorClz" value="aqua"></c:set>
				</c:if>
				<c:if test="${lts.count eq 4}">
					<c:set var="colorClz" value="red"></c:set>
				</c:if>
				<tr class="${colorClz }">
					<c:forEach var="su" begin="1" end="9">
						<td>${gugudan }*${su }= ${gugudan*su }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>




		당신의 나이는? <input type="number" name="age" value="${param.age }"/>
   <input type="submit" value="전송" /> <br>
   
   <c:set var="age" value="${param.age }" />
   <c:if test="${not empty age }">
      <c:choose>
         <c:when test="${age ge 20 and age lt 30 }" >
            <c:set var="msg" value="반갑다 친구야"/>
            <c:set var="clz" value="green"/>
         </c:when>
         <c:when test="${age ge 30 and age lt 40 }" >
            <c:set var="msg" value="방가 행님"/>
            <c:set var="clz" value="yellow"/>
         </c:when>
         <c:when test="${age ge 40 and age lt 50 }" >
            <c:set var="msg" value="담배 끊고 건강관리"/>
            <c:set var="clz" value="red"/>
         </c:when>
         <c:when test="${age ge 50 and age lt 60 }" >
            <c:set var="msg" value="아빠?"/>
            <c:set var="clz" value="silver"/>
         </c:when>
         <c:when test="${age ge 60}" >
            <c:set var="msg" value="무슨일로 오셨나용?"/>
            <c:set var="clz" value="aqua"/>
         </c:when>
         <c:otherwise>
            <c:set var="msg" value="나가 놀아라"/>
            <c:set var="clz" value="orange"/>
         </c:otherwise>
      </c:choose>
      
      <div id="msgArea" class="${clz }">
         ${msg }
      </div>
   </c:if>
</form>
</body>
</html>





















