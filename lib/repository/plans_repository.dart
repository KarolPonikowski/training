import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/plan_exercise_model.dart';

class PlansRepository {
  Stream<List<PlanExerciseModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('PlanExercise')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return PlanExerciseModel(
            id: doc.id,
            planId: doc['planId'],
            exerciseId: doc['exerciseId'],
            weight: doc['weight'],
            reps: doc['reps'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('PlanExercise')
        .doc(id)
        .delete();
  }

  Future<PlanExerciseModel> get({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('PlanExercise')
        .doc(id)
        .get();
    return PlanExerciseModel(
      id: doc.id,
      planId: doc['planId'],
      exerciseId: doc['exerciseId'],
      weight: doc['weight'],
      reps: doc['reps'],
    );
  }

  Future<void> add(
    String planId,
    String exerciseId,
    Double weight,
    Int reps,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('PlanExercise')
        .add(
      {
        'planId': planId,
        'exerciseId': exerciseId,
        'weight': weight,
        'reps': reps,
      },
    );
  }
}
