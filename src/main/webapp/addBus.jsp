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
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap Link -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Style Link -->

<link rel="stylesheet" href="./assets/css/popup.css">

<title>Add Bus</title>
</head>
<body>
<%@include file="./loginHeader.jsp" %>
    <!-- Title -->
    <div class="text-center fw-bold fs-5">ADD BUS</div>

    <!-- Container Start -->
    <div class="continer ms-2  ">

    <!-- Add Bus button And Refresh Button start-->
        <div class="row ">
            <div class="col  ">
                <div id="button" class="button btn  btn-primary">
                    Add Bus
                </div>
                <a href="./addBus.jsp"><div id="button" class="button btn  btn-success">
                    Refresh
                </div></a>
            </div>
        </div>
        <!-- Add Bus button And Refresh Button End-->

        <!-- Table Start -->
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
                        <button class="btn bg-primary me-2"><svg xmlns="http://www.w3.org/2000/svg" color="white" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                          </svg>
                        </button>
                        <a href="delete?S1=0 %>" class="btn bg-warning me-2">
                            <svg xmlns="http://www.w3.org/2000/svg" color="red" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                              </svg>
                        </a>
                    </td>
                </tr>
                <%
									}
            	} catch(Exception e){
	
            	}
				%>
            </tbody>
        </table>
    <!-- Table End -->

    </div>
    <!-- Container End -->

    <!-- Form -> Add Bus Popup Window Start -->
    <div class="popup">
        <div class="pop-content">
            <form action="addBusDetails" method="post" id="form">
                <div class="container">
                    <h5 class="text-center mt-1">Add Bus Details</h5>
                    <div class="row mt-3">
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus ID</div>
                            <input type="text" name = "busId" placeholder="Bus ID" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus Name</div>
                            <input type="text" name = "busName" placeholder="Bus Name" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus Route</div>
                            <input type="text" name = "busRoute" placeholder="Bus Route" required>
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col mt-2">
                            <div class="text fw-bold">Departure Date</div>
                            <input type="date" name = "departureDate" placeholder="Departure Date" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Arrival Date</div>
                            <input type="date" name = "arrivalDate" placeholder="Arrival Date" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Departure Time</div>
                            <input type="time" name = "departureTime" placeholder="Departure Time" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Arrival Time</div>
                            <input type="time" name = "arrivalTime" placeholder="Arrival Time" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Duration</div>
                            <input type="time" name = "duration" placeholder="Duration" required>
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col mt-2">
                            <div class="text fw-bold">Start Place</div>
                            <input type="text" name = "startPlace" placeholder="Start Place" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">End Place</div>
                            <input type="text" name = "endPlace" placeholder="End Place" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Seater Price</div>
                            <input type="text" name = "seaterPrice" placeholder="Seater Price" required>
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Sleeper Price</div>
                            <input type="text" name = "sleeperPrice" placeholder="Sleeper Price" required>
                        </div>
                        <div class="col mt-2">
                            <label for="Layout" class="fw-bold">Layout:</label>
                            <select name="layOut" id="layOut" required>
                            <option value="2X2seater">2X2 Seater</option>
                            <option value="1X2 Slepper & Seater">1X2 Sleeper & Seater</option>
                            </select>
                        </div>
                          
                        
                    </div>
                    <div class="row mt-3 mb-3">
                        <div class="col text-center">
                            <button class="btn btn-primary">Add</button>
                            <div class="close btn btn-danger">Close</div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Form -> Add Bus Popup Window End -->


    <script>
        document.getElementById("button").addEventListener("click", function(){
            document.querySelector(".popup").style.display = "flex";
        })
        document.querySelector(".close").addEventListener("click", function(){
            document.querySelector(".popup").style.display = "none";
        })
    </script>
    
</body>
</html>