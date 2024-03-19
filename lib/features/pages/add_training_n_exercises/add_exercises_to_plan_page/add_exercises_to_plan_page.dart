import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/exercise_model.dart';
import '../../../../repository/exercise_repository.dart';
import '../../../../repository/training_exercises_repository.dart';
import 'cubit/add_exercises_to_plan_page_cubit.dart';

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

class _ExercisesPageBody extends StatefulWidget {
  const _ExercisesPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_ExercisesPageBody> createState() => _ExercisesPageBodyState();
}

class _ExercisesPageBodyState extends State<_ExercisesPageBody> {
  String? _selectedtrainingId;
  String? _selectedexerciseId;

  late Double weight;
  late Int reps;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddExercisesToPlanPageCubit(
              ExerciseRepository(),
              TrainingExercisesRepository(),
            )..start(),
        child: BlocListener<AddExercisesToPlanPageCubit,
            AddExercisesToPlanPageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ExercisesPage(),
                ),
              );
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<AddExercisesToPlanPageCubit,
              AddExercisesToPlanPageState>(
            builder: (context, state) {
              final exerciseModels = state.exercises;

              return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ExercisesPage(),
                          ),
                        );
                        context.read<AddExercisesToPlanPageCubit>().add(
                              _selectedtrainingId!,
                              _selectedexerciseId!,
                              2.2,
                              2,
                            );
                      },
                      icon: const Icon(Icons.check),
                    )
                  ],
                ),
                body: ListView(
                  children: [
                    for (final exerciseModel in exerciseModels)
                      ExercisesVievPage(
                        exerciseModel: exerciseModel,
                        isSelected: _selectedexerciseId == exerciseModel.id,
                        onTap: () {
                          setState(() {
                            _selectedexerciseId = exerciseModel.id;
                          });
                        },
                      ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class ExercisesVievPage extends StatelessWidget {
  const ExercisesVievPage(
      {Key? key,
      required this.exerciseModel,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  final ExerciseModel exerciseModel;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
                      isSelected ? exerciseModel.title : exerciseModel.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
