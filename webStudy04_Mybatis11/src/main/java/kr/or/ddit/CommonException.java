package kr.or.ddit;

/**
 * @author 한규연
 * @since 2018. 11. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2018. 11. 21.     한규연       어플리케이션에서 전역적으로 활용할 unchecked exception
 * Copyright (c) 2018 by DDIT All right reserved
 * </pre>
 */
public class CommonException extends RuntimeException {

	public CommonException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommonException(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
		super(arg0, arg1, arg2, arg3);
		// TODO Auto-generated constructor stub
	}

	public CommonException(String arg0, Throwable arg1) {
		super(arg0, arg1);
		// TODO Auto-generated constructor stub
	}

	public CommonException(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public CommonException(Throwable arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}
	
}
