// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();
  factory FirebaseAuthService() => _instance;
  FirebaseAuthService._internal();

  final instance = FirebaseAuth.instance;

  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("[C_firebase_register]: Bu e-posta için hesap zaten var.");
      }
    } catch (e) {
      print("[C_ERROR]: $e");
    }
    return null;
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("[C_firebase_signin]: Bu e-posta için kullanıcı bulunamadı.");
      } else if (e.code == 'wrong-password') {
        print("[C_firebase_signin]: Bu kullanıcı için yanlış şifre sağlandı.");
      }
    }
    return null;
  }

  Future<bool> signOut() async {
    try {
      await instance.signOut();
      return true;
    } catch (e) {
      print("[C_ERROR]: $e");
      return false;
    }
  }

  Future<bool> sendEmailVerification() async {
    try {
      await instance.currentUser?.sendEmailVerification();
      return true;
    } catch (e) {
      print("[C_ERROR]: $e");
      return false;
    }
  }

  Future<bool> verifyBeforeUpdateEmail(String newEmail) async {
    try {
      await instance.currentUser?.verifyBeforeUpdateEmail(newEmail);
      return true;
    } catch (e) {
      print("[C_ERROR]: $e");
      return false;
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      await instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print("[C_ERROR]: $e");
      return false;
    }
  }
}
