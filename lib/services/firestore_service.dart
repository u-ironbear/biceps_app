import 'package:biceps_app/models/article.dart';
import 'package:biceps_app/models/exercise.dart';
import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/models/training_day.dart';
import 'package:biceps_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _programsCollectionReference =
      Firestore.instance.collection('programs');
  final CollectionReference _exercisesCollectionReference =
      Firestore.instance.collection('exercises');
  final CollectionReference _articlesCollectionReference =
      Firestore.instance.collection('articles');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (err) {
      return err.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (err) {
      return err.message;
    }
  }

  Future updateUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.id)
          .updateData(user.toJson());
    } catch (err) {
      return err.message;
    }
  }

  Future getExercises(String muscleGroup) async {
    try {
      var exercisesDocument =
          await _exercisesCollectionReference.orderBy('name').getDocuments();
      if (exercisesDocument.documents.isNotEmpty) {
        return exercisesDocument.documents
            .map((snapshot) => Exercise.fromData(snapshot.data))
            .where((element) => element.muscleGroup == muscleGroup)
            .toList();
      }
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  Future getPrograms() async {
    try {
      var programsDocument =
          await _programsCollectionReference.orderBy('order').getDocuments();
      if (programsDocument.documents.isNotEmpty) {
        return programsDocument.documents
            .map((snapshot) => Program.fromData(snapshot.data))
            .toList();
      }
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  Future getTrainingDays(String code) async {
    final CollectionReference trainingDaysCollectionReference = Firestore
        .instance
        .collection('programs')
        .document(code)
        .collection('training_days');

    try {
      var trainingDaysDocument =
          await trainingDaysCollectionReference.getDocuments();
      if (trainingDaysDocument.documents.isNotEmpty) {
        return trainingDaysDocument.documents
            .map((snapshot) => TrainingDay.fromData(snapshot.data))
            .toList();
      }
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  Future getArticles() async {
    try {
      var articlesDocuments =
          await _articlesCollectionReference.orderBy('date').getDocuments();
      if (articlesDocuments.documents.isNotEmpty) {
        return articlesDocuments.documents
            .map((snapshot) => Article.fromData(snapshot.data))
            .where((element) => element.articleTitle != null)
            .toList();
      }
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }
}
