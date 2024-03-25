import 'dart:ffi';

class TrainingExerciseModel {
  TrainingExerciseModel({
    required this.id,
    required this.trainingId,
    required this.exerciseId,
    required this.weight,
    required this.reps,
  });

  final String id;
  final String trainingId;
  final String exerciseId;
  final double weight;
  final int reps;
}
