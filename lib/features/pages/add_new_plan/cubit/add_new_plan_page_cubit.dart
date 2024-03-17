import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:training/repository/training_repository.dart';

import '../../../../models/training_model.dart';
import '../../../../repository/training_exercises_repository.dart';

part 'add_new_plan_page_state.dart';

class AddNewPlanPageCubit extends Cubit<AddNewPlanPageState> {
  AddNewPlanPageCubit(
    this._plansNameRepository,
    this._plansRepository,
  ) : super(const AddNewPlanPageState());

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
      emit(const AddNewPlanPageState(saved: true));
    } catch (error) {
      emit(AddNewPlanPageState(errorMessage: error.toString()));
    }
  }

  Future<void> start() async {
    _streamSubscription = _plansNameRepository.getItemsStream().listen(
      (plansName) {
        emit(AddNewPlanPageState(plansName: plansName));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
