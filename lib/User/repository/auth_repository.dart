import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_calimax/User/repository/firebase_auth_api.dart';

//logica de sesion
class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

}