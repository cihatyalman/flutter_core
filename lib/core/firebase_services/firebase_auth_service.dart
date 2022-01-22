import 'package:firebase_auth/firebase_auth.dart';
import '../utilities/console.dart';

class FirebaseAuthService {
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
        Console.printError(
            "[C_firebase_register]: Bu e-posta için hesap zaten var.");
      }
    } catch (e) {
      Console.printError(e.toString());
    }
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
        Console.printError("[C_firebase_signin]: Bu e-posta için kullanıcı bulunamadı.");
      } else if (e.code == 'wrong-password') {
        Console.printError("[C_firebase_signin]: Bu kullanıcı için yanlış şifre sağlandı.");
      }
    }
  }

  Future<bool> signOut() async {
    try {
      await instance.signOut();
      return true;
    } catch (e) {
      Console.printError(e.toString());
      return false;
    }
  }
}
