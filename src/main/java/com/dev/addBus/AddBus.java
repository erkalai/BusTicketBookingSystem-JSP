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
		
		
		RequestDispatcher dispatcher = null;
//		Connection con = null;
//		PrintWriter out = response.getWriter();
//		out.print(uname);
		
		try {
			
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
	         PreparedStatement pst = con.prepareStatement("sp_add_bus ?,?,?,?,?,?,?,?,?,?,?,?,?,?");
	         System.out.print("Add Bus");
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
