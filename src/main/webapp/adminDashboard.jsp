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


    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin DashBoard</title>

<!-- Bootstrap Links -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<%@include file="./loginHeaderAdmin.jsp" %>
<div class="d-flex justify-content-center align-items-center vh-100 p-3">
    <!-- Container for the buttons -->
    <div class="text-center">
      <!-- Add Bus -->
      <a href="addBus.jsp" class="btn btn-primary mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-bus-front" viewBox="0 0 16 16">
          <path d="M5 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0m8 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m-6-1a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2zm1-6c-1.876 0-3.426.109-4.552.226A.5.5 0 0 0 3 4.723v3.554a.5.5 0 0 0 .448.497C4.574 8.891 6.124 9 8 9s3.426-.109 4.552-.226A.5.5 0 0 0 13 8.277V4.723a.5.5 0 0 0-.448-.497A44 44 0 0 0 8 4m0-1c-1.837 0-3.353.107-4.448.22a.5.5 0 1 1-.104-.994A44 44 0 0 1 8 2c1.876 0 3.426.109 4.552.226a.5.5 0 1 1-.104.994A43 43 0 0 0 8 3"/>
          <path d="M15 8a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1V2.64c0-1.188-.845-2.232-2.064-2.372A44 44 0 0 0 8 0C5.9 0 4.208.136 3.064.268 1.845.408 1 1.452 1 2.64V4a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v3.5c0 .818.393 1.544 1 2v2a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5V14h6v1.5a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-2c.607-.456 1-1.182 1-2zM8 1c2.056 0 3.71.134 4.822.261.676.078 1.178.66 1.178 1.379v8.86a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 11.5V2.64c0-.72.502-1.301 1.178-1.379A43 43 0 0 1 8 1"/>
        </svg> Add Bus
      </a>

      <!-- Add Bus Station -->
      <a href="addBusStation.jsp" class="btn btn-su mb-3 btn-success">
        <img width="64" height="64" class="text-white" src="https://img.icons8.com/pastel-glyph/64/marker--v2.png" alt="marker--v2"/>
        
        Add Bus Station
      </a>

      <!-- Print PNR List -->
      <a href="printPNR.jsp" class="btn btn-warning mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
          <path d="M9 0a1 1 0 0 1 1 1v4.5H9.5A.5.5 0 0 0 9 6h-4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5H9V1a1 1 0 0 1 1-1zM5 6h6v8H5V6z"/>
        </svg> Print PNR List
      </a>
    </div>
  </div>

    <!-- Bootstrap JS (optional for further functionality) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>