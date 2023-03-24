package com.adrian.activeally.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adrian.activeally.models.TrackedWorkout;
import com.adrian.activeally.repositories.TrackedWorkoutRepository;

@Service
public class TrackedWorkoutService {
  

  @Autowired TrackedWorkoutRepository trackedWorkoutRepo;

  //! CREATE
  public void addTrackedWorkout(TrackedWorkout trackedWorkout){
    trackedWorkoutRepo.save(trackedWorkout);
  }

  //! READ ALL
  public List<TrackedWorkout> getAll(){
      return trackedWorkoutRepo.findAll();
  }

  //! READ ONE
  public TrackedWorkout getOneTrackedWorkout(Long id) {
      Optional<TrackedWorkout> optionalTrackedWorkout = trackedWorkoutRepo.findById(id);
      return optionalTrackedWorkout.orElse(null);
  }

  //! UPDATE ONE
  public void updateTrackedWorkout(TrackedWorkout trackedWorkout){
    trackedWorkoutRepo.save(trackedWorkout);
  }

  //! DELETE
  public void deleteTrackedWorkout(Long id){
    trackedWorkoutRepo.deleteById(id);
  }

}
