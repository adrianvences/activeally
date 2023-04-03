<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Active Ally</title>
    <link rel="icon" href="/images/activeAllyMini.PNG">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<style>
    body {
        background-image: url("/images/mountainHero.jpg.webp");
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh;
    }
    /* body {
        /* background-image: url("/images/heroblue.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh; */
        /* background-color: #4b3f72; */
    /* } */ 
    </style>
<body >


<div class="container" style="height:100px;"></div>
    <div class="container bg-light border" style="width: 350px ;">
        
        <div class="container">
        <img class="align-content-center" style="width: 300px ;" src="/images/activeAllyLogoBlack.PNG" alt="">
    <div class="container">
            
        </div>
        </div>
        <!-- this is reg -->
        <div class="row">
            <h2 class="text-center">Sign-up</h2>
    
            <form:form action="/register" method="post" modelAttribute="newUser">
    
            <div>
            <div class="form-group mt-1">
                <form:label path="userName"></form:label>
                <form:input class="form-control" placeholder="User Name" path="userName" />
                <form:errors  path="userName" />
            </div>

            <div class="form-group mt-1">
                <form:label path="fullName"></form:label>
                <form:input class="form-control" placeholder="Full Name" path="fullName" />
                <form:errors  path="fullName" />
            </div>
    
            <div class="form-group mt-1">
                <form:label path="email"></form:label>
                <form:input class="form-control" placeholder="Email" path="email" />
                <form:errors  path="email" />
            </div>
            
            <div class="form-group mt-1">
                <form:label path="url"></form:label>
                <form:input class="form-control" placeholder="Profile Picture URL" path="url" />
                <form:errors  path="url" />
            </div>
                
            <div>
                <form:label path="password"></form:label>
                <form:password class="form-control mt-1" placeholder="Password" path="password" />
                <form:errors  path="password" />
            </div>
    
            <div>
                <form:label path="confirm"></form:label>
                <form:password class="form-control mt-1" placeholder="Confirm Password" path="confirm" />
                <form:errors  path="confirm" />
            </div>
<!-- 
            <div class="div">
                <label>Photos: </label>
                <input type="file" name="image" accept="image/png, image/jpeg" />
            </div> -->

            </div>
            <input class="mt-3 mb-3 btn btn-dark border" type="submit" value="Register">
            </form:form>
    
        </div>
        </div>  
        
        <div class="container bg-light border mt-3 d-flex align-items-center justify-content-center " style="width: 350px ; height: 75px;">
            <h6 class="text-center"> Already a member? <a href="/login"> Log in</a></h6>
        </div>
    
    </div>

    <footer class="p-5  text-white text-center position-relative mt-3">
        <div class="container">
            <p class="lead">| Where fitness and social media come together | Copyright &copy; 2022  FitSocial | </p> 
            <a href="" class="position-absolute bottom-0 end-0 p-5">
                <i class="bi bi-arrow-up-cirle text-danger h1"></i>
            </a>
        </div>

    </footer>
</body>
</html>