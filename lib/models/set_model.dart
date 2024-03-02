import 'dart:ffi';

class SetModel {
  SetModel(this.planExerciseId, this.dataTime, this.weight, this.reps);
  final String planExerciseId;
  final DateTime dataTime;
  final Double weight;
  final Int reps;
}
