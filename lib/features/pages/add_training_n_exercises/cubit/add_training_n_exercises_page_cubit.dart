import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:training/repository/training_repository.dart';

import '../../../../models/training_exercise_model.dart';
import '../../../../models/training_model.dart';
import '../../../../repository/training_exercises_repository.dart';

part 'add_training_n_exercises_page_state.dart';

class AddTrainingExercisesPageCubit
    extends Cubit<AddTrainingExercisesPageState> {
  AddTrainingExercisesPageCubit(
    this._trainingRepository,
    this._trainingexercisesRepository,
  ) : super(const AddTrainingExercisesPageState());

  final TrainingRepository _trainingRepository;
  final TrainingExercisesRepository _trainingexercisesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String trainingId,
    String exerciseId,
    double weight,
    int reps,
  ) async {
    try {
      await _trainingexercisesRepository.add(
        trainingId,
        exerciseId,
        weight,
        reps,
      );
      emit(const AddTrainingExercisesPageState(saved: true));
    } catch (error) {
      emit(AddTrainingExercisesPageState(errorMessage: error.toString()));
    }
  }

  Future<void> start() async {
    _streamSubscription = _trainingRepository.getItemsStream().listen(
      (traninigName) {
        emit(AddTrainingExercisesPageState(traninigName: traninigName));
      },
    )..onError(
        (error) {
          emit(const AddTrainingExercisesPageState(loadingErrorOccured: true));
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
