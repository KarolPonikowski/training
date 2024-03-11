import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/training_plan_repository.dart';
import '../add_new_plan/add_new_plan_page.dart';
import 'cubit/add_plan_name_page_cubit.dart';

class AddPlanNamePage extends StatefulWidget {
  const AddPlanNamePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlanNamePage> createState() => _AddPlanNamePageState();
}

class _AddPlanNamePageState extends State<AddPlanNamePage> {
  String? _title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddPlanNameCubit(PlansNameRepository()),
        child: BlocListener<AddPlanNameCubit, AddPlanNamePageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddNewPlanPage(),
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
                body: _AddPlanNameBody(
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

class _AddPlanNameBody extends StatelessWidget {
  const _AddPlanNameBody({Key? key, required this.onTitleChanged})
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
