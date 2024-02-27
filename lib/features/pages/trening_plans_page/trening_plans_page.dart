import 'package:flutter/material.dart';

import '../add_new_plan/add_new_plan_page.dart';

class TraningPlansPage extends StatelessWidget {
  const TraningPlansPage({Key? key}) : super(key: key);

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
                      builder: (context) => AddNewPlanPage(
                            title: '',
                          )),
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
              onPressed: () {},
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
