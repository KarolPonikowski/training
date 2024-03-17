import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/training_plan_model.dart';
import '../../../repository/plans_repository.dart';
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

class _AddNewPlanPageBody extends StatefulWidget {
  const _AddNewPlanPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddNewPlanPageBody> createState() => _AddNewPlanPageBodyState();
}

class _AddNewPlanPageBodyState extends State<_AddNewPlanPageBody> {
  String? _selecteedPlanId;
  late String exerciseId;
  late Double weight;
  late Int reps;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddNewPlanPageCubit(
              PlansNameRepository(),
              PlansRepository(),
            )..start(),
        child: BlocListener<AddNewPlanPageCubit, AddNewPlanPageState>(
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
          child: BlocBuilder<AddNewPlanPageCubit, AddNewPlanPageState>(
            builder: (context, state) {
              final traninigPlanModels = state.plansName;

              return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ExercisesPage(),
                            fullscreenDialog: true,
                          ),
                        );
                        context.read<AddNewPlanPageCubit>().add(
                              _selecteedPlanId!,
                              '2',
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
                    for (final traninigPlanModel in traninigPlanModels)
                      _ListViewItem(
                        traninigPlanModel: traninigPlanModel,
                        isSelected: _selecteedPlanId == traninigPlanModel.id,
                        onTap: () {
                          setState(() {
                            _selecteedPlanId = traninigPlanModel.id;
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
      required this.traninigPlanModel,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  final TraninigPlanModel traninigPlanModel;
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
          color: const Color.fromARGB(206, 160, 118, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                isSelected ? "+" : "-", // traninigPlanModel.title,
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
