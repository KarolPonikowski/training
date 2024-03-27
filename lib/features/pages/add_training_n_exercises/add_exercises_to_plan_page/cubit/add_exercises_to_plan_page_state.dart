part of 'add_exercises_to_plan_page_cubit.dart';

class AddExercisesToPlanPageState {
  const AddExercisesToPlanPageState({
    this.saved = false,
    this.errorMessage = '',
    this.exercises = const [],
    this.trainingexercises = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
    this.exerciseModel,
  });

  final bool saved;
  final String errorMessage;
  final List<ExerciseModel> exercises;
  final List<TrainingExerciseModel> trainingexercises;

  final bool loadingErrorOccured;
  final bool removingErrorOccured;
  final ExerciseModel? exerciseModel;
}
