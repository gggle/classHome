<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<BuyerVO> buyerList = (List)request.getAttribute("buyerList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
   integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
   crossorigin="anonymous">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
   integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
   integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
   crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#listBody").on("click","tr",function(){
		var buyer_id = $(this).find("td:first").text();
		location.href = "<%=request.getContextPath()%>/buyer/buyerView.do?what="+buyer_id;
	});
	
});
</script>
</head>
<body>
	
	<form>
	<table class="table">
		<thead class="thead-dark">
		<tr>
			<td>
				<input type="button" onclick="location.href = '<%=request.getContextPath() %>/buyer/buyerForm.do';" value="신규등록">
			</td>
		</tr>
		
		<tr>
			<th>BUYER_ID</th>
			<th>BUYER_NAME</th>
			<th>BUYER_LGU</th>
			<th>BUYER_BANK</th>
			<th>BUYER_BANKNO</th>
			<th>BUYER_BANKNAME</th>
			<th>BUYER_ZIP</th>
			<th>BUYER_ADD1</th>
			<th>BUYER_ADD2</th>
			<th>BUYER_COMTEL</th>
			<th>BUYER_FAX</th>
			<th>BUYER_MAIL</th>
			<th>BUYER_CHARGER</th>
			<th>BUYER_TELEXT</th>
		</tr>
		</thead>
		<tbody id="listBody">
			<%
				if(buyerList.size()>0){
				for(BuyerVO buyer : buyerList){
					%>
					<tr>
					<td><%=buyer.getBuyer_id() %></td>
					<td><%=buyer.getBuyer_mail() %></td>
					<td><%=buyer.getBuyer_fax() %></td>
					<td><%=buyer.getBuyer_comtel() %></td>
					<td><%=buyer.getBuyer_lgu() %></td>
					<td><%=buyer.getBuyer_name() %></td>
					<td><%=buyer.getBuyer_charger() %></td>
					<td><%=buyer.getBuyer_add2() %></td>
					<td><%=buyer.getBuyer_add1() %></td>
					<td><%=buyer.getBuyer_telext() %></td>
					<td><%=buyer.getBuyer_bankname() %></td>
					<td><%=buyer.getBuyer_bankno() %></td>
					<td><%=buyer.getBuyer_bank() %></td>
					<td><%=buyer.getBuyer_zip() %></td>
					</tr>
					<%
					
				}
			}else{
				%>
				<tr>
					<td colspan="14">존재하는 바이어가 없어 </td>
				</tr>
				<%
			}
			%>
		</tbody>
		<tfoot>
		<form>
			<tr>
			
				<td><input type="text"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</form>
		</tfoot>
	</table>
	</form>
	
</body>
</html>