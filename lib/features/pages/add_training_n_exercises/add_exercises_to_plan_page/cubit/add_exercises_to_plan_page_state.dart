part of 'add_exercises_to_plan_page_cubit.dart';

class AddExercisesToPlanPageState {
  const AddExercisesToPlanPageState({
    this.saved = false,
    this.errorMessage = '',
    this.exercises = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final bool saved;
  final String errorMessage;
  final List<ExerciseModel> exercises;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
