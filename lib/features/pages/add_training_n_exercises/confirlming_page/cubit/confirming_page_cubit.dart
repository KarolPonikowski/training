import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../models/training_exercise_model.dart';
import '../../../../../repository/training_exercises_repository.dart';

part 'confirming_page_state.dart';

class ConfirmingPageCubit extends Cubit<ConfirmingPageState> {
  ConfirmingPageCubit(
    this._trainingexercisesRepository,
  ) : super(const ConfirmingPageState());

  final TrainingExercisesRepository _trainingexercisesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _trainingexercisesRepository.getItemsStream().listen(
      (trainingexercise) {
        emit(ConfirmingPageState(trainingexercise: trainingexercise));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
