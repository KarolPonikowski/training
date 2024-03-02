import 'dart:ffi';

class SetModel {
  final String planExerciseId;
  final DateTime dataTime;
  final Double weight;
  final Int reps;

  SetModel(this.planExerciseId, this.dataTime, this.weight, this.reps);
}
