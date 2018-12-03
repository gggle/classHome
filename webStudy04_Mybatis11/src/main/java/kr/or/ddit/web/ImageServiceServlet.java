package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Arrays;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.utils.CookieUtil;
import kr.or.ddit.utils.CookieUtil.TextType;

@WebServlet(value = "/imageService") // image.205에서 action이 향하는 방향
public class ImageServiceServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 요청 파라미터 확보 : 파라미터명(image)

		String imgStr = req.getParameter("image");
		if (imgStr == null || imgStr.trim().length() == 0) { // 파라미터에 대한 검증과정
			resp.sendError(400); // 에러메세지 전송, 400->상태코드
			return;
		}

		File folder = (File) getServletContext().getAttribute("contentFolder");
		File imgFile = new File(folder, imgStr);
		if (!imgFile.exists()) { // exists() 존재하는지의 여부에 대한 검증
			resp.sendError(404); // 찾지 못한다
			return;
		}

		String imgCookieValue = new CookieUtil(req).getCookieValue("imageCookie");
		String[] cookieValues = null;
		// 마샬링을 하기 위한 오브젝트 맵퍼 자바를 제이슨 방식으로 변환하는 작업
		// marshailling
		ObjectMapper mapper = new ObjectMapper();
		if (StringUtils.isBlank(imgCookieValue)) {
			cookieValues = new String[] { imgFile.getName() };
		} else {
			String[] cValues = mapper.readValue(imgCookieValue, String[].class);
			cookieValues = new String[cValues.length + 1];
			System.arraycopy(cValues, 0, cookieValues, 0, cValues.length);
			cookieValues[cookieValues.length - 1] = imgFile.getName();
		}

//      imgCookieValue = Arrays.toString(cookieValues);
//      imgCookieValue = imgCookieValue.replaceAll("[\\[\\]\\s]", "");
		// marshalling

		imgCookieValue = mapper.writeValueAsString(cookieValues);
		System.out.println(imgCookieValue);

		// 이미지 파일의 이름을 쿠키에 저장
		Cookie imageCookie = CookieUtil.createCookie("imageCookie", imgCookieValue, req.getContextPath(), TextType.PATH,
				60 * 60 * 24 * 3);
		resp.addCookie(imageCookie);

		ServletContext context = req.getServletContext();
		resp.setContentType(context.getMimeType(imgStr));

		// File file = new File("D:\\contents\\"+imgStr);
		// 이미지 스트리밍...

		FileInputStream fis = new FileInputStream(imgFile);
		OutputStream out = resp.getOutputStream();
		byte[] buffer = new byte[1024];
		int pointer = -1;
		while ((pointer = fis.read(buffer)) != -1) { // buffer를 파라미터로 넘긴다 . 읽어들이 메소드는 buffer안에 있음 // -1: EOF문자
			out.write(buffer, 0, pointer); // 읽어들인 만큼만
		}
		fis.close();
		out.close();

	}

}