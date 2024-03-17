import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:training/repository/training_repository.dart';

import '../../../../models/training_model.dart';
import '../../../../repository/training_exercises_repository.dart';

part 'add_training_n_exercises_page_state.dart';

class AddTrainingExercisesPageCubit
    extends Cubit<AddTrainingExercisesPageState> {
  AddTrainingExercisesPageCubit(
    this._plansNameRepository,
    this._plansRepository,
  ) : super(const AddTrainingExercisesPageState());

  final TrainingRepository _plansNameRepository;
  final TrainingExercisesRepository _plansRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String trainingId,
    String exerciseId,
    double weight,
    int reps,
  ) async {
    try {
      await _plansRepository.add(
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
    _streamSubscription = _plansNameRepository.getItemsStream().listen(
      (plansName) {
        emit(AddTrainingExercisesPageState(plansName: plansName));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
