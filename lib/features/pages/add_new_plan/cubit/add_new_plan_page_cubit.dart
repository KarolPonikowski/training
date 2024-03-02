import 'dart:ffi';

import 'package:bloc/bloc.dart';

import '../../../../repository/plans_repository.dart';

part 'add_new_plan_page_state.dart';

class AddNewPlanPageCubit extends Cubit<AddNewPlanPageState> {
  AddNewPlanPageCubit(this._plansRepository)
      : super(const AddNewPlanPageState());

  final PlansRepository _plansRepository;

  Future<void> add(
    String planId,
    String exerciseId,
    Double weight,
    Int reps,
  ) async {
    try {
      await _plansRepository.add(planId, exerciseId, weight, reps);
      emit(const AddNewPlanPageState(saved: true));
    } catch (error) {
      emit(AddNewPlanPageState(errorMessage: error.toString()));
    }
  }
}
