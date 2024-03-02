import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewPlanPage extends StatefulWidget {
  const AddNewPlanPage({super.key, required this.onSave});

  final Function onSave;

  @override
  State<AddNewPlanPage> createState() => _AddNewPlanPageState();
}

class _AddNewPlanPageState extends State<AddNewPlanPage> {
  var trainingName = '';
  var listofExercise = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę planu treningowego',
            ),
            onChanged: (newValue) {
              setState(() {
                trainingName = newValue;
              });
            },
          ),

          // Tu chciałbym przekazać list of string z listą ćwiczeń

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: trainingName.isEmpty || listofExercise.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance
                            .collection('restaurants')
                            .add({
                          'training_id': trainingName,
                          'listofex': listofExercise,
                        });
                        widget.onSave();
                      },
                child: const Text('Dodaj')),
          )
        ],
      )),
    );
  }
}
