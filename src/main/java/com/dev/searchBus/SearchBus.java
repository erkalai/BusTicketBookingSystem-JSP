package com.dev.searchBus;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchBus extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String source_destinaton = request.getParameter("source") + request.getParameter("destination");
		String departure_date =request.getParameter("onward");
		
	
		
		
		
		String searchTerm = request.getParameter("query");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		List<Map<String, Object>> result = new ArrayList<>();
		
		// Database connection 
        String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=BusBooking;encrypt=true;trustServerCertificate=true";
        String jdbcUsername = "root";
        String jdbcPassword = "root";
        
        
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "SELECT* FROM bus_details WHERE source_destinaton=? AND departure_date=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            
            
            preparedStatement.setString(1, source_destinaton);
            preparedStatement.setString(2, departure_date);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            
            
            

                while (resultSet.next()) {
                	Map<String, Object> busDetail = new HashMap<>();
                	
                	// Add each column value to the map, where the column name is the key
                    busDetail.put("busName", resultSet.getString("bus_name"));
                    busDetail.put("departureDate", resultSet.getString("departure_date"));
                    busDetail.put("arrivalDate", resultSet.getString("arrival_date"));
                    busDetail.put("departureTime", resultSet.getString("departure_time"));
                    busDetail.put("arrivalTime", resultSet.getString("arrival_time"));
                    busDetail.put("startPlace", resultSet.getString("start_place"));
                    busDetail.put("endPlace", resultSet.getString("end_place"));
                    busDetail.put("duration", resultSet.getString("duration"));
                    busDetail.put("seaterPrice", resultSet.getString("seater_price"));
                    busDetail.put("sleeperPrice", resultSet.getString("sleeper_price"));
                    
                    // Add the map to the result list
                    result.add(busDetail);
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert the list to JSON format

        System.out.println("JSON");
        String jsonResponse = new com.google.gson.Gson().toJson(result);
        out.write(jsonResponse);
        System.out.println(jsonResponse);
		
	}
}
