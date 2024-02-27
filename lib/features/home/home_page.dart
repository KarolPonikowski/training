import 'package:flutter/material.dart';

import '../trening_plans_page/trening_plans_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                  MaterialPageRoute(builder: (context) => TraningPlansPage()),
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
