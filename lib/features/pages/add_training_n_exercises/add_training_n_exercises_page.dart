import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/training_model.dart';
import '../../../repository/training_exercises_repository.dart';
import '../../../repository/training_repository.dart';
import 'confirlming_page/confirming_page.dart';
import 'cubit/add_training_n_exercises_page_cubit.dart';

class AddTrainingExercisesPage extends StatelessWidget {
  const AddTrainingExercisesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _AddTrainingExercisesPageBody(),
    );
  }
}

class _AddTrainingExercisesPageBody extends StatefulWidget {
  const _AddTrainingExercisesPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddTrainingExercisesPageBody> createState() =>
      _AddTrainingExercisesPageBodyState();
}

class _AddTrainingExercisesPageBodyState
    extends State<_AddTrainingExercisesPageBody> {
  String? _selectedtrainingId;
  late String exerciseId;
  late Double weight;
  late Int reps;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddTrainingExercisesPageCubit(
              TrainingRepository(),
              TrainingExercisesRepository(),
            )..start(),
        child: BlocListener<AddTrainingExercisesPageCubit,
            AddTrainingExercisesPageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ConfirmingPage(),
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
          child: BlocBuilder<AddTrainingExercisesPageCubit,
              AddTrainingExercisesPageState>(
            builder: (context, state) {
              final traninigModels = state.traninigName;
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ConfirmingPage(),
                          ),
                        );
                        context.read<AddTrainingExercisesPageCubit>().add(
                              _selectedtrainingId!,
                              '_selectedexerciseId!',
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
                    for (final traninigModel in traninigModels)
                      _ListViewItem(
                        traninigModel: traninigModel,
                        isSelected: _selectedtrainingId == traninigModel.id,
                        onTap: () {
                          setState(() {
                            _selectedtrainingId = traninigModel.id;
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

class _ListViewItem extends StatelessWidget {
  const _ListViewItem(
      {Key? key,
      required this.traninigModel,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  final TraninigModel traninigModel;
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
          // color: const Color.fromARGB(206, 160, 118, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                isSelected ? traninigModel.title : traninigModel.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ));
  }
}
