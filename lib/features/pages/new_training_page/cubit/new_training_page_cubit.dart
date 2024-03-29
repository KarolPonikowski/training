import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_training_page_state.dart';

class NewTrainingPageCubit extends Cubit<NewTrainingPageState> {
  NewTrainingPageCubit() : super(NewTrainingPageInitial());
}
