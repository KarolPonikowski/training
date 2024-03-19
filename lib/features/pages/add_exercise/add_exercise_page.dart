import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/exercise_repository.dart';
import 'cubit/add_exercise_page_cubit.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  String? _title;
  String? _part;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddExerciseCubit(ExerciseRepository()),
        child: BlocListener<AddExerciseCubit, AddExercisePageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop();
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
          child: BlocBuilder<AddExerciseCubit, AddExercisePageState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Training App'),
                  actions: [
                    ElevatedButton(
                      onPressed: _title == null
                          ? null
                          : _part == null || _title == null
                              ? null
                              : () {
                                  context.read<AddExerciseCubit>().add(
                                        _title!,
                                      );
                                },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                body: _AddPlanNameBody(
                  onTitleChanged: (newValue) {
                    setState(() {
                      _title = newValue;
                    });
                  },
                  onPartChanged: (newValue) {
                    setState(() {
                      _part = newValue;
                    });
                  },
                ),
              );
            },
          ),
        ));
  }
}

class _AddPlanNameBody extends StatelessWidget {
  const _AddPlanNameBody(
      {Key? key, required this.onTitleChanged, required this.onPartChanged})
      : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onPartChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Deadlift',
            label: Text('Ćwiczenie'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onPartChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Plecy',
            label: Text('Partia mięśniowa'),
          ),
        ),
      ],
    );
  }
}
