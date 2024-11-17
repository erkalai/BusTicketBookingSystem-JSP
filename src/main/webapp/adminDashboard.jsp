<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  -->
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin DashBoard</title>

<!-- Bootstrap Links -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<%@include file="./loginHeader.jsp" %>
<div class="container mt-3">
    
    <a href="addBus.jsp"><div class="btn btn-primary" >ADD Bus</div></a>
    
    <a href="addBus.html"><div class="btn btn-danger" >Print PNR List</div></a>
    <a href="selectSeatPNR.html"><div class="btn btn-warning" >ADD Bus</div></a>
    <a href="addBus.html"><div class="btn btn-success" >Add Bus Stations</div></a>

</div>
</body>
</html>