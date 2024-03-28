import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/exercise_model.dart';
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

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({
    required this.trainingExerciseModel,
    Key? key,
  }) : super(key: key);

  final TrainingExerciseModel trainingExerciseModel;

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  String? _selectedexerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExercisesToPlanPageCubit(
        ExerciseRepository(),
        TrainingExercisesRepository(),
      )..start(),
      child:
          BlocBuilder<AddExercisesToPlanPageCubit, AddExercisesToPlanPageState>(
        builder: (context, state) {
          final exerciseModels = state.exercises;

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: _selectedexerciseId == null
                      ? null
                      : () {
                          context
                              .read<AddExercisesToPlanPageCubit>()
                              .updateExcercise(
                                widget.trainingExerciseModel.id,
                                _selectedexerciseId!,
                              );
                        },
                  icon: const Icon(Icons.check),
                )
              ],
            ),
            body: ListView(
              children: [
                for (final exerciseModel in exerciseModels)
                  ExercisesPageViev(
                    exerciseModel: exerciseModel,
                    isSelected: _selectedexerciseId == exerciseModel.id,
                    onTap: () {
                      setState(() {
                        _selectedexerciseId = exerciseModel.id;
                      });
                    },
                  ),
                Container(
                  width: 200,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  color: Colors.amber,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExercisesPageViev extends StatelessWidget {
  const ExercisesPageViev({
    Key? key,
    required this.exerciseModel,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final ExerciseModel exerciseModel;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.amber,
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
        ));
  }
}
