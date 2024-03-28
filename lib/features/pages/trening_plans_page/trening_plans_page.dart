import 'package:flutter/material.dart';

import '../add_exercise/add_exercise_page.dart';
import '../add_training/add_training_page.dart';
import '../add_training_n_exercises/add_training_n_exercises_page.dart';
import '../add_training_n_exercises/confirlming_page/confirming_page.dart';
import '../plan_list/plan_list_page.dart';

class TraningPlansPage extends StatefulWidget {
  const TraningPlansPage({Key? key}) : super(key: key);

  @override
  State<TraningPlansPage> createState() => _TraningPlansPageState();
}

class _TraningPlansPageState extends State<TraningPlansPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Plany Treningowe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddExercisePage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Dodaj nowe ćwiczenie'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTrainingExercisesPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Dodaj ćwiczenia do planu'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTrainingPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Dodaj nowy plan treningowy'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlanListPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Twoje plany'),
            ),
          ],
        ),
      ),
    );
  }
}
