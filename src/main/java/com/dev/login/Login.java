package com.dev.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet{

	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		RequestDispatcher dispatcher = null;
		Connection con = null;
//		PrintWriter out = response.getWriter();
//		out.print(uname);
		
		
		try {
			
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
	         PreparedStatement pst = con.prepareStatement("select * from user_tbl where email = ? AND password = ?");
	         pst.setString(1, email);
	         pst.setString(2, password);
	         ResultSet rs = pst.executeQuery();
	         if (rs.next()) {
	        	 session.setAttribute("uname",rs.getString("name"));

	        	 dispatcher = request.getRequestDispatcher("search-showBusDetails.jsp");
	         }else {
	        	 request.setAttribute("status", "failed");

	        	 dispatcher = request.getRequestDispatcher("login.jsp");
	         }
	         dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
