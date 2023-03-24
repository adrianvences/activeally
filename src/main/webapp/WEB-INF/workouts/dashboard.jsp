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
    /* body { */
        /* background-image: url("/images/heroblue.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh; */
        /* background-color: #4b3f72; */
    /* } */
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

    <!-- card -->
    <div class="container border d-flex flex-column p-3 align-items-center justify-content-center w-50" style="min-height: 500px;" >
        <h2 style="color: azure;">Workout Feed</h2>
    <c:forEach var="workout" items="${workouts}" >
        <div class="card d-flex justify-content-center shadow-lg p-3 rounded mb-3" style="background-color: #1f2041;" >
            <div class="card rounded" style="min-height: 500px ; width: 300px;">
                <div class="card-body rounded justify-content-center bg-dark" >
                    <div class="card-header border-light ">
                        <!-- <img class="align-content-center mt-3 mb-3 gap-3 m-1" style="height:50px;" src="/images/user-circle.png" alt="Profile picture">  -->
                        <img class="align-content-center mt-3 mb-3 gap-3 m-1 rounded-circle" style="height:50px;" src="https://randomuser.me/api/portraits/men/72.jpg" alt="Profile picture"> 
                        <a href="/profile/${workout.user.id}" class="text-decoration-none text-muted">    @${workout.user.userName}</a>
    
                    </div>
                    <h2 class="text-center text-light mb-4">${workout.title}</h2>
                    <h6 class="text-light text-center">Type of work out: ${workout.type}</h6>
                    <h6 class="text-light text-center"> Target muscle: ${workout.targetMuscle}</h6>
                    <h6 class="text-light text-center"> Equipment:${workout.equipment}</h6>
                    <h6 class="text-light text-center">Difficulty: ${workout.difficulty}</h6>
                    <h6 class="text-light text-center"> Instructions: ${workout.instructions}</h6>
    
                    
                </div>
                <div class="footer rounded d-flex justify-content-around align-content-center d-flex align-items-center " style="background-color: silver ; width: auto; height: 28px; ">
                    <img src="/images/hand-thumbs-up.svg"  style="height: 20px ;" alt="">
                    <img src="/images/bookmark-plus.svg"  style="height: 20px ;" alt="">
                    <img src="/images/share-fill.svg"  style="height: 20px ;" alt="">
                </div>
                
            </div>
        </div>
    </c:forEach>
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
