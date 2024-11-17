package com.dev.searchBusInIndex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/indexSearchBus")
public class SearchBusInIndex extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String departure_date = request.getParameter("onward");

        // Validation
        if (source == null || destination == null || departure_date == null || source.isEmpty() || destination.isEmpty() || departure_date.isEmpty()) {
            request.setAttribute("errorMessage", "Please provide valid source, destination, and departure date.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        String source_destinaton = source + destination;
        List<Map<String, Object>> result = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(
                "jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
             PreparedStatement pst = con.prepareStatement("SELECT * FROM bus_details WHERE source_destinaton=? AND departure_date=?")) {

            pst.setString(1, source_destinaton);
            pst.setString(2, departure_date);

            try (ResultSet resultSet = pst.executeQuery()) {
                while (resultSet.next()) {
                    Map<String, Object> busDetail = new HashMap<>();
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

                    // Add bus details to result
                    result.add(busDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while fetching the bus details. Please try again.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        // Set the result list in request
        request.setAttribute("busDetails", result);

        // Forward JSP page to show the results
        request.getRequestDispatcher("/search-showBusDetailsWithoutLogin.jsp").forward(request, response);
    }
}
