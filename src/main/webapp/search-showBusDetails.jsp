 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- <%
if(session.getAttribute("uname") == null){
	response.sendRedirect("login.jsp");
}
%>  -->

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
<title>Index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
        #dropdown {
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

</head>
<body>
        <div class="container">
            <form action="">
                <p class="lead fw-bold mb-1 text-center">Book Bus Tickets</p>
                <div class="row mt-5 justify-content-center text-center">
                    <div class="col form-outline mb-2 ">
                        <input type="text" name="source" id="source" class="source form-control" placeholder="Source" />
                        <div id="dropdown" class=" dropdown form-control" size="0">
                        </div>
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="email" name="email" id="destination" class="form-control" placeholder="Destination">
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="date" name="mobileno" id="onward" class="form-control" placeholder="Onward">
                    </div>
                    <div class="col form-outline mb-2">
                        <button class="btn btn-primary w-50 fw-bold">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="container">
            <!-- Show Bus details Table Start -->
            <table class="table mt-5">
                <thead>
                    <tr class="text-center">
                        <th scope="col">Bus Name</th>
                        <th scope="col">Departure</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Arrival</th>
                        <th scope="col">Price</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                <%
            	try{
            		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            		Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=JSP;TrustServerCertificate=True;user=Kalai;password=88833");
	         		PreparedStatement pst = con.prepareStatement("select * from seat_status");
	         		
	         		ResultSet rs = pst.executeQuery();
					while(rs.next())
					{

	
            %>
                    <tr class=" align-middle">
                        <th scope="row"><%= rs.getString("bus_name")  %></th>
                        <td >
                            <div class="fw-bold"><%= rs.getString("departure_time")  %></div>
                            <div class="sub-title"><%= rs.getString("start_place")  %></div>                        
                        </td>
                        <td><div class="fw-bold"><%= rs.getString("duration")  %> Hrs</div></td>
                        <td>
                            <div class="fw-bold"><%= rs.getString("arrival_time")  %></div>
                            <div class="sub-title"><%= rs.getString("end_place")  %></div> 
                        </td>
                        <td>
                            <div class="fw-bold">RS <%= rs.getString("seater_price")  %> / <%= rs.getString("sleeper_price")  %></div>
                            <div class="f6">37 Seats Available</div> 
                            <div class="btn btn-primary me-2">View Seats</div>
                        </td>
                    </tr>
                    <%
									}
            	} catch(Exception e){
	
            	}
				%>
                </tbody>
            </table>
        <!-- Show Bus details Table End -->
        </div>
	
	
	
	
	
	

<script type="text/javascript">



$(document).ready(function() {
    // Event listener for typing in the search input
    $('#source').on('keyup', function() {
        var query = $(this).val();

        // If query is empty, don't make an AJAX request
        if(query.length > 0) {

            $.ajax({
                url: 'SearchServlet',   // Servlet that handles the search
                type: 'GET',
                data: { query: query },     // Send query as a parameter
                success: function(data) {

                    // Clear the existing dropdown options
                    $('#dropdown').empty();

                    // Append new search results to the dropdown
                    if (data.length > 0) {
                    	
                        data.forEach(function(item) {
                        	 $('#dropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>'); 
                           <!-- $('#dropdown').append('<option value="' + item + '">' + item + '</option>'); -->
                        });
                        $('#dropdown').show();
                    } else {
                        $('#dropdown').append('<option>No results found</option>');
                        $('#dropdown').show();
                    }
                },
                error: function() {
                    alert("An error occurred while fetching search results.");
                }
            });
        } else {
            // If the input is empty, reset the dropdown
            $('#dropdown').empty().hide();
        }
    });
    console.log(" Event");
    
    // Handle the click event on dropdown items
    $('#dropdown').on('click', '.dropdown-item', function() {
    	console.log("Click Event");
        // Set the value of the input field to the selected option
        var selectedValue = $(this).data('value');
        console.log(selectedValue);
        $('#source').val(selectedValue);

        // Hide the dropdown after selection
        $('#dropdown').hide();
    });

    // Optional: Close the dropdown when clicking outside the input and dropdown
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#source').length && !$(e.target).closest('#dropdown').length) {
            $('#dropdown').hide();
        }
    });
    
    
});
</script>
 	

   </body>
</html>