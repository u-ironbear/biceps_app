import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/models/user.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future logInWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (err) {
      return err.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String name,
    @required String age,
    @required String gender,
    @required String trackRecord,
    @required String avatar,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Создание нового пользователя
      _currentUser = User(
        id: authResult.user.uid,
        email: email,
        name: name,
        age: age,
        gender: gender,
        trackRecord: trackRecord,
        avatar: avatar,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (err) {
      return err.message;
    }
  }

  Future logOut() async {
    _firebaseAuth.signOut();
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
