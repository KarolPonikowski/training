import 'dart:ffi';

class PlanExerciseModel {
  final String planId;
  final String exerciseId;
  final Double weight;
  final Int reps;

  PlanExerciseModel(this.planId, this.exerciseId, this.weight, this.reps);
}
