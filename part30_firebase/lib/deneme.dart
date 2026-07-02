import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;
  final String email = "nazifeatmaca622@gmail.com";
  final String password = "password1234";

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User oturumu kapattı');
      } else {
        debugPrint('User ${user.email} ve mail durumu ${user.emailVerified}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AutDeneme")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                createUserEmailandPassword();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Email/Şifre Kayıt"),
            ),
            ElevatedButton(
              onPressed: () {
                loginUserEmailandPassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text("Email/Şifre Giriş"),
            ),
            ElevatedButton(
              onPressed: () {
                signoutUserEmailandPassword();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text("Email/Şifre Çıkış"),
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text("Google ile giriş"),
            ),
            ElevatedButton(
              onPressed: () {
                loginWithPhoneNumber();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              child: Text("Telefon ile giriş"),
            ),
          ],
        ),
      ),
    );
  }

  void createUserEmailandPassword() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!_userCredential.user!.emailVerified) {
        await _userCredential.user!.sendEmailVerification();
        debugPrint("Onaylama maili gönderildi");
      }
      print(_userCredential.toString());
    } catch (e) {
      print("Hata mesajı $e");
    }
  }

  void loginUserEmailandPassword() async {
    try {
      var _userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(_userCredential.toString());
    } catch (e) {
      print("Hata mesajı $e");
    }
  }

  void signoutUserEmailandPassword() async {
    await GoogleSignIn.instance.signOut();
    await auth.signOut();
  }




  Future<UserCredential?> signInWithGoogle() async {
    try{
      await GoogleSignIn.instance.initialize();
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      debugPrint("Hata: $e");
    }
    return null;
  }

  void loginWithPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+905071823575',
      verificationCompleted: (PhoneAuthCredential credential) async{// direk onay kodunu kullanmadan telefona mesaj gelmesiyle tetiklenir.
        debugPrint("verfication completed tetiklendi");
        debugPrint(credential.toString());
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.toString());
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode="123456";
        debugPrint("code sent tetiklendi");
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("code auto retrieval timeout");
      },
    );
  }


}
