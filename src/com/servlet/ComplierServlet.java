package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ComplierService;

/**
 * Servlet implementation class complierServlet
 */
@WebServlet("/complierServlet")
public class ComplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ComplierService complierService = null;
	public ComplierServlet()
	{
		this.complierService = new ComplierService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String code = request.getParameter("code");
		String message = null;
		try {
			message = complierService.complier(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("test--dsfadsfaadsf--");
		PrintWriter print = response.getWriter();
		print.write(message);
		print.close();
		
		
	}

}
