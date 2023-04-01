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
<body>
    <div class="container">
      <div class="container" style="height:100px;"></div>
    <div class="container bg-light border" style="width: 400px ;">
        
        <div class="container">
    <div class="container">
            
        </div>
        </div>
        <!-- this is reg -->
        <div class="row">
            <h2 class="text-center">Edit Workout</h2>
            <form:form action="/workouts/${workout.id}" method="post" modelAttribute="workout">
                <!-- have to specify its a put request this way -->
              <input type="hidden" name="_method" value="put">
              <form:hidden path="user" value="${userId}"></form:hidden>
            <div>
            <div class="form-group mt-1">
                <form:label path="title"></form:label>
                <form:input class="form-control" placeholder="Post Name" path="title" />
                <form:errors class="text-danger"  path="title" />
            </div>
      
            <div class="form-group mt-1">
                <form:label path="type"></form:label>
                <form:input class="form-control" placeholder="What type of work out? (e.g 'cardio')" path="type"></form:input>
                <form:errors class="text-danger" path="type" />
            </div>
    
            <div class="form-group mt-1">
                <form:label path="targetMuscle"></form:label>
                <form:input class="form-control" placeholder="What is the target muscle? (e.g 'bicep ect')" path="targetMuscle"></form:input>
                <form:errors class="text-danger" path="targetMuscle" />
            </div>
                
            <div>
                <form:label path="equipment"></form:label>
                <form:input class="form-control" placeholder="What equipment was used? (e.g 'freeweights')" path="equipment"></form:input>
                <form:errors class="text-danger"  path="equipment" />
            </div>
    
            <div>
                <form:label path="difficulty"></form:label>
                <form:select class="form-control custom-select"  path="difficulty">
                  <form:option value="">Difficulty</form:option>
                  <form:option value="beginner">beginner</form:option>
                  <form:option value="intermediate">intermediate</form:option>
                  <form:option value="advanced">advanced</form:option>
                </form:select>
                <form:errors class="text-danger"  path="difficulty" />
            </div>

            <div>
              <form:label path="instructions"></form:label>
              <form:textarea class="form-control mt-1" style="height:150px" placeholder="Instructions" path="instructions" />
              <form:errors class="text-danger"  path="instructions" />
          </div>

            </div>
            <input class="mt-3 mb-3 btn btn-dark btn-md " style="width:375px;" type="submit" value="Post">
            </form:form>
            
    
        </div>
        </div>  
        
        <div class="container bg-light border mt-3 d-flex align-items-center justify-content-center " style="width: 400px ; height: 75px;">
            <h6 class="text-center"> Go <a href="/workouts"> Back</a></h6>
        </div>
    
    </div>
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
