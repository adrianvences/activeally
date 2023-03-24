package com.adrian.activeally.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.adrian.activeally.models.Workout;

public interface WorkoutRepository extends CrudRepository <Workout, Long>{
    
    List<Workout> findAll();
}
