package com.dev.addBus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addBusDetails")
public class AddBus extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		
		
		String busId = request.getParameter("busId");
		String busName = request.getParameter("busName");
		String busRoute = request.getParameter("busRoute");
		String departureDate = request.getParameter("departureDate");
		String arrivalDate = request.getParameter("arrivalDate");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");
		String startPlace = request.getParameter("startPlace");
		String endPlace = request.getParameter("endPlace");
		String sourceDestination = startPlace+ endPlace;
		String layOut = request.getParameter("layOut");
		String seaterPrice = request.getParameter("seaterPrice");
		String sleeperPrice = request.getParameter("sleeperPrice");
		String duration = request.getParameter("duration");
		String s1 = "0";
		String s2 = "0";
		String s3 = "0";
		String s4 = "0";
		String s5 = "0";
		String s6 = "0";
		String s7 = "0";
		String s8 = "0";
		String s9 = "0";
		String s10 = "0";
		String s11 = "0";
		String s12 = "0";
		String s13 = "0";
		String s14 = "0";
		String s15 = "0";
		String s16 = "0";
		String s17 = "0";
		String s18 = "0";
		String s19 = "0";
		String s20 = "0";
		String s21 = "0";
		String s22 = "0";
		String s23 = "0";
		String s24 = "0";
		String s25 = "0";
		String s26 = "0";
		String s27 = "0";
		String s28 = "0";
		String s29 = "0";
		String s30 = "0";
		
		
		
		RequestDispatcher dispatcher = null;
//		Connection con = null;
//		PrintWriter out = response.getWriter();
//		out.print(uname);
		
		try {
			
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
	         PreparedStatement pst = con.prepareStatement("sp_add_bus ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?");
	         System.out.print("Inside try");
	         pst.setString(1,busId );
	         pst.setString(2,busName );
	         pst.setString(3,busRoute );
	         pst.setString(4,sourceDestination);
	         pst.setString(5,departureDate );
	         pst.setString(6,arrivalDate );
	         pst.setString(7,departureTime );
	         pst.setString(8,arrivalTime );
	         pst.setString(9,startPlace );
	         pst.setString(10,endPlace );
	         pst.setString(11, layOut);
	         pst.setString(12, duration);
	         pst.setString(13, seaterPrice);
	         pst.setString(14, sleeperPrice);
	         pst.setString(15,s1 );
	         pst.setString(16,s2 );
	         pst.setString(17,s3 );
	         pst.setString(18,s4 );
	         pst.setString(19,s5 );
	         pst.setString(20,s6 );
	         pst.setString(21,s7 );
	         pst.setString(22,s8 );
	         pst.setString(23,s9 );
	         pst.setString(24,s10 );
	         pst.setString(25,s11 );
	         pst.setString(26,s12 );
	         pst.setString(27,s13 );
	         pst.setString(28,s14 );
	         pst.setString(29,s15 );
	         pst.setString(30,s16 );
	         pst.setString(31,s17 );
	         pst.setString(32,s18 );
	         pst.setString(33,s19 );
	         pst.setString(34,s20 );
	         pst.setString(35,s21 );
	         pst.setString(36,s22 );
	         pst.setString(37,s23 );
	         pst.setString(38,s24 );
	         pst.setString(39,s25 );
	         pst.setString(40,s26 );
	         pst.setString(41,s27 );
	         pst.setString(42,s28 );	         
	         pst.setString(43,s29 );
	         pst.setString(44,s30 );
	         
	         int rowCount = pst.executeUpdate();
	         if (rowCount != 0) {
	        	 request.setAttribute("status", "success");
	        	 dispatcher = request.getRequestDispatcher("addBus.jsp");
	         }else {
	        	 request.setAttribute("status", "failed");
	         }
	         dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
//		finally {
//			try {
//				con.close();
//			}catch(SQLException e) {
//				
//			}
//		}
	}
}
