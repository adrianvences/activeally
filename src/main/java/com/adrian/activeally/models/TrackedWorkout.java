package com.adrian.activeally.models;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
// what will a tracked work out take?
// exercise / catagory / sets-reps / calories / time on exercise
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="trackedWorkouts")
public class TrackedWorkout {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  
  @NotBlank(message="Enter Exercise name")
  private String exercise;
  
  @NotBlank(message="Enter Category")
  private String category;

  @NotBlank (message="Enter Number of sets and reps")
  private String setsReps;

  
  private Double calories;

  private Double time;

  @DateTimeFormat(pattern="yyyy-MM-dd")
  @NotNull (message="Enter Date Of Exercise")
  private Date date;


  @Column(updatable=false)
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date createdAt;
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date updatedAt;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name="user_id")
  private User user;


  public TrackedWorkout() {
  }





  public TrackedWorkout(Long id, String exercise, String category, String setsReps, Double calories, Double time, Date date, Date createdAt, Date updatedAt, User user) {
    this.id = id;
    this.exercise = exercise;
    this.category = category;
    this.setsReps = setsReps;
    this.calories = calories;
    this.time = time;
    this.date = date;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.user = user;
  }

  



  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getExercise() {
    return this.exercise;
  }

  public void setExercise(String exercise) {
    this.exercise = exercise;
  }

  public String getCategory() {
    return this.category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getSetsReps() {
    return this.setsReps;
  }

  public void setSetsReps(String setsReps) {
    this.setsReps = setsReps;
  }

  public Double getCalories() {
    return this.calories;
  }

  public void setCalories(Double calories) {
    this.calories = calories;
  }

  public Double getTime() {
    return this.time;
  }

  public void setTime(Double time) {
    this.time = time;
  }

  public Date getCreatedAt() {
    return this.createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return this.updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }

  public User getUser() {
    return this.user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  @PrePersist
  protected void onCreate(){
      this.createdAt = new Date();
  }
  @PreUpdate
  protected void onUpdate(){
      this.updatedAt = new Date();
  }



  public Date getDate() {
    return this.date;
  }

  public void setDate(Date date) {
    this.date = date;
  }


}


