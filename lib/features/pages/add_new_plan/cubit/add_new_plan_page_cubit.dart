import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:training/repository/training_plan_repository.dart';

import '../../../../models/training_plan_model.dart';

part 'add_new_plan_page_state.dart';

class AddNewPlanPageCubit extends Cubit<AddNewPlanPageState> {
  AddNewPlanPageCubit(this._plansNameRepository)
      : super(const AddNewPlanPageState());

  final PlansNameRepository _plansNameRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _plansNameRepository.getItemsStream().listen(
      (plansName) {
        emit(AddNewPlanPageState(plansName: plansName));
      },
    );

    @override
    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }
  }
}
