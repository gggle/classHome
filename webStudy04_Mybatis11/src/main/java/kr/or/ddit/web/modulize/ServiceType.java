package kr.or.ddit.web.modulize;

public enum ServiceType {
   GUGUDAN("/01/gugudanForm.html") ,LYRICS("/02/musicForm.jsp"), CALENDAR("/04/calendar.jsp"), IMAGE("/imageForm"),
   GUGUDANPROCESS("/gugudan.do");
   private String servicePage;
   
   private ServiceType(String servicePage) {
         this.servicePage = servicePage;
   }
   
   public String getServicePage() {
      return servicePage;
   }
}