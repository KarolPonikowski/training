import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:training/repository/training_plan_repository.dart';

import '../../../../models/training_plan_model.dart';
import '../../../../repository/plans_repository.dart';

part 'add_new_plan_page_state.dart';

class AddNewPlanPageCubit extends Cubit<AddNewPlanPageState> {
  AddNewPlanPageCubit(
      this._plansNameRepository, this._plansRepository, this._updatePlanId)
      : super(const AddNewPlanPageState());

  final PlansNameRepository _plansNameRepository;
  final PlansRepository _plansRepository;
  final Function(String) _updatePlanId;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String planId,
    String exerciseId,
    Double weight,
    Int reps,
  ) async {
    try {
      await _plansRepository.add(
        planId,
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

  Future<void> onPlanIdChanged(TraninigPlanModel traninigPlanModel) async {
    _updatePlanId(traninigPlanModel.id);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
