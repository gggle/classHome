<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.DataBasePropertyVO"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10/jdbcDesc.jsp</title>
</head>
<body>
<h4>JDBC(Java DataBase Connectivity)</h4>
<pre>
   데이터베이스 연결 프로그래밍 단계
   1. 드라이버를 빌드패스에 추가
   2. 드라이버 클래스 로딩
   3. 연결 객체(Connection) 생성
   4. 쿼리 객체 생성
      Statement
      PreparedStatement
      CallableStatement
   5. 쿼리 실행(CRUD)
      ResultSet executeQuery : Select
      int(실행에 영향을 받은 레코드 수 ) ececuteUpdate : insert/update/delete
   6. 결과 집합 사용
   7. 자원의 해제 :finally블럭 /try-with ~ resource구문
   <%
      //2. 드라이버 클래스 로딩(방법2가지)
      //OracleDriver driver;
//       Class.forName("oracle.jdbc.driver.OracleDriver");
      //3.연결 객체 생성
      //어느 데이터베이스의 url을 쓴다. 1521:port넘버
//       String url ="jdbc:oracle:thin:@localhost:1521:xe";
//       String user="pc18";
//       String password="java";
      String[] headers=null;
      List<DataBasePropertyVO> dataList = new ArrayList<>();
      try(
//          Connection conn = DriverManager.getConnection(url, user, password);
         Connection conn = ConnectionFactory.getConnection();   //수정사항이 있을때 찾기 쉽다
         Statement stmt = conn.createStatement();
            ){
         //연결된 객체의 타입 확인
         out.println(conn.getClass());      //class oracle.jdbc.driver.T4CConnection
         //4.쿼리 객체 생성
         //5.쿼리 실행
         StringBuffer sql = new StringBuffer();
         sql.append(" SELECT property_name, property_value,description ");
         sql.append(" FROM DATABASE_PROPERTIES ");
         //6. 결과 집합 사용
         ResultSet rs = stmt.executeQuery(sql.toString());      //query문을 String형으로 변환한뒤 실행
         ResultSetMetaData rsmd = rs.getMetaData();
         //헤더 만들기
         headers = new String[rsmd.getColumnCount()];
         for(int idx = 1;idx<=rsmd.getColumnCount();idx++){
            headers[idx-1] = rsmd.getColumnName(idx);
         }
         dataList = new ArrayList<>();
         while(rs.next()){
         //rs.next() : 다음 에도 데이터가 존재 하는가?
            //1. vo객체 생성
            DataBasePropertyVO vo = new DataBasePropertyVO();
            //2. 데이터 삽입
            //select * from database_properties 이기 때문에 index번호를 쓸 수 없다.
            vo.setProperty_name(rs.getString("PROPERTY_NAME"));
            vo.setProperty_value(rs.getString("PROPERTY_VALUE"));
            vo.setDescription(rs.getString("DESCRIPTION"));
            //3.데이터 담기
            dataList.add(vo);
         
         }
      }//end try block
   %>
</pre>
<table>
   <thead>
      <tr>
      <%
         for(String head : headers){
      %>
            <th><%=head %></th>   
      <%
         }
      %>
      
      </tr>
   </thead>
   <tbody>
      <%
         for(DataBasePropertyVO vo : dataList){
      %>
            <tr>
               <td><%=vo.getProperty_name() %></td>
               <td><%=vo.getProperty_value() %></td>
               <td><%=vo.getDescription()  %></td>
            </tr>               
      <%
         }
      
      %>
   </tbody>

</table>
</body>
</html>


