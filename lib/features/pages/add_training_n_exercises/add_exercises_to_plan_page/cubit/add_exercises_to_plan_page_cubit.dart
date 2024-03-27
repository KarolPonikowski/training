import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/exercise_model.dart';
import '../../../../../models/training_exercise_model.dart';
import '../../../../../repository/exercise_repository.dart';
import '../../../../../repository/training_exercises_repository.dart';

part 'add_exercises_to_plan_page_state.dart';

class AddExercisesToPlanPageCubit extends Cubit<AddExercisesToPlanPageState> {
  AddExercisesToPlanPageCubit(
    this._exerciseRepository,
    this._trainingexercisesRepository,
  ) : super(const AddExercisesToPlanPageState());

  final ExerciseRepository _exerciseRepository;
  final TrainingExercisesRepository _trainingexercisesRepository;

  Future<void> updateExcercise(
    String id,
    String exerciseId,
  ) async {
    try {
      await _trainingexercisesRepository.update(
        id,
        exerciseId,
      );
      emit(const AddExercisesToPlanPageState(saved: true));
    } catch (error) {
      emit(AddExercisesToPlanPageState(errorMessage: error.toString()));
    }
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _exerciseRepository.getItemsStream().listen(
      (exercises) {
        print(exercises.length);
        emit(AddExercisesToPlanPageState(exercises: exercises));
      },
    )..onError((error) {
        print(error.toString());
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
