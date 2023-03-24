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

    </style>
<body >


<div class="container" style="height:100px;"></div>
    <div class="container bg-light border" style="width: 350px ;">
        
        <div class="container">
        <img class="align-content-center" style="width: 300px ;" src="images/activeAllyLogoBlack.PNG" alt="">
    <div class="container">
            <div class="col">
            <h2 class="text-center">Already a member?</h2>
            <div class="form-group">
                <form:form action="/login" method="post" modelAttribute="newLogin">
                <div class="form-group mb-1">
                    <form:label path="email" ></form:label>
                    <form:input class="form-control" placeholder="Email" path="email" />
                    <form:errors path="email" />
                </div>
                <div class="form-group mb-1">
                <form:label path="password" ></form:label>
                <form:password class="form-control" placeholder="Password" path="password" />
                <form:errors path="password" />
                </div>
                <input class="mb-3 mt-2 btn btn-dark" type="submit" value="login">
                <div class="container" style="height:50px;"></div>
            </form:form>
        </div>
        </div>
        </div>
    
        
        </div>   
      
    
    </div>
    <div class="container bg-light border mt-3 d-flex align-items-center justify-content-center " style="width: 350px ; height: 75px;">
      <h6 class="text-center"> Not a member? <a href="/"> Sign Up</a></h6>
  </div>

    <footer class="p-5  text-white text-center position-relative mt-3">
        <div class="container">
            <p class="lead">| Where fitness and social media come together | Copyright &copy; 2022  FitSocial | </p> 
            <a href="#" class="position-absolute bottom-0 end-0 p-5">
                <i class="bi bi-arrow-up-cirle text-danger h1"></i>
            </a>
        </div>

    </footer>
</body>
</html>