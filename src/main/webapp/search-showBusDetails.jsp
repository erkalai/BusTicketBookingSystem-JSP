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
</head>
<body>
        <div class="container">
            <form action="">
                <p class="lead fw-bold mb-1 text-center">Book Bus Tickets</p>
                <div class="row mt-5 justify-content-center text-center">
                    <div class="col form-outline mb-2 ">
                        <input type="text" name="source" id="source" class="form-control" placeholder="Source">
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="email" name="email" id="email" class="form-control" placeholder="Destination">
                    </div>
                    <div class="col form-outline mb-2">
                        <input type="date" name="mobileno" id="mobileno" class="form-control" placeholder="Onward">
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
<!--  
    <script>
        const searchInput = document.getElementById('searchInput');
        const searchResults = document.getElementById('searchResults');

        async function handleSearch(query) {
            if (!query) {
                searchResults.innerHTML = ''; // Clear results if query is empty
                return;
            }

            try {
                const response = await fetch(`http://localhost:8082/DemoBilling/search?query=${encodeURIComponent(query)}`);
                const results = await response.json(); // Parse JSON response

                searchResults.innerHTML = '';
                results.forEach(result => {
                    const li = document.createElement('li');
                    li.textContent = result; // Display each result
                    searchResults.appendChild(li);
                });
            } catch (error) {
                console.error("Error fetching search results", error);
            }
        }

        searchInput.addEventListener('input', () => {
            const query = searchInput.value;
            handleSearch(query);
        });
    </script>
    -->

   </body>
</html>