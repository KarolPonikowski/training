part of 'add_new_plan_page_cubit.dart';

class AddNewPlanPageState {
  const AddNewPlanPageState({
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
  final List<TraninigPlanModel> plansName;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
