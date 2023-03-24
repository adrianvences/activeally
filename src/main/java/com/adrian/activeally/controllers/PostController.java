package com.adrian.activeally.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.adrian.activeally.models.TrackedWorkout;
import com.adrian.activeally.models.Workout;
import com.adrian.activeally.services.TrackedWorkoutService;
import com.adrian.activeally.services.WorkoutService;

@Controller
public class PostController {

  @Autowired WorkoutService workoutService;
  @Autowired TrackedWorkoutService trackedWorkoutService;
  

  //create workout

  @GetMapping("/workouts/new")
  public String newWorkout(@ModelAttribute("workout")Workout workout){
    return "workouts/newWorkout.jsp";
  }

  

  @PostMapping("/workouts")
  public String createWorkout(
    @Valid
    @ModelAttribute("workout")Workout workout,
    BindingResult result){
    if(result.hasErrors()){
      System.out.println("we have encountered an error.");
      return "workouts/newWorkout.jsp";
    } else {
      workoutService.addWorkout(workout);
      System.out.println("workout created");
    }
    return "redirect:/workouts";
  }


  // workout tracker

    //read all tracked workouts
    @GetMapping("/workouts/tracker")
    public String allTrackedWorkouts(HttpSession session,Model model){
      if(session.getAttribute("userId") == null){
        return "redirect:/logout";
    }
      List<TrackedWorkout> trackedWorkouts = trackedWorkoutService.getAll();
      model.addAttribute("trackedWorkouts", trackedWorkouts);
      return "workouts/workoutTracker.jsp";
    }

    // track work out form
  @GetMapping("/workouts/tracker/form")
  public String newWorkoutTracker(@ModelAttribute("trackedWorkout")TrackedWorkout trackedWorkout){
    return "workouts/workoutTrackerForm.jsp";
  }

  // post tracked workout
  @PostMapping("/workouts/tracked")
  public String createTrackedWorkout(
    @Valid
    @ModelAttribute("trackedWorkout")TrackedWorkout trackedWorkout,
    BindingResult result){
    if(result.hasErrors()){
      System.out.println("we have encountered an error.");
      return "workouts/workoutTrackerForm.jsp";
    } else {
      trackedWorkoutService.addTrackedWorkout(trackedWorkout);
      System.out.println("trackedWorkout created");
    }
    return "redirect:/workouts/tracker";
  }


  //read all
  @GetMapping("/workouts")
  public String allWorkouts(HttpSession session,Model model){
    if(session.getAttribute("userId") == null){
      return "redirect:/logout";
  }
    List<Workout> workouts = workoutService.getAll();
    model.addAttribute("workouts", workouts);
    return "workouts/dashboard.jsp";
  }

  // read one 
  @GetMapping("workouts/{id}") // all were doing is getting data from db
  public String show(@PathVariable("id")Long id,Model model){
    Workout workout = workoutService.getOne(id);
    model.addAttribute("workout",workout);
    return "workouts/show.jsp";
  }
  

  //update // renders
  @GetMapping("/workouts/edit/{id}")
  public String edit(@PathVariable("id")Long id,Model model){
    
    Workout workout = workoutService.getOne(id);
    model.addAttribute("workout",workout);
    return "workouts/edit.jsp";
  }

  // update handles form data
  @PutMapping("/workouts/{id}")
  public String update(
    @Valid
    @ModelAttribute("workout")Workout workout,
    BindingResult result){
    if(result.hasErrors()){
      return "workouts/edit.jsp";
    } else {
      workoutService.addWorkout(workout);
    }
    return "redirect:/workouts";
  }

  // delete workout
  @DeleteMapping("/workouts/{id}")
  public String destroy(@PathVariable("id")Long id){
    workoutService.deleteWorkout(id);
      return "redirect:/workouts";
  }

  //delete tracked workout
  @DeleteMapping("/workouts/tracked/{id}")
  public String delete(@PathVariable("id")Long id){
    trackedWorkoutService.deleteTrackedWorkout(id);
      return "redirect:/workouts/tracker";
  }


  // // workout controller

  // @GetMapping("/workouts/tracker")
  // public String workoutTracker(){
  //   return "workouts/workoutTracker.jsp";
  // }



}
