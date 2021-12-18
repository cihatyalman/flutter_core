import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  Future<bool> signIn() async {
    try {
      googleAccount = await googleSignIn.signIn();
      return true;
    } catch (e) {
      print("[C_ERROR]: ${e}");
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      googleAccount = await googleSignIn.signOut();
      return true;
    } catch (e) {
      print("[C_ERROR]: ${e}");
      return false;
    }
  }
}
