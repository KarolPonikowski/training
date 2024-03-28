import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/training_exercise_model.dart';
import '../../../../repository/training_exercises_repository.dart';
import '../../trening_plans_page/trening_plans_page.dart';
import '../add_exercises_to_plan_page/add_exercises_to_plan_page.dart';
import 'cubit/confirming_page_cubit.dart';

class ConfirmingPage extends StatelessWidget {
  const ConfirmingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TraningPlansPage(),
                  ),
                );
              },
            );
          },
        ),
        title: const Text('Potwierdź'),
      ),
      body: const _ConfirmingPageBody(),
    );
  }
}

class _ConfirmingPageBody extends StatefulWidget {
  const _ConfirmingPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_ConfirmingPageBody> createState() => _ConfirmingPageBodyState();
}

class _ConfirmingPageBodyState extends State<_ConfirmingPageBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmingPageCubit(
        TrainingExercisesRepository(),
      )..start(),
      child: BlocBuilder<ConfirmingPageCubit, ConfirmingPageState>(
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ExercisesPage(trainingExerciseModel: trainingexerciseModel),
          ),
        );
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
            ],
          ),
        ),
      ),
    );
  }
}
