<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("sessionId")==null || session.getAttribute("name")==null){
	response.sendRedirect("index.jsp");
}
if(request.getParameter("logout")!=null){
	session.removeAttribute("sessionId");
	session.removeAttribute("name");
	response.sendRedirect("index.jsp");
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<!-- Bootstrap Link -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./assets/css/header.css">
</head>
<body>
 
<!-- Get Name -->


<div class="container-fluid" style="background-image: linear-gradient(to right, #a2a7b0 , #ffffff);">
        <nav class="navbar navbar-expand-lg " style="background-color: rgba(255, 255, 255, 0.3); border-radius:0px 0px 10px 10px;">
            <div class="container-fluid ">
              <a class="navbar-brand navlink fw-bold text-secondary" href="#" ><img src="./assets/img/logo.png" class=" img-fluid  " style="width: 50px;"> <span class="brand text-secondary">BookMyBus</span></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav me-2 mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link navlink text-secondary" aria-current="page" name="logout" href="./login.jsp">Log Out</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link navlink  text-secondary" style="color:blue" href="#" >Change Password</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link navlink text-secondary" href="#">Add Admin</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link navlink text-secondary" href="#">Setting</a>
                  </li>
                  <li class="nav-item">
                  <% 
                  String Name = (String) session.getAttribute("name");
                  %>
                    <div class="nav-link navlink text-secondary" ><%= Name %> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                      </svg></div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link navlink" href="#"></a>
                  </li>
                </ul>
                <form class="d-flex" role="search">
                </form>
              </div>
            </div>
          </nav>
    </div>



</body>
</html>