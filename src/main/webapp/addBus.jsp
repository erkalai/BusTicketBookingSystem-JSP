<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap Link -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Style Link -->

<link rel="stylesheet" href="../webapp/css/style.css">

<title>Add Bus</title>
</head>
<body>
    <!-- Title -->
    <div class="text-center fw-bold fs-4 mt-2">TITLE PAGE</div>

    <!-- Container Start -->
    <div class="continer ms-2 mt-3 ">

    <!-- Add Bus button And Refresh Button start-->
        <div class="row ">
            <div class="col mt-2 align-self-end">
                <div id="button" class="button btn  btn-primary">
                    Add Bus
                </div>
                <div id="button" class="button btn  btn-success">
                    Refresh
                </div>
            </div>
        </div>
        <!-- Add Bus button And Refresh Button End-->

        <!-- Table Start -->
        <table class="table">
            <thead>
                <tr>
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
			 		con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=JSP;TrustServerCertificate=True;user=kalai;password=88833");
	         		PreparedStatement pst = con.prepareStatement("select * from seat_status");

					Resultset rs = pst.executeQuery();
					while(rs.next())
					{

	
            %>
                <tr>
                    <th scope="row"><%= rs.getString("bus_id")  %></th>
                     <tr class=" align-middle">
                     	<td >
                            <div class="fw-bold"><%= rs.getString("bus_name")  %></div>                       
                        </td>
                        <td >
                            <div class="fw-bold"><%= rs.getString("departure_time")  %></div>
                            <div class="sub-title"><%= rs.getString("start_place")  %></div>                        
                        </td>
                        <td><div class="fw-bold"><%= rs.getString("duration")  %></div></td>
                        <td>
                            <div class="fw-bold"><%= rs.getString("arrival_time")  %></div>
                            <div class="sub-title"><%= rs.getString("end_place")  %></div> 
                        </td>
                        <td>
                            <div class="fw-bold">RS 486/756</div>
                            <div class="f6">37 Seats Available</div> 
                            <div class="btn btn-primary me-2">View Seats</div>
                        </td>
                    </tr>
                    <td>
                        <div class="btn bg-primary me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                          </svg>
                        </div>
                        <div class="btn bg-warning me-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                              </svg>
                        </div>
                    </td>
                </tr>
                <%
									}
            	} catch(Exception e){
	
            	}
				%>
                <tr>
                    <th scope="row">112</th>
                    <td>Ultra Delux</td>
                    <td>Madurai</td>
                    <td>15/12/2024</td>
                    <td>16/12/2024</td>
                    <td>9:30 PM</td>
                    <td>5:00 AM</td>
                    <td>Selam</td>
                    <td>Chennai</td>
                    <td>2X2 Seater</td>
                    <td>
                        <div class="btn bg-primary me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                          </svg>
                        </div>
                        <div class="btn bg-warning me-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                              </svg>
                        </div>
                    </td>
                </tr>
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
                    <div class="row">
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus ID</div>
                            <input type="text" name = "busId" placeholder="Bus ID">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus Name</div>
                            <input type="text" name = "busName" placeholder="Bus Name">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Bus Route</div>
                            <input type="text" name = "busRoute" placeholder="Bus Route">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Departure Date</div>
                            <input type="date" name = "departureDate" placeholder="Departure Date">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Arrival Date</div>
                            <input type="date" name = "arrivalDate" placeholder="Arrival Date">
                        </div>
                        <div class="col mt-2">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
                            <div class="text fw-bold">Departure Time</div>
                            <input type="time" name = "departureTime" placeholder="Departure Time">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Arrival Time</div>
                            <input type="time" name = "arrivalTime" placeholder="Arrival Time">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Start Place</div>
                            <input type="text" name = "startPlace" placeholder="Start Place">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">End Place</div>
                            <input type="text" name = "endPlace" placeholder="End Place">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Seater Price</div>
                            <input type="text" name = "endPlace" placeholder="Seater Price">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Sleeper Price</div>
                            <input type="text" name = "endPlace" placeholder="Sleeper Price">
                        </div>
                        <div class="col mt-2">
                            <div class="text fw-bold">Sleeper Price</div>
                            <input type="text" name = "endPlace" placeholder="Sleeper Price">
                        </div>
                        <div class="col mt-2">
                            <label for="Layout" class="fw-bold">Layout:</label>
                            <select name="layOut" id="layOut">
                            <option value="2X2seater">2X2 Seater</option>
                            <option value="1X2 Slepper & Seater">1X2 Slepper & Seater</option>
                            </select>
                        </div>
                        <!-- <div class="col">
                            <div class="text fw-bold">Select Seat</div>
                            <label for="cars" class="fw-bold">Select Seat:</label>
                            <select name="seat" id="seat" multiple class="multiselect">
                            <option value="2X2seater">Select All Seats</option>
                            <option value="S1">S1</option>
                            <option value="S1">S2</option>
                            <option value="S">S3</option>
                            <option value="S">S4</option>
                            <option value="S">S5</option>
                            <option value="S">S6</option>
                            <option value="S">S7</option>
                            <option value="S">S8</option>
                            <option value="S">S9</option>
                            <option value="S">S10</option>
                            <option value="S">S11</option>
                            <option value="S">S12</option>
                            <option value="S">S13</option>
                            <option value="S">S14</option>
                            <option value="S">S15</option>
                            <option value="S">S16</option>
                            <option value="S">S17</option>
                            <option value="S">S18</option>
                            <option value="S">S19</option>
                            <option value="S">S20</option>
                            <option value="S">S21</option>
                            <option value="S">S22</option>
                            <option value="S">S23</option>
                            <option value="S">S24</option>
                            <option value="S">S25</option>
                            <option value="S">S26</option>
                            <option value="S">S27</option>
                            <option value="S">S28</option>
                            <option value="S29">S29</option>
                            <option value="S30">S30</option>
                            </select>
                        </div> -->
                    </div>
                    <div class="row mt-5">
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