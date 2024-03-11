import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/features/pages/add_new_plan/add_exercises_to_plan_page/cubit/add_exercises_to_plan_page_cubit.dart';

import '../../../../models/exercise_model.dart';
import '../../../../repository/exercise_repository.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj nowy plan'),
      ),
      body: const _ExercisesPageBody(),
    );
  }
}

class _ExercisesPageBody extends StatelessWidget {
  const _ExercisesPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddExercisesToPlanPageCubit(ExerciseRepository())..start(),
      child:
          BlocBuilder<AddExercisesToPlanPageCubit, AddExercisesToPlanPageState>(
        builder: (context, state) {
          final exerciseModels = state.exercises;

          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final exerciseModel in exerciseModels)
                ExercisesVievPage(
                  exerciseModel: exerciseModel,
                ),
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

class ExercisesVievPage extends StatelessWidget {
  const ExercisesVievPage({
    Key? key,
    required this.exerciseModel,
  }) : super(key: key);

  final ExerciseModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              width: 2,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    exerciseModel.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            exerciseModel.part,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]));
  }
}
