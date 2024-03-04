import 'package:flutter/material.dart';

class AddExerciseWidget extends StatelessWidget {
  const AddExerciseWidget({
    super.key,
    required this.onTitleChanged,
  });

  final Function(String p1) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTitleChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Nazwa ćwiecznia',
        label: Text('Nazwa ćwiczenia'),
      ),
    );
  }
}
