package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScriptHtmlCssServlet
 */
@WebServlet("/ScriptHtmlCssServlet")
public class ScriptHtmlCssServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ScriptHtmlCssServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		request.getSession().setAttribute("ScriptJC", code);
		request.setAttribute("code", code);
		request.getRequestDispatcher("/JsHtml/jhc.jsp").forward(request, response);
	}

}
