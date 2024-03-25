part of 'add_training_n_exercises_page_cubit.dart';

class AddTrainingExercisesPageState {
  const AddTrainingExercisesPageState({
    this.saved = false,
    this.errorMessage = '',
    // this.exercises = const [],
    this.traninigName = const [],
    this.traninigexerciseId = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final bool saved;
  final String errorMessage;
  // final List<ExerciseModel> exercises;
  final List<TraninigModel> traninigName;
  final List<TrainingExerciseModel> traninigexerciseId;

  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
