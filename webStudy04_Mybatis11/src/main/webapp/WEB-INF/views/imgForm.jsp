<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script type="text/javascript">
  	$(function(){
  		var imgArea = $("#imgArea");
  		var pattern ='<img src="imageService?image=%v"/>';
  		$("[name='image']").on("change",function(){
  			var filename = $(this).val();
  			imgArea.append(pattern.replace("%v",filename));
  		});
  	});
  </script>
	<form name="imgForm" action="imageService" method="get">
		<select name ="image">
			<%=request.getAttribute("optionsAttr")%>
		</select>
	</form>
	<div id="imgArea">
		<%=request.getAttribute("imgTags") %>
	</div>
