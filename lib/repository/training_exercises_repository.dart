import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/training_exercise_model.dart';

class TrainingExercisesRepository {
  Stream<List<TrainingExerciseModel>> getItemsStream() {
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
          return TrainingExerciseModel(
            id: doc.id,
            trainingId: doc['trainingId'],
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

  Future<TrainingExerciseModel> get({required String id}) async {
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
    return TrainingExerciseModel(
      id: doc.id,
      trainingId: doc['trainingId'],
      exerciseId: doc['exerciseId'],
      weight: doc['weight'],
      reps: doc['reps'],
    );
  }

  Future<void> add(
    String trainingId,
    String exerciseId,
    double weight,
    int reps,
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
        'trainingId': trainingId,
        'exerciseId': exerciseId,
        'weight': weight,
        'reps': reps,
      },
    );
  }

  Future<void> update(
    String id,
    String exerciseId,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('PlanExercise')
        .doc(id)
        .update(
      {
        'exerciseId': exerciseId,
      },
    );
  }
}
