// ignore_for_file: avoid_print

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static final GoogleAuthService _instance = GoogleAuthService._internal();
  factory GoogleAuthService() => _instance;
  GoogleAuthService._internal() {
    googleSignIn.onCurrentUserChanged
        .listen((account) => currentUser = account);
    googleSignIn.signInSilently();
  }

  final googleSignIn = GoogleSignIn(
      // clientId: Platform.isAndroid ? null : "....apps.googleusercontent.com",
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

  GoogleSignInAccount? currentUser;

  Future<GoogleSignInAccount?> signIn() async {
    try {
      return await googleSignIn.signIn();
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  Future<GoogleSignInAccount?> signOut() async {
    try {
      return await googleSignIn.disconnect();
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }
}
