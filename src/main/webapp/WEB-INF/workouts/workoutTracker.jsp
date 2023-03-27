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
    <title> Active Ally</title>
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
    dashboard
        <!-- ########### this is our nav bar ############ -->
        <nav class="navbar navbar-expand-lg  navbar-dark py-3 fixed-top" style="background-color: #1f2041;">
        <div class="container">
            <!-- <a href="#" class="navbar-brand"> <img src= "{{url_for('static', filename='bodybuildz.png')}}" class="img-fluid w-50 " /></a> -->
            <a href="/workouts" class="navbar-brand"> <img class="align-content-center" style="height: 100px ;" src="/images/activeAllyLogoWhite.PNG" alt=""></a>


            <button 
                class="navbar-toggler" 
                type="button" 
                data-bs-toggle="collapse" 
                data-bs-target="#navmenu" 
            >
                <span class="navbar-toggler-icon"></span>
            </button>

        <!-- button toggles the nav menu because of the navmenu id -->

            <div class="collapse navbar-collapse" id="navmenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a href="/workouts" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/workouts/new" class="nav-link">Create</a>
                    </li>
                    <li class="nav-item">
                        <a href="/profile/${userId}" class="nav-link">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a href="/workouts/tracker" class="nav-link">Workout Tracker</a>
                    </li>
                    <li class="nav-item">
                        <a href="/logout" type="submit" value="logout" class="nav-link"> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container" style="height: 150px;"></div>

    <div class="container">
        <h1 class=" text-center ">Fitness Tracker</h1>
<!--  what do i expect in a tracker -->
<!-- exercise name , time , date , calories  -->
    </div>

<!-- table start -->
<div class="container p-3" style="background-color: #1f2041;  ">
  <table class="table" style="backdrop-filter: blur(2px);">
    <thead>
        <th class="text-light">Exercise Type</th>
        <th class="text-light">Category</th>
        <th class="text-light">Duration Of Exercise</th>
        <th class="text-light">Sets/Reps</th>
        <th class="text-light">Calories</th>
        <th class="text-light">Date Of</th>
        <th class="text-light">Actions</th>
    </thead>
    <tbody >
        <c:forEach var="trackedWorkout" items="${trackedWorkouts}">
        <c:choose>
        <c:when test="${trackedWorkout.user.id == userId}">
            <tr>
                <td class="text-light">${trackedWorkout.exercise}</td>
                <td class="text-light">${trackedWorkout.category}</td>
                <td class="text-light">${trackedWorkout.time}</td>
                <td class="text-light">${trackedWorkout.setsReps}</td>
                <td class="text-light">${trackedWorkout.calories}</td>
                <td class="text-light">${trackedWorkout.date}</td>
                <td><form action="/workouts/tracked/${trackedWorkout.id}" method="post">
                    <a class="btn btn-warning mr-6" href="/classes/edit/${course.id}">Edit</a>
                    <input type="hidden" name="_method" value="delete">
                    <input class="btn btn-danger ml-3"  type="submit" value="Delete">
            </form></td>
            </tr>
        </c:when>
        </c:choose>
        </c:forEach>
    </tbody>
    <a href="/workouts/tracker/form" class="btn btn-secondary text-light"  ><h5>Add Workout +</h5></a>
  </table>
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