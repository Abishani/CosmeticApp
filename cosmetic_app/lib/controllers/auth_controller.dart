import 'package:cosmetic_app/pages/homePage.dart';
import 'package:cosmetic_app/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

Future<void> googleSignIn() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // User canceled the sign-in process
      Get.snackbar("Error", "Sign in process was canceled");
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);

    // Navigate to HomePage upon successful sign-in
    Get.to(HomePage());
  } catch (e) {
    Get.snackbar("Error", "Failed to sign in with Google");
  }
}

void signOut() async {
  try {
    await _auth.signOut();
    await GoogleSignIn().signOut();

    // Navigate to LoginPage or another appropriate screen after sign-out
    Get.offAll(LoginPage());
  } catch (e) {
    Get.snackbar("Error", "Failed to sign out");
  }
}

}
