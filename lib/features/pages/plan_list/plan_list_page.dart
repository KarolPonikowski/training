import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/training_exercise_model.dart';
import '../../../../repository/training_exercises_repository.dart';
import 'cubit/plan_list_page_cubit.dart';

class PlanListPage extends StatelessWidget {
  const PlanListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConfirmingPage'),
      ),
      body: const _PlanListPageBody(),
    );
  }
}

class _PlanListPageBody extends StatefulWidget {
  const _PlanListPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlanListPageBody> createState() => _ConfirmingPageBodyState();
}

class _ConfirmingPageBodyState extends State<_PlanListPageBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanListPageCubit(
        TrainingExercisesRepository(),
      )..start(),
      child: BlocBuilder<PlanListPageCubit, PlanListPageState>(
          builder: (context, state) {
        final trainingexerciseModels = state.trainingexercise;

        return ListView(
          children: [
            for (final trainingexerciseModel in trainingexerciseModels)
              ConfirmingVievPage(
                trainingexerciseModel: trainingexerciseModel,
              ),
          ],
        );
      }),
    );
  }
}

class ConfirmingVievPage extends StatelessWidget {
  const ConfirmingVievPage({
    Key? key,
    required this.trainingexerciseModel,
  }) : super(key: key);

  final TrainingExerciseModel trainingexerciseModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Container(
          height: 300,
          width: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(206, 150, 115, 209),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                trainingexerciseModel.id,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                trainingexerciseModel.trainingId,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                trainingexerciseModel.exerciseId,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${trainingexerciseModel.weight}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${trainingexerciseModel.reps}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
