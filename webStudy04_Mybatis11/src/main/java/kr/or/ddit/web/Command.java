package kr.or.ddit.web;

public enum Command {
	GUGUDAN("/01/gugudanForm.html") ,LYRICS("/02/musicForm.jsp"), CALENDAR("/04/calendar.jsp"), IMAGE("/imageForm");
	
	private String url;
	
	private Command(String url) {
		this.url = url;
	}
	
	public String getUrl() {
		return url;
	}
	
	public static Command getCommand(String param) {
		Command command = null;
		command = Command.valueOf(param.toUpperCase());
		return command;
	}
}
