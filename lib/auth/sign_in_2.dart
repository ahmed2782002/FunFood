import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../data/provider.dart';
import '../l10n/app_localizations.dart';
import '../screens/home_layout.dart';
class SignIn2 extends StatelessWidget {
  static const String routeName = 'sign-in2';

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xff0B192C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialButton(
                iconPath: 'assets/goo.png',
                label: local.loginWithGoogle,
                onPressed: () => _signInWithGoogle(context),
              ),
              SizedBox(height: 28.h),
              _socialButton(
                iconPath: 'assets/gg.png',
                label: local.continueAsGuest,
                onPressed: () =>
                    Navigator.pushNamed(context, HomeLayout.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithGoogle(BuildContext context) async {
    final local = AppLocalizations.of(context)!;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        // ✅ تحميل البيانات من Firestore
        final provider =
        Provider.of<UserOnboardingProvider>(context, listen: false);
        await provider.fetchUserDataFromFirestore(user.uid);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(local.welcomeBack(user.displayName ?? "User"))),
        );

        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      }
    } catch (e) {
      print('Google sign-in error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.googleSignInFailed)),
      );
    }
  }

  Widget _socialButton({
    required String iconPath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white),
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 30, width: 30),
          SizedBox(width: 12),
          Expanded(
            child:
            Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
