 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- <%
if(session.getAttribute("uname") == null){
	response.sendRedirect("login.jsp");
}
%>  -->
<!--  
<%@page import="java.sql.*"  %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>

 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
        #sourceDropdown {
         display: none; 
        }
        #destinationDropdown{
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
            <!-- <form action="" method="post"> -->
                <p class="lead fw-bold mb-1 text-center">Book Bus Tickets</p>
                <div class="row mt-5 justify-content-center text-center">
                    <div class="col form-outline mb-2 ">
                        <input type="text" name="source" id="source" class="source form-control" placeholder="Source" />
                        <div id="sourceDropdown" class=" dropdown form-control">
                        </div>
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="text" name="destination" id="destination" class="destination form-control" placeholder="Destination" />
                        <div id="destinationDropdown" class=" dropdown form-control">
                        </div>
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="date" name="onward" id="onward" class="form-control" placeholder="Onward">
                    </div>
                    <div class="col form-outline mb-2">
                        <button class="btn btn-primary w-50 fw-bold searchBtn" id="searchBtn" name="searchBtn">Search</button>
                    </div>
                </div>
           <!--   </form> -->
        </div>
        <div class="container">
        <div class=" text-primary fw-bold text-center border-2" id="journeyDate"></div>
            <!-- Show Bus details Table Start -->
            <table class="table mt-5">
                <thead id="busTableTitle">
                    
                </thead>
                <tbody id="busDetailsTable" class="text-center" >
                
                <!-- Dynamic rows will be appended here -->
                    
                </tbody>
                
            </table>
        <!-- Show Bus details Table End -->
        </div>
	
	
	

<script type="text/javascript">

<!-- On Click function To show search buses in Table START -->

$(document).ready(function() {
    // Event listener for clicking the "Search" button
    $('#searchBtn').on('click', function() {
        
    	
    	
        var source = $('#source').val();
        var destination = $('#destination').val();
        var onward = $('#onward').val();

        
        
        // Make AJAX call to fetch bus details
        $.ajax({
            url: 'SearchBus', // Replace with the URL to your servlet
            type: 'GET',
            data: {
                source: source,
                destination: destination,
                onward: onward
            },
            success: function(data) {
                // Empty the table body before populating new data
                $('#busDetailsTable').empty();
				$('#journeyDate').empty();
				$('#busTableTitle').empty();
                if (Array.isArray(data) && data.length > 0) {

    				$('#busTableTitle').append(table);
                	
                	var table ='<tr class="text-center">' + 
                	
                    '<th scope="col">Bus Name</th>' +
                    '<th scope="col">Departure</th>' +
                    '<th scope="col">Duration</th>' +
                    '<th scope="col">Arrival</th>' +
                    '<th scope="col">Price</th>' +
                '</tr>'
                	
    				$('#busTableTitle').append(table);
                	
                	
                	$('#journeyDate').text("Journey Date : " + onward);
                	//console.log("Check",${data.busName});
                	
                    // Iterate over the data and create rows for the table
                    data.forEach(function(bus) {
                        
                        var busName = bus.busName || 'N/A';           // Default to 'N/A' if busName is falsy
                        var departureTime = bus.departureTime || 'N/A';
                        var arrivalTime = bus.arrivalTime || 'N/A';
                        var startPlace = bus.startPlace || 'N/A';
                        var endPlace = bus.endPlace || 'N/A';
                        var duration = bus.duration || 'N/A';
                        var seaterPrice = bus.seaterPrice || '0';
                        var sleeperPrice = bus.sleeperPrice || '0';

                        // Log the bus information (e.g., for debugging)
                        //console.log("Bus Information: ", bus);  

                        
                        
                        // Create the row HTML using a template literal
                        
                        
                        
                        var row = '<tr class="align-middle text-danger">' +
             '<td>' + busName + '</td>' +
             '<td>' +
                 '<div class="fw-bold">' + departureTime + '</div>' +
                 '<div class="sub-title">' + startPlace + '</div>' +
             '</td>' +
             '<td><div class="fw-bold">' + duration + '</div></td>' +
             '<td>' +
                 '<div class="fw-bold">' + arrivalTime + '</div>' +
                 '<div class="sub-title">' + endPlace + '</div>' +
             '</td>' +
             '<td>' +
                 '<div class="fw-bold">₹ ' + seaterPrice + ' / ₹ ' + sleeperPrice + '</div>' +
                 '<div class="f6">37 Seats Available</div>' +
                 '<div class="btn btn-primary me-2">View Seats</div>' +
             '</td>' +
         '</tr>';

                     
                        // Append the row to the table body
                        $('#busDetailsTable').append(row);
                    });
                } else {
                    // Display message if no buses found
                    $('#busDetailsTable').append('<tr><td colspan="5">No buses found for the selected route.</td></tr>');
                }
            },
            error: function() {
                alert("An error occurred while fetching search results.");
            }
        });
    });
});



 // On Click function To show search buses in Table  END

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
                    $('#sourceDropdown').empty();

                    // Append new search results to the dropdown
                    if (data.length > 0) {
                    	
                        data.forEach(function(item) {
                        	 $('#sourceDropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>');
                        });
                        $('#sourceDropdown').show();
                    } else {
                        $('#sourceDropdown').append('<option>No results found</option>');
                        $('#sourceDropdown').show();
                    }
                },
                error: function() {
                    alert("An error occurred while fetching search results.");
                }
            });
        } else {
            // If the input is empty, reset the dropdown
            $('#sourceDropdown').empty().hide();
        }
    });
    
    // Handle the click event on dropdown items
    $('#sourceDropdown').on('click', '.dropdown-item', function() {
        // Set the value of the input field to the selected option
        var selectedValue = $(this).data('value');
        $('#source').val(selectedValue);

        // Hide the dropdown after selection
        $('#sourceDropdown').hide();
    });

    // Optional: Close the dropdown when clicking outside the input and dropdown
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#source').length && !$(e.target).closest('#sourceDropdown').length) {
            $('#sourceDropdown').hide();
        }
    });
    
    
});

// Destination Search DropDown 



$(document).ready(function() {
    // Event listener for typing in the search input
    $('#destination').on('keyup', function() {
        var query = $(this).val();

        // If query is empty, don't make an AJAX request
        if(query.length > 0) {

            $.ajax({
                url: 'SearchServlet',   // Servlet that handles the search
                type: 'GET',
                data: { query: query },     // Send query as a parameter
                success: function(data) {

                    // Clear the existing dropdown options
                    $('#destinationDropdown').empty();

                    // Append new search results to the dropdown
                    if (data.length > 0) {
                    	
                        data.forEach(function(item) {
                        	 $('#destinationDropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>'); 
                           //$('#dropdown').append('<option value="' + item + '">' + item + '</option>'); -->
                        });
                        $('#destinationDropdown').show();
                    } else {
                        $('#destinationDropdown').append('<option>No results found</option>');
                        $('#destinationDropdown').show();
                    }
                },
                error: function() {
                    alert("An error occurred while fetching search results.");
                }
            });
        } else {
            // If the input is empty, reset the dropdown
            $('#destinationDropdown').empty().hide();
        }
    });
    
    // Handle the click event on dropdown items
    $('#destinationDropdown').on('click', '.dropdown-item', function() {
        // Set the value of the input field to the selected option
        var selectedValue = $(this).data('value');
        $('#destination').val(selectedValue);
        // Hide the dropdown after selection
        $('#destinationDropdown').hide();
    });

    // Optional: Close the dropdown when clicking outside the input and dropdown
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#destination').length && !$(e.target).closest('#destinationDropdown').length) {
            $('#destinationDropdown').hide();
        }
    });
    
    
});


</script>
 	

   </body>
</html>