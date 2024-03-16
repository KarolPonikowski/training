import 'dart:ffi';

class PlanExerciseModel {
  PlanExerciseModel({
    required this.id,
    required this.planId,
    required this.exerciseId,
    required this.weight,
    required this.reps,
  });

  final String id;
  final String planId;
  final String exerciseId;
  final Double weight;
  final Int reps;
}
