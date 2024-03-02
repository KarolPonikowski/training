import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewPlanPage extends StatefulWidget {
  const AddNewPlanPage({super.key, required this.onSave});

  final Function onSave;

  @override
  State<AddNewPlanPage> createState() => _AddNewPlanPageState();
}

class _AddNewPlanPageState extends State<AddNewPlanPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
