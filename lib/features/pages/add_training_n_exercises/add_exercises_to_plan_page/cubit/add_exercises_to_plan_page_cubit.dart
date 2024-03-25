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

  StreamSubscription? _streamSubscription;

  Future<void> update(
    String id,
    String exerciseId,
    double weight,
    int reps,
  ) async {
    try {
      await _trainingexercisesRepository.update(
        id,
        exerciseId,
        weight,
        reps,
      );
      emit(const AddExercisesToPlanPageState(saved: true));
    } catch (error) {
      emit(AddExercisesToPlanPageState(errorMessage: error.toString()));
    }
  }

  Future<void> getItemWithID(String id) async {
    final trainingexerciseModel =
        await _trainingexercisesRepository.get(id: id);
    emit(AddExercisesToPlanPageState(
        trainingexerciseModel: trainingexerciseModel));

    Future<void> start() async {
      _streamSubscription = _exerciseRepository.getItemsStream().listen(
        (exercises) {
          emit(AddExercisesToPlanPageState(exercises: exercises));
        },
      );
    }

    @override
    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }
  }
}
