<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Login</title>
</head>
<body>
<div class="container">
    <div class="container-fluid">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col  mt-5 pt-5 col-md-9 col-lg-6 col-xl-5">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"  class="img-fluid"  alt="Login Image">
            </div>
                <div class="col text-center mt-5 pt-5 col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form action="login" name="" method="post">
                    <p class="lead fw-bold mb-1">Sign In</p>
                    <div class="form-outline mb-4">
                        <input type="email" name="email" id="" class="form-control" placeholder="Enter Your Email">
                    </div>
                    <div class="form.outline mb-4">
                        <input type="password" name="password" id="" class="form-control" placeholder="Enter Your Password">
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input  me-2"/>
                            <label for="Check Lable" class="form-check-lable me-5"> Remember me </label>
    
                        </div>
                        <a href="#!" class="text-body text-decoration-none">Forgot password?</a>
                    </div>
                            <button class="btn btn-primary btn-lg mt-2 d-flex align-items-left" >Login</button>
    
                            <p class="small mt-2 pt-1 fw-bold d-flex align-items-left">Don't have an account? <a href="signup.jsp" class="text-danger">Register</a></p>
                    </form>
                </div>
        </div>
    </div>
    <div class="navbar fixed-bottom d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-1 px-4 px-xl-5  bg-primary">
        <div class="text-white mb-1 mb-md-0">
            Copyright © 2024. All rights reserved.
        </div>
    </div>
</div>
</body>
</html>