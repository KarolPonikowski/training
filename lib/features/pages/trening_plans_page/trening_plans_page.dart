import 'package:flutter/material.dart';

class TraningPlansPage extends StatefulWidget {
  const TraningPlansPage({Key? key}) : super(key: key);

  @override
  State<TraningPlansPage> createState() => _TraningPlansPageState();
}

class _TraningPlansPageState extends State<TraningPlansPage> {
  String? _title;

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
                  MaterialPageRoute(builder: (context) => AddNewPlanPage()),
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
