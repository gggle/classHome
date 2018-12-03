<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BuyerVO buyerInfo = (BuyerVO) request.getAttribute("buyer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<td>BUYER_ID</td>
				<td>: <%=buyerInfo.getBuyer_id()%></td>
			</tr>
			<tr>
				<td>BUYER_NAME</td>
				<td>: <%=buyerInfo.getBuyer_name() %></td>
			</tr>
			<tr>
				<td>BUYER_LGU</td>
				<td>: <%=buyerInfo.getBuyer_lgu() %></td>
			</tr>
			<tr>
				<td>BUYER_BANK</td>
				<td>: <%=buyerInfo.getBuyer_bank() %></td>
			</tr>
			<tr>
				<td>BUYER_BANKNO</td>
				<td>: <%=buyerInfo.getBuyer_bankno() %></td>
			</tr>
			<tr>
				<td>BUYER_BANKNAME</td>
				<td>: <%=buyerInfo.getBuyer_bankname() %></td>
			</tr>
			<tr>
				<td>BUYER_ZIP</td>
				<td>: <%=buyerInfo.getBuyer_zip() %></td>
			</tr>
			<tr>
				<td>BUYER_ADD1</td>
				<td>: <%=buyerInfo.getBuyer_add1() %></td>
			</tr>
			<tr>
				<td>BUYER_ADD2</td>
				<td>: <%=buyerInfo.getBuyer_add2() %></td>
			</tr>
			<tr>
				<td>BUYER_COMTEL</td>
				<td>: <%=buyerInfo.getBuyer_comtel() %></td>
			</tr>
			<tr>
				<td>BUYER_FAX</td>
				<td>: <%=buyerInfo.getBuyer_fax() %></td>
			</tr>
			<tr>
				<td>BUYER_MAIL</td>
				<td>: <%=buyerInfo.getBuyer_mail() %></td>
			</tr>
			<tr>
				<td>BUYER_CHARGER</td>
				<td>: <%=buyerInfo.getBuyer_charger() %></td>
			</tr>
			<tr>
				<td>BUYER_TELEXT</td>
				<td>: <%=buyerInfo.getBuyer_telext() %></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				
			</tr>
		</tbody>
	</table>
</body>
</html>