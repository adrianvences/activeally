package com.adrian.activeally.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.adrian.activeally.models.TrackedWorkout;

public interface TrackedWorkoutRepository extends CrudRepository <TrackedWorkout, Long>{
    
    List<TrackedWorkout> findAll();
}
