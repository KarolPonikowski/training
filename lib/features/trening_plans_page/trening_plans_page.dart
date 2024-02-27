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
    );
  }
}
