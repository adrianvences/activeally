package com.adrian.activeally.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adrian.activeally.models.Workout;
import com.adrian.activeally.repositories.WorkoutRepository;

@Service
public class WorkoutService {
    
    @Autowired WorkoutRepository workoutRepo;

    //! CREATE
    public void addWorkout(Workout workout){
        workoutRepo.save(workout);
    }

    //! READ ALL
    public List<Workout> getAll(){
        return workoutRepo.findAll();
    }

    //! READ ONE
    public Workout getOne(Long id) {
        Optional<Workout> optionalWorkout = workoutRepo.findById(id);
        return optionalWorkout.orElse(null);
    }

    //! UPDATE ONE
    public void updateWorkout(Workout workout){
        workoutRepo.save(workout);
    }

    //! DELETE
    public void deleteWorkout(Long id){
        workoutRepo.deleteById(id);
    }
}
