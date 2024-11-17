package com.dev.delete;

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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		
		
//		String bus_id = request.getParameter("bus_id");
		String S1 = "0";

		RequestDispatcher dispatcher = null;
		
		
		try {
			
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
	         PreparedStatement pst = con.prepareStatement("DELETE FROM bus_details where S27 = ? ");
	         pst.setString(1, S1);
	         
	         int deleteRow =pst.executeUpdate();
	         if (deleteRow != 0) {
	        	 request.setAttribute("status", "success");
	        	 dispatcher = request.getRequestDispatcher("addBus.jsp");
	         }else {
	        	 request.setAttribute("status", "failed");

	        	 dispatcher = request.getRequestDispatcher("addBus.jsp");
	         }
	         dispatcher.forward(request, response);
	         
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}




