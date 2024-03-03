import 'package:bloc/bloc.dart';

import '../../../../repository/training_plan_repository.dart';

part 'add_plan_name_page_state.dart';

class AddPlanNameCubit extends Cubit<AddPlanNamePageState> {
  AddPlanNameCubit(this._plansNameRepository)
      : super(const AddPlanNamePageState());

  final PlansNameRepository _plansNameRepository;

  Future<void> add(
    String title,
  ) async {
    try {
      await _plansNameRepository.add(
        title,
      );
      emit(const AddPlanNamePageState(saved: true));
    } catch (error) {
      emit(AddPlanNamePageState(errorMessage: error.toString()));
    }
  }
}
