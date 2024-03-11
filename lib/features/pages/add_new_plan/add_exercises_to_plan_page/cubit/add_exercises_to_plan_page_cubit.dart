import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/exercise_model.dart';
import '../../../../../repository/exercise_repository.dart';

part 'add_exercises_to_plan_page_state.dart';

class AddExercisesToPlanPageCubit extends Cubit<AddExercisesToPlanPageState> {
  AddExercisesToPlanPageCubit(this._exerciseRepository)
      : super(const AddExercisesToPlanPageState());

  final ExerciseRepository _exerciseRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _exerciseRepository.getItemsStream().listen(
      (exercises) {
        emit(AddExercisesToPlanPageState(exercises: exercises));
      },
    );
    @override
    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }
  }
}
