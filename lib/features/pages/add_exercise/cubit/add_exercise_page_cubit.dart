import 'package:bloc/bloc.dart';

import '../../../../repository/exercise_repository.dart';

part 'add_exercise_page_state.dart';

class AddExerciseCubit extends Cubit<AddExercisePageState> {
  AddExerciseCubit(this._exerciseRepository)
      : super(const AddExercisePageState());

  final ExerciseRepository _exerciseRepository;

  Future<void> add(
    String title,
  ) async {
    try {
      await _exerciseRepository.add(
        title,
      );
      emit(const AddExercisePageState(saved: true));
    } catch (error) {
      emit(AddExercisePageState(errorMessage: error.toString()));
    }
  }
}
