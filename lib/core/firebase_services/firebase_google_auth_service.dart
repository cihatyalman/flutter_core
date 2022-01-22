import 'package:google_sign_in/google_sign_in.dart';
import '../utilities/console.dart';

class GoogleAuthService {
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? currentUser;

  GoogleAuthService() {
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        currentUser = account;
      },
    );
    googleSignIn.signInSilently();
  }

  Future<bool> signIn() async {
    try {
      await googleSignIn.signIn();
      return true;
    } catch (e) {
      Console.printError(e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await googleSignIn.disconnect();
      return true;
    } catch (e) {
      Console.printError(e.toString());
      return false;
    }
  }
}
