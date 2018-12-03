<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/applicationDesc.jsp</title>
</head>
<body>
<h4>ServletContext</h4>
<pre>
	<%=application.hashCode() %>
	<a href="<%=request.getContextPath() %>/06/implicitObject.jsp">implicitObject.jsp로 이동</a>
	<a href="<%=request.getContextPath() %>/desc">DescriptionServlet으로 가기</a>
		: 컨텍스트와 해당 컨텍스트를 운영(관리)중인 서버에 대한 정보를 가진 객체
		
		1.서버에 대한 정보 획득
			<%=application.getServerInfo() %>
			<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
			<%=application.getMimeType("test.hwp") %>
		2.로그 기록(logging)
			<%
				application.log("명시적으로 기록한 로그 메세지");
			%>
		3.컨텍스트 파라미터 (어플리케이션의 초기화 파람미터) 획득
			<%=application.getInitParameter("param1") %>
			<%
				Enumeration<String> names = application.getInitParameterNames();
				while(names.hasMoreElements()){
					out.println(application.getInitParameter(names.nextElement()));
				}
			%>
		4.웹리소스를 획득 : http://localhost/webStudy01/images/Koala.jpg
		  			  (서버사이드 주소방식) : /images/Koala.jpg
		<%=application.getRealPath("/images/Tulips.jpg")  %>
		결과 => D:\A_TeachingMaterial\6.JspSrpgin\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\webStudy01\images\Tulips.jpg
		<%
			String fileSystemPath = application.getRealPath("/images/Tulips.jpg");
			File srcFile = new File(fileSystemPath);
			File targetFolder = new File(application.getRealPath("/06/"));
			//원본 파일명 사용
			File targetFile = new File(targetFolder, srcFile.getName());
// 			System.out.println(targetFile.exists());
			int pointer =-1;
			byte[] buffer = new byte[1024];
			try(			
// 					FileInputStream fis = new FileInputStream(srcFile);
					InputStream fis = application.getResourceAsStream("/images/Tulips.jpg");
					FileOutputStream fos = new FileOutputStream(targetFile);
			){
				while((pointer = fis.read(buffer))!=-1){
					fos.write(buffer,0,pointer);
				}
			}

			
			
			%>
		결과 => D:\A_TeachingMaterial\6.JspSrpgin\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\webStudy01\images\Tulips.jpg
</pre>
	<img src="<%=request.getContextPath() %>/06/Tulips.jpg">
	<img src="<%=request.getContextPath() %>/images/Tulips.jpg">

</body>
</html>































