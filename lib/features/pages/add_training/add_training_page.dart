import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/training_repository.dart';
import '../add_training_n_exercises/add_training_n_exercises_page.dart';
import 'cubit/add_training_page_cubit.dart';

class AddTrainingPage extends StatefulWidget {
  const AddTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTrainingPage> createState() => _AddTrainingPageState();
}

class _AddTrainingPageState extends State<AddTrainingPage> {
  String? _title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddPlanNameCubit(TrainingRepository()),
        child: BlocListener<AddPlanNameCubit, AddPlanNamePageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTrainingExercisesPage(),
                  fullscreenDialog: true,
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
          child: BlocBuilder<AddPlanNameCubit, AddPlanNamePageState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Training App'),
                  actions: [
                    IconButton(
                      onPressed: _title == null
                          ? null
                          : () {
                              context.read<AddPlanNameCubit>().add(_title!);
                            },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                body: _AddTrainingBody(
                  onTitleChanged: (newValue) {
                    setState(() {
                      _title = newValue;
                    });
                  },
                ),
              );
            },
          ),
        ));
  }
}

class _AddTrainingBody extends StatelessWidget {
  const _AddTrainingBody({Key? key, required this.onTitleChanged})
      : super(key: key);

  final Function(String) onTitleChanged;

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
            hintText: 'Nazwa nowego planu treningowego',
            label: Text('Nazwa planu'),
          ),
        ),
      ],
    );
  }
}
