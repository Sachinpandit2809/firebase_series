import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/controller/login_screen_controller.dart';
import 'package:firebase_series/firebase_services/auth_service.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/auth/phone_number_screen.dart';
import 'package:firebase_series/screens/auth/signup_screen.dart';
import 'package:firebase_series/screens/homepage_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/notebook.jpg"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Consumer<LoginScreenController>(
              builder: (context, loginScreenController, _) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  80.heightBox,
                  Center(
                    child: Text(
                      "Login !",
                      style: KTextStyle.K_24,
                    ),
                  ),
                  Center(
                    child: Text(
                      "welcome !",
                      style: KTextStyle.K_24,
                    ),
                  ),
                  30.heightBox,

                  KTextformfield(
                      controller: emailController, hintText: "email"),
                  30.heightBox,
                  KTextformfield(
                      controller: passwordController, hintText: "password"),
                  30.heightBox,
                  RoundButton(
                      loading: loginScreenController.loging,
                      title: "Login",
                      onPress: () async {
                        loginScreenController.setLoging(true);
                        User? user = await _firebaseServices.logInMethod(
                            emailController.text, passwordController.text);

                        if (user != null) {
                          Utils().toastSuccessMessage("welcome ${user.email}");
                          loginScreenController.setLoging(false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomepageScreen()));
                        }
                      }),
                  15.heightBox,
                  RoundButton(
                      title: "Google",
                      onPress: () async {
                        debugPrint("triggred");
                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        try {
                          final GoogleSignInAccount? googleSignInAccount =
                              await googleSignIn.signIn();
                          if (googleSignInAccount != null) {
                            GoogleSignInAuthentication googleSignInAuth =
                                await googleSignInAccount.authentication;
                            final AuthCredential credential =
                                GoogleAuthProvider.credential(
                                    accessToken: googleSignInAuth.accessToken,
                                    idToken: googleSignInAuth.idToken);
                            await FirebaseAuth.instance
                                .signInWithCredential(credential)
                                .then((onValue) {
                              Utils().toastSuccessMessage("welcome }");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomepageScreen()));
                            });
                          }
                        } catch (e) {}
                      }),
                  15.heightBox,
                  RoundButton(
                      title: "Log in with Phone",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneNumberScreen()));
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        child: Text(
                          "Signup",
                          style: KTextStyle.K_14.copyWith(color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                      ),
                    ],
                  ),
                  //next
                  30.heightBox,
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }
}
