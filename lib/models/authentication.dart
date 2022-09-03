import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppUserAuthenticationModel {
  final String? userId;
  final String userEmail;
  final String userPassword;
  final String? userName;

  AppUserAuthenticationModel(
      {required this.userEmail,
      required this.userPassword,
      this.userId,
      this.userName});
}

class Authentication {
  AppUserAuthenticationModel? _user;

  Future createUser(AppUserAuthenticationModel user) async {
    Firebase.initializeApp();
    UserCredential response = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.userEmail, password: user.userPassword);

    _user = user;
  }

  Future signInUser(AppUserAuthenticationModel user) async {
    UserCredential response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: user.userEmail, password: user.userPassword);

    print(response.user!.email);
  }

  AppUserAuthenticationModel? get user {
    return _user;
  }
}
