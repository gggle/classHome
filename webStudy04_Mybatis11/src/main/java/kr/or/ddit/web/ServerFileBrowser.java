package kr.or.ddit.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileBrowser.do")
public class ServerFileBrowser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext sc = req.getServletContext();

		String fileName = req.getParameter("fileName");
		System.out.println(fileName);
		String folderpath = sc.getRealPath("/");
		File folder = new File(folderpath);
		File[] files = folder.listFiles(); // 파일의 리스트를 대입
		StringBuffer folderList = new StringBuffer();
		String[] list = new String[files.length];
		String pattern = "<li id='dd%d'>%s</li>";

		if (fileName == null) { // 처음에 널이기 때문에 여기를 탄다.
			fileName = "01";
			files = folder.listFiles(); // 폴더 리스트
			for (int i = 0; i < files.length; i++) {
				if (!files[i].isFile()) {
					list[i] = files[i].getName();
				}
			}
		} else {
			if (fileName.contains("html") || fileName.contains("jsp")) {
				fileName = "/01";
			} else {
				String filepath = sc.getRealPath("/" + fileName);
				File file = new File(filepath);
				files = file.listFiles(); // 폴더 리스트
				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile()) {
						list[i] = files[i].getName();
					}
				}
			}
		}
		int foldersize = 0;
		for (String foldername : list) {
			if (foldername != null) {
				folderList.append(String.format(pattern, foldersize, foldername));
				foldersize++;
			}
		}

		req.setAttribute("list", folderList);

		String view = "/WEB-INF/views/fileBrowser.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
