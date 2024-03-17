part of 'add_training_n_exercises_page_cubit.dart';

class AddTrainingExercisesPageState {
  const AddTrainingExercisesPageState({
    this.saved = false,
    this.errorMessage = '',
    // this.exercises = const [],
    this.plansName = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final bool saved;
  final String errorMessage;
  // final List<ExerciseModel> exercises;
  final List<TraninigModel> plansName;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
