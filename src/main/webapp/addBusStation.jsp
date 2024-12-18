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
<title>Bus Stations</title>

<!-- Bootstrap Links -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="./assets/css/popup.css">
</head>

<style>
        #busStationDropdown {
         display: none; 
        }
        #busStationDropdown{
        display: none;
        }
  		.dropdown-item {
            padding: 8px;
            cursor: pointer;
        }

        .dropdown-item:hover {
            background-color: #f0f0f0;
        }

</style>

<body>
<%@include file="./loginHeaderAdmin.jsp" %>

<div class="container-fluid mt-3">
    <div class="row">
        <div class="col col-lg-6">
            <div class="row">
                <div class="col-8">
                    <input type="search" name="busStation" id="busStation" class="form-control" placeholder="Enter Bus Stations">
                    <div id="busStationDropdown" class=" dropdown form-control">
                        <!-- Show Dropdowm Station Names -->
                    </div>
                    <textarea type="text" name="busStation" id="busStation" class="form-control mt-1" placeholder="Description"></textarea>
                </div>
                <div class="col">
                    <div  class="btn btn-primary">Add</div>
                    <Button id="getStation" class="btn btn-success">Get Station Info</Button>
                </div>
            </div>
             
        </div>
        <div class="col col-lg-6 ">
            <div class="scrollable-table-container">
                <h5>Bus Stations List</h5>
                <table class="table">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">Station Name</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=BusBooking;TrustServerCertificate=True;user=root;password=root");
                                PreparedStatement pst = con.prepareStatement("select * from bus_stations_list");
                                ResultSet rs = pst.executeQuery();
                                while (rs.next()) {
                        %>
                                    <tr class="align-middle text-center">
                                        <th scope="row"><%= rs.getString("bus_station") %></th>
                                        <td>
                                            <button class="btn bg-primary me-2 mt-1">
                                                <svg xmlns="http://www.w3.org/2000/svg" color="white" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                </svg>
                                            </button>
                                            <a href="delete?S1=0" class="btn bg-warning me-2 mt-1">
                                                <svg xmlns="http://www.w3.org/2000/svg" color="red" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                                    <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- Start Popup Show Details and Edit -->

        <div class="station-popup">
            <div class="station-pop-content">
                <form action="addBusDetails" method="post" id="form">
                    <div class="container ">
                        <h5 class="text-center mt-1">Bus Stations Details</h5>
                        <div class="row mt-3">
                            <div class="text fw-bold">Bus Station Name</div>
                            <input type="text" name = "busId" disabled required>
                            <div class="text fw-bold">Description</div>
                                <textarea type="text" name = "description" disabled required> </textarea>
                        </div>
                        <div class="row mt-3 mb-3">
                            <div class="col text-center">
                                <button class="btn btn-primary">Edit</button>
                                <button class="btn btn-success">Submit</button>
                                <div class="close btn btn-danger">Close</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- End Popup Show Details and Edit -->
        
        <!--Script for  Enter Bus Station already exist to show dropdown -->
        
        <script src="../assets/js/searchStation.js"></script>


        


        <script type="text/javascript">


// PopUp Script

        document.getElementById("getStation").addEventListener("click", function(){
            document.querySelector(".station-popup").style.display = "flex";
        });
        document.querySelector(".close").addEventListener("click", function(){
            document.querySelector(".station-popup").style.display = "none";
        });

// Popup End

//Search Bus Station


$(document).ready(function() {
   		
   	    // Event listener for typing in the search input
   	    $('#busStation').on('keyup', function() {
   	        var query = $(this).val();

   	        // If query is empty, don't make an AJAX request
   	        if(query.length > 0) {

   	            $.ajax({
   	                url: 'SearchServlet',   // Servlet that handles the search
   	                type: 'GET',
   	                data: { query: query },     // Send query as a parameter
   	                success: function(data) {

   	                    // Clear the existing dropdown options
   	                    $('#busStationDropdown').empty();

   	                    // Append new search results to the dropdown
   	                    if (data.length > 0) {
   	                    	
   	                        data.forEach(function(item) {
   	                        	 $('#busStationDropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>');
   	                        });
   	                        $('#busStationDropdown').show();
   	                    } else {
   	                        $('#busStationDropdown').append('<option>No results found</option>');
   	                        $('#busStationDropdown').show();
   	                    }
   	                },
   	                error: function() {
   	                    alert("An error occurred while fetching search results.");
   	                }
   	            });
   	        } else {
   	            // If the input is empty, reset the dropdown
   	            $('#busStationDropdown').empty().hide();
   	        }
   	    });
   	    
   	    // Handle the click event on dropdown items
   	    $('#busStationDropdown').on('click', '.dropdown-item', function() {
   	        // Set the value of the input field to the selected option
   	        var selectedValue = $(this).data('value');
   	        $('#busStation').val(selectedValue);

   	        // Hide the dropdown after selection
   	        $('#busStationDropdown').hide();
   	    });

   	    // Optional: Close the dropdown when clicking outside the input and dropdown
   	    $(document).on('click', function(e) {
   	        if (!$(e.target).closest('#busStation').length && !$(e.target).closest('#busStationDropdown').length) {
   	            $('#busStationDropdown').hide();
   	        }
   	    });
   	    
   	    
   	});




     
     </script>   
        
        
</body>
</html>