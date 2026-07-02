import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'firestore_islemleri.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: FirestoreIslemleri(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;
  final String email = "defnetanyeli20@gmail.com";
  final String password = "yenisifre";
  final googleSignin = GoogleSignIn.instance;

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
                deleteUser();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Email/Şifre Sil"),
            ),
            ElevatedButton(
              onPressed: () {
                changeEmail();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text("Email Güncelle "),
            ),
            ElevatedButton(
              onPressed: () {
                changePassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: Text("Şifre Güncelle"),
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text("google ile giriş"),
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

  void deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
      debugPrint("Kullanıcı silindi");
    }
  }

  void changeEmail() async {
    try {
      await auth.currentUser!.verifyBeforeUpdateEmail(
        "defnetanyeli20@gmail.com",
      );
      await auth.signOut();
      debugPrint("email güncellendi");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint("reauthenticate olacak");
        var credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await auth.currentUser!.reauthenticateWithCredential(credential);

        await auth.currentUser!.verifyBeforeUpdateEmail(
          "defnetanyeli20@gmail.com",
        );
        await auth.signOut();
        debugPrint("email güncellendi");
      }
    } catch (e) {
      print("Hata: $e");
    }
  }

  void changePassword() async {
    try {
      await auth.currentUser!.updatePassword("yenisifre");
      await auth.signOut();
      debugPrint("şifre güncellendi");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint("reauthenticate olacak");
        var credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await auth.currentUser!.reauthenticateWithCredential(credential);

        await auth.currentUser!.updatePassword("yenisifre");
        await auth.signOut();
        debugPrint("şifre güncellendi");
      }
    } catch (e) {
      print("Hata: $e");
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    await googleSignin.initialize();
    final GoogleSignInAccount? googleUser = await googleSignin.authenticate();

    if (googleUser == null) {
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void loginWithPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+90 507 182 35 76',
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
