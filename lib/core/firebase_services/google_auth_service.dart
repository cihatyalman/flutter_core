// Documents and Integration
/*
https://pub.dev/packages/google_sign_in

- Firebase Authentication üzeriden google aktif et.
NOT: Firebase yerine Google Cloud kullanılabilir.

ANDROID:
Firebase üzerinden SHA bilgisi ekledikten sonra google-services.json dosyasını uygulamaya ekleyin.

IOS:
GoogleService-Info.plist içindeki CLIENT_ID'leri aşağıdaki gibi Info.plist içine kopyalayın.
<!-- Google Sign-in -->
<key>GIDClientID</key>
<string>[YOUR IOS CLIENT_ID]</string>
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>[YOUR IOS REVERSED_CLIENT_ID]</string>
		</array>
	</dict>
</array>

*/

import 'package:google_sign_in/google_sign_in.dart';

final googleAuthService = GoogleAuthService();

class GoogleAuthService {
  final scopes = <String>["https://www.googleapis.com/auth/userinfo.profile"];

  GoogleSignInAccount? currentUser;
  bool isAuthorized = false;
  final googleSignIn = GoogleSignIn.instance;

  Future<void> init() async {
    await googleSignIn.initialize();
    googleSignIn.authenticationEvents
        .listen(_handleAuthenticationEvent)
        .onError(_handleAuthenticationError);

    googleSignIn.attemptLightweightAuthentication();
  }

// #region handle
  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    final GoogleSignInClientAuthorization? authorization =
        await user?.authorizationClient.authorizationForScopes(scopes);

    currentUser = user;
    isAuthorized = authorization != null;

    if (user != null && authorization != null) {
      // _handleGetContact(user);
    }
  }

  Future<void> _handleAuthenticationError(Object e) async {
    currentUser = null;
    isAuthorized = false;
  }
// #endregion

  Future<GoogleSignInAccount?> signIn() async {
    try {
      return await googleSignIn.authenticate();
    } catch (e) {
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await googleSignIn.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
