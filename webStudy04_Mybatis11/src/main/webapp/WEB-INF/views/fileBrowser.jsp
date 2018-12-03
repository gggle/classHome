<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
		
	$(function() {

		$('#web').click(function() {
			if ($("#01").css("display") == "none") {
				$('#01').show();
			} else {
				$('#01').hide();
			}
		});
		
		 $(".u1 li").click(function (){
		    alert("실행 하나요 ?"+$(this).text());
		 
		    foldername = $(this).text();
		    $('input[name="fileName"]').val(foldername);
		    $('#fileForm').submit();
		    
		}); 
	
	});
		
</script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/fileBrowser.do" id="fileForm">
	<br>
	<label id="web">WebContent</label><br>
		<a href="javascript:history.go(-1)">뒤로가기</a>
	<div id="01">
		<ul class="u1">
			<%=request.getAttribute("list")%>
		</ul>
	</div>
	<input type="hidden" name="fileName" value="">	<br>
	</form>
</body>
</html>