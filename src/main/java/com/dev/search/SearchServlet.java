package com.dev.search;



import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("query");

        
        System.out.println("Search Servlet");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        List<String> result = new ArrayList<>();

        // Database connection setup (use your database credentials)
        String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP;encrypt=true;trustServerCertificate=true";
        String jdbcUsername = "Kalai";
        String jdbcPassword = "88833";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "SELECT station FROM tbl_stations WHERE station LIKE ?";
            System.out.println("inside try");
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, "%" + searchTerm + "%");

                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    result.add(resultSet.getString("station"));
                    System.out.println(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert the list to JSON format
        String jsonResponse = new com.google.gson.Gson().toJson(result);
        out.write(jsonResponse);
    }
}





//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import java.io.*;
//import java.util.*;
//import java.sql.*;
//
//public class SearchServlet extends HttpServlet {
//  
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		System.out.println("RUN JAVA");
//        String query = request.getParameter("query");
//        List<String> results = new ArrayList<>();
//
//        if (query != null && !query.trim().isEmpty()) {
//            // Connect to the database and perform a search based on the query
//            // Example assumes you are searching in a table named 'items'
//        	System.out.println("IF");
//
//            try {
//                // Set up database connection (adjust as per your DB configuration)
//                String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP;encrypt=true;trustServerCertificate=true";
//                String dbUsername = "Kalai";
//                String dbPassword = "88833";
//                Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
//                System.out.println("INSIDE TRY");
//
//                String sql = "SELECT station FROM tbl_stations WHERE station LIKE ?";
//                PreparedStatement stmt = conn.prepareStatement(sql);
//                stmt.setString(1, "%" + query + "%");
//                ResultSet rs = stmt.executeQuery();
//
//                while (rs.next()) {
//                    results.add(rs.getString("station"));
//                    System.out.println(rs);
//                }
//
//                // Close the database connection
//                rs.close();
//                stmt.close();
//                conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//                System.out.println(e);
//            }
//        }
//
//        // Return the search results as HTML
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        if (!results.isEmpty()) {
//            out.println("<ul>");
//            for (String result : results) {
//                out.println("<li>" + result + "</li>");
//            }
//            out.println("</ul>");
//        } else {
//            out.println("<p>No results found</p>");
//        }
//    }
//}
