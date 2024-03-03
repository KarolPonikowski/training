import 'package:flutter/material.dart';

import '../add_new_plan/add_new_plan_page.dart';
import '../add_plan_name/add_plan_name_page.dart';
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
                    builder: (context) => const AddNewPlanPage(),
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
                      builder: (context) => const AddPlanNamePage()),
                );
              },
              child: const Text('Edytuj istniejący plan treningowy'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            )),
          ],
        ),
      ),
    );
  }
}
