<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
   .sunday{
      background-color: red;
   }
   .saturday{
      background-color: blue;
   }
   table{
      width: 100%;
      height: 500px;
      border-collapse: collapse;
   }
   td,th{
      border: 1px solid black;
   }
</style>
<script type="text/javascript">
   function eventHandler(year, month) {
      var form = document.calForm;
      if(year && month ||month==0){
         form.year.value=year;
         form.month.value=month;
      }
      form.submit();
      return false;
   }
</script>
<%
	request.setCharacterEncoding("UTF-8");

// 해당 연도 , 월, 언어를 파라미터값으로 가져와 String형 변수에 저장합니다.	
   String yearStr = request.getParameter("year");
   String monthStr = request.getParameter("month");
   String language = request.getParameter("language");

   // 클라이언트의 지역정보를 가져온다.
   Locale clinetLocale = request.getLocale();
   
   //언어를 선택하면 그 언어로 바뀌게 설정
   if(language!=null && language.trim().length()>0){
      clinetLocale = Locale.forLanguageTag(language);
   }
   
   //요일을 가져와 세팅을 해준다.
   DateFormatSymbols symbols = new DateFormatSymbols(clinetLocale);
   //calendar 객체를 가져온다.
   Calendar cal = getInstance();
   
   //if문에 속하면 파라미터값으로 받은 년/월로 셋팅된다.
   if(yearStr !=null && yearStr.matches("\\d{4}")
         && monthStr != null && monthStr.matches("1[0-1]|\\d")){
      cal.set(YEAR, Integer.parseInt(yearStr));
      cal.set(MONTH, Integer.parseInt(monthStr));
   }
   int currentYear = cal.get(YEAR);
   int currentMonth = cal.get(MONTH);
   
   //달력객체의 '일'을 1일로 설정한다.
   cal.set(DAY_OF_MONTH, 1);
   //처음시작하는 요일을 가져온다.
   int firstDayOfWeek = cal.get(DAY_OF_WEEK);
   //공백설정
   int offset = firstDayOfWeek -1;
   //마지막 날짜 설정
   int lastDate = cal.getActualMaximum(DAY_OF_MONTH);
   
   //이전달
   cal.add(MONTH, -1);
   int beforeYear = cal.get(YEAR);
   int beforeMonth = cal.get(MONTH);
   
   //다음달
   cal.add(MONTH, 2);
   int nextYear = cal.get(YEAR);
   int nextMonth = cal.get(MONTH);
   
   //현재 시스템에서 제공하는 모든 locale정보 제공
   Locale[] locales = Locale.getAvailableLocales();
%>
<form name="calForm" method="post">
<input type="hidden" name="command" value="calendar"/>
<h4>
<a href="javascript:eventHandler(<%=beforeYear %>, <%=beforeMonth%>);">이전달</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="number" name="year" value="<%=currentYear%>"
   onblur="eventHandler();"
/>년
<select name="month" onchange="eventHandler();">
   <%
//    	  월요일이면 월 화요일이면 화 로 출력 November를 Nov
      String[] monthStrings = symbols.getShortMonths();
      for(int idx = 0; idx < monthStrings.length; idx++){
         out.println(String.format("<option value='%d' %s>%s</option>", 
               idx, idx==currentMonth?"selected":"" ,monthStrings[idx]));
      }
   %>
</select>
<select name="language" onchange="eventHandler();">
   <%
      //언어선택 UI   
      for(Locale tmp : locales){
         out.println(String.format("<option value='%s' %s>%s</option>", tmp.toLanguageTag(),
               tmp.equals(clinetLocale)?"selected":"",tmp.getDisplayLanguage(clinetLocale)));         
      }
   %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a onclick="eventHandler(<%=nextYear%>,<%=nextMonth%>);">다음달</a>
</h4>
</form>
<table>
<thead>
   <tr>
      <%
         //요일출력
         String[] dateStrings = symbols.getShortWeekdays();
         for(int idx = Calendar.SUNDAY; idx<=Calendar.SATURDAY; idx++){
            out.println(String.format("<th>%s</th>", dateStrings[idx]));
         }
      %>
   </tr>
</thead>
<tbody>

<%
   //날짜 출력
   int dayCount = 1;
   for(int row=1; row <=6; row++){
      %>
      <tr>
      <%
      for(int col=1; col <=7; col++){
         int dateChar = dayCount++ - offset; //날짜를 맞게 출력
         if(dateChar < 1 || dateChar > lastDate){
            out.println("<td>&nbsp;</td>");
         }else{   
            String clzValue = "normal";
            if(col==1){
               clzValue = "sunday";
            }else if(col==7){
               clzValue = "saturday";
            }
         out.println(String.format(
               "<td class='%s'>%d</td>", clzValue, dateChar
               ));
         }
      }
      %>
      </tr>
      <%
   }
%>
</tbody>
</table>
