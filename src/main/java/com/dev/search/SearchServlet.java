package com.dev.search;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/search")
public class SearchServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		String query = request.getParameter("query");
		List<String> results = searchDatabase(query);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		out.print(gson.toJson(results));
		out.flush();
	}

	private List<String> searchDatabase(String query) {
		
		List<String> results = new ArrayList<>();
		
		String dbUrl = "jdbc:sqlserver://localhost:1433;databasename=JSP";
		String dbUser = "Kalai";
		String dbPassword = "88833";
		
		try(Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPassword) ) {
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=JSP;TrustServerCertificate=True;user=kalai;password=88833");
	        
			String sql = " SELECT * FROM tbl_place WHERE place LIKE ? ";
				try (PreparedStatement statement = con.prepareStatement(sql)) {
					statement.setString(1, "%" + query + "%");
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						results.add(rs.getString("place"));
					}
				}catch(Exception e) {
					
				}
	        
			
		}catch(Exception e) {
			
		}
		return results;
		

	}
}
