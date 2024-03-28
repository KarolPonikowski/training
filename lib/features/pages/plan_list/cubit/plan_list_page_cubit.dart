import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../models/training_exercise_model.dart';
import '../../../../repository/training_exercises_repository.dart';

part 'plan_list_page_state.dart';

class PlanListPageCubit extends Cubit<PlanListPageState> {
  PlanListPageCubit(
    this._trainingexercisesRepository,
  ) : super(const PlanListPageState());

  final TrainingExercisesRepository _trainingexercisesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _trainingexercisesRepository.getItemsStream().listen(
      (trainingexercise) {
        emit(PlanListPageState(trainingexercise: trainingexercise));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
