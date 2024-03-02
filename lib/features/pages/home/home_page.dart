import 'package:flutter/material.dart';

import '../trening_plans_page/trening_plans_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TrainingApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Dodaj nowy trening'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            )),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Zrealizowane treningi'),
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
                      builder: (context) => const TraningPlansPage()),
                );
              },
              child: const Text('Plany Treningowe'),
            ),
          ],
        ),
      ),
    );
  }
}
