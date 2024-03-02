import 'dart:ffi';

class PlanExerciseModel {
  PlanExerciseModel(this.planId, this.exerciseId, this.weight, this.reps);
  final String planId;
  final String exerciseId;
  final Double weight;
  final Int reps;
}
