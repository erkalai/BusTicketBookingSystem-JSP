<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%
if(session.getAttribute("sessionId")==null){
	response.sendRedirect("index.jsp");
}
if(request.getParameter("logout")!=null){
	session.removeAttribute("sessionId");
	response.sendRedirect("index.jsp");
}


%>
    
<%@page import="java.sql.*"  %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PNR</title>

    <!-- Bootstrap Link -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%@include file="./loginHeaderAdmin.jsp" %>
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                    <tr class="text-center">
                         <th scope="col">Bus Id</th>
                            <th scope="col">Bus Name</th>
                            <th scope="col">Departure</th>
                            <th scope="col">Duration</th>
                            <th scope="col">Arrival</th>
                            <th scope="col">Price</th>
                        <th scope="col">Layout</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try{
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
                         PreparedStatement pst = con.prepareStatement("select * from bus_details");
                         
                         ResultSet rs = pst.executeQuery();
                        while(rs.next())
                        {        
                %>
                    <tr class=" align-middle text-center">
                        <th scope="row"><%= rs.getString("bus_id")  %></th>
                             <td >
                                <div class="fw-bold"><%= rs.getString("bus_name")  %></div>                       
                            </td>
                            <td >
                                <div class="sub-title"><%= rs.getString("departure_date")  %></div>
                                <div class="fw-bold"><%= rs.getString("departure_time")  %></div>
                                <div class="sub-title"><%= rs.getString("start_place")  %></div>                        
                            </td>
                            <td><div class="fw-bold"><%= rs.getString("duration")  %></div></td>
                            <td>
                                <div class="fw-bold"><%= rs.getString("arrival_time")  %></div>
                                <div class="sub-title"><%= rs.getString("end_place")  %></div> 
                            </td>
                            <td>
                                <div class="fw-bold">RS <%= rs.getString("seater_price")  %> / <%= rs.getString("sleeper_price")  %></div>
                                <div class="f6">37 Seats Available</div> 
                                <div class="btn btn-primary me-2">View Seats</div>
                            </td>
                            <td>
                                <div class="fw-bold"><%= rs.getString("seat_layout")  %></div>
                            </td>
                        <td>
                            <a href="http://" class="btn btn-primary mt-1">Show</a>
                            <a href="http://" class="btn btn-success mt-1">Print</a>
                            
                        </td>
                    </tr>
                    <%
                                        }
                    } catch(Exception e){
        
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
<!-- Bootstrap Link -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>