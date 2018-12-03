<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	BuyerVO buyer = (BuyerVO)request.getAttribute("buyer");
	List<Map<String,Object>> buyerList = (List) request.getAttribute("buyerList");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
	<table>
	<thead>
	<tr>
	</tr>
	<tr>
		<th>buyer_name</th>
		<td><input type="text" name="buyer_name"
			value="${buyer.buyer_name}" /></td>
	</tr>
	<tr>
		<th>buyer_lgu</th>
		<td><div class="input-group">
					<select name="buyer_lgu">
						<option value="">분류선택</option>
						<%
// 							for(Map<String, Object> buyerLgu : buyerList){
								%>
<%-- 								<option value="${buyer.buyer_lgu}">${buyer.buyer_lgu}</option> --%>
								<%
// 							}
						%>
					</select>
					<span class="input-group-text error">${errors["buyer_lgu"]}</span>
				</div></td>
	</tr>
	<tr>
		<th>buyer_bank</th>
		<td><input type="text" name="buyer_bank"
			value="<%=buyer.getBuyer_bank()%>" /></td>
	</tr>
	<tr>
		<th>buyer_bankno</th>
		<td><input type="text" name="buyer_bankno"
			value="<%=buyer.getBuyer_bankno()%>" /></td>
	</tr>
	<tr>
		<th>buyer_bankname</th>
		<td><input type="text" name="buyer_bankname"
			value="<%=buyer.getBuyer_bankname()%>" /></td>
	</tr>
	<tr>
		<th>buyer_zip</th>
		<td><input type="text" name="buyer_zip"
			value="<%=buyer.getBuyer_zip()%>" /></td>
	</tr>
	<tr>
		<th>buyer_add1</th>
		<td><input type="text" name="buyer_add1"
			value="<%=buyer.getBuyer_add1()%>" /></td>
	</tr>
	<tr>
		<th>buyer_add2</th>
		<td><input type="text" name="buyer_add2"
			value="<%=buyer.getBuyer_add2()%>" /></td>
	</tr>
	<tr>
		<th>buyer_comtel</th>
		<td><input type="text" name="buyer_comtel"
			value="<%=buyer.getBuyer_comtel()%>" /></td>
	</tr>
	<tr>
		<th>buyer_fax</th>
		<td><input type="text" name="buyer_fax"
			value="<%=buyer.getBuyer_fax()%>" /></td>
	</tr>
	<tr>
		<th>buyer_mail</th>
		<td><input type="text" name="buyer_mail"
			value="<%=buyer.getBuyer_mail()%>" /></td>
	</tr>
	<tr>
		<th>buyer_charger</th>
		<td><input type="text" name="buyer_charger"
			value="<%=buyer.getBuyer_charger()%>" /></td>
	</tr>
	<tr>
		<th>buyer_telext</th>
		<td><input type="text" name="buyer_telext"
			value="<%=buyer.getBuyer_telext()%>" /></td>
	</tr>
	</thead>
	<tbody>
	
	</tbody>
	
	<tfoot>
		<tr>
			<td>
				<input type="submit" value="등록">
			</td>
		</tr>
	</tfoot>
	</table>
</form>
	
</body>
</html>