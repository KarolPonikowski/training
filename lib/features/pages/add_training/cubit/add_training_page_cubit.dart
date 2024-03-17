import 'package:bloc/bloc.dart';

import '../../../../repository/training_repository.dart';

part 'add_training_page_state.dart';

class AddTrainingPageCubit extends Cubit<AddTrainingPageState> {
  AddTrainingPageCubit(this._plansNameRepository)
      : super(const AddTrainingPageState());

  final TrainingRepository _plansNameRepository;

  Future<void> add(
    String title,
  ) async {
    try {
      await _plansNameRepository.add(
        title,
      );
      emit(const AddTrainingPageState(saved: true));
    } catch (error) {
      emit(AddTrainingPageState(errorMessage: error.toString()));
    }
  }
}
