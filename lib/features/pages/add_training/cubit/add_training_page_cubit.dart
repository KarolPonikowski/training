import 'package:bloc/bloc.dart';

import '../../../../repository/training_repository.dart';

part 'add_training_page_state.dart';

class AddPlanNameCubit extends Cubit<AddPlanNamePageState> {
  AddPlanNameCubit(this._plansNameRepository)
      : super(const AddPlanNamePageState());

  final TrainingRepository _plansNameRepository;

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
