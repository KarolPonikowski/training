import 'dart:ffi';

import 'training_plan_model.dart';

class PlanExerciseModel {
  PlanExerciseModel({
    required this.id,
    required TraninigPlanModel plan,
    required this.exerciseId,
    required this.weight,
    required this.reps,
  }) : planId = plan.id;

  final String id;
  final String planId;
  final String exerciseId;
  final Double weight;
  final Int reps;
}
