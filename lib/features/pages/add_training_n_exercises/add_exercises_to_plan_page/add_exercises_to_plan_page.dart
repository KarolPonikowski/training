import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/training_exercise_model.dart';
import '../../../../repository/exercise_repository.dart';
import '../../../../repository/training_exercises_repository.dart';
import 'cubit/add_exercises_to_plan_page_cubit.dart';

class ExercisesVievPage extends StatelessWidget {
  const ExercisesVievPage({
    Key? key,
    required this.trainingExerciseModel,
  }) : super(key: key);

  final TrainingExerciseModel trainingExerciseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Column(
          children: [
            Container(
              width: 2,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    trainingExerciseModel.trainingId,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AddExercisesToPlanPageCubit(
          ExerciseRepository(),
          TrainingExercisesRepository(),
        )..getItemWithID(id),
        child: BlocBuilder<AddExercisesToPlanPageCubit,
            AddExercisesToPlanPageState>(
          builder: (context, state) {
            final trainingexerciseModel = state.trainingexerciseModel;

            if (trainingexerciseModel == null) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: [
                ExercisesPageViev(
                  trainingexerciseModel: trainingexerciseModel,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ExercisesPageViev extends StatelessWidget {
  const ExercisesPageViev({
    Key? key,
    required this.trainingexerciseModel,
  }) : super(key: key);

  final TrainingExerciseModel trainingexerciseModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => ExercisesPage(id: trainingExerciseModel.id),
          //   ),
          // );
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              // Text(
              //   trainingExerciseModel.id,
              //   style: const TextStyle(
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Text(
                trainingexerciseModel.trainingId,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                trainingexerciseModel.exerciseId,
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
