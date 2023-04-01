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

    <div class="container" >
        <h1 class=" text-center ">Fitness Tracker</h1>
<!--  what do i expect in a tracker -->
<!-- exercise name , time , date , calories  -->
    </div>

<!-- form start -->

    <div class="container">
        <div class="container" style="height:100px;"></div>
    <div class="container bg-light border" style="width: 400px ;">
    
    <div class="container">
    <img class="align-content-center" style="height: 200px ;" src="images/activeAllyLogoBlack.PNG" alt="">
    <div class="container">

    </div>
    </div>
    <!-- this is reg -->
    <div class="row">
        <h2 class="text-center">Edit Track Workout</h2>

        <form:form action="/workouts/tracked/${trackedWorkout.id}" method="post" modelAttribute="trackedWorkout">
            <!-- have to specify its a put request this way -->
            <input type="hidden" name="_method" value="put">
            <form:hidden path="user" value="${userId}"></form:hidden>
        <div>
        <div class="form-group mt-1">
            <form:label path="exercise"></form:label>
            <form:input class="form-control" placeholder="Exercise Name" path="exercise" />
            <form:errors class="text-danger"  path="exercise" />
        </div>
    
        <div class="form-group mt-1">
            <form:label path="category"></form:label>
            <form:input class="form-control" placeholder="what type of work out? (e.g 'cardio')" path="category"></form:input>
            <form:errors class="text-danger" path="category" />
        </div>

        <div class="form-group mt-1">
            <form:label path="time"></form:label>
            <form:input class="form-control" placeholder="How long was this workout? (eg: 2:10)" path="time"></form:input>
            <form:errors class="text-danger" path="time" />
        </div>

        
        <div class="form-group mt-1">
            <form:label path="setsReps"></form:label>
            <form:input class="form-control" placeholder="How many sets X reps? (e.g '4x10')" path="setsReps"></form:input>
            <form:errors class="text-danger" path="setsReps" />
        </div>

        <div class="form-group mt-1">
            <form:label path="calories"></form:label>
            <form:input class="form-control" placeholder="how many calories did you burn? " path="calories"></form:input>
            <form:errors class="text-danger" path="calories" />
        </div>

        <div class="form-group mt-1">
            <form:label path="date" ></form:label>
            <form:input class="form-control" type="date" path="date"></form:input>
            <form:errors class="text-danger" path="date" />
        </div>

        </div>
        <input class="mt-3 mb-3 btn btn-dark btn-md " style="width:375px;" type="submit" value="Post">
        </form:form>

        </div>
        </div>  
    
    <div class="container bg-light border mt-3 d-flex align-items-center justify-content-center " style="width: 400px ; height: 75px;">
        <h6 class="text-center"> Go <a href="/workouts/tracker"> Back</a></h6>
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
