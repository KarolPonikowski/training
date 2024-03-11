import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/training_plan_model.dart';
import '../../../repository/training_plan_repository.dart';
import 'add_exercises_to_plan_page/add_exercises_to_plan_page.dart';
import 'cubit/add_new_plan_page_cubit.dart';

class AddNewPlanPage extends StatelessWidget {
  const AddNewPlanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj nowy plan'),
      ),
      body: const _AddNewPlanPageBody(),
    );
  }
}

class _AddNewPlanPageBody extends StatelessWidget {
  const _AddNewPlanPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewPlanPageCubit(PlansNameRepository())..start(),
      child: BlocBuilder<AddNewPlanPageCubit, AddNewPlanPageState>(
        builder: (context, state) {
          final traninigPlanModels = state.plansName;

          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final traninigPlanModel in traninigPlanModels)
                _ListViewItem(traninigPlanModel: traninigPlanModel),
              Container(
                width: 200,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.green,
              )
            ],
          );
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.traninigPlanModel,
  }) : super(key: key);

  final TraninigPlanModel traninigPlanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ExercisesPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                traninigPlanModel.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
