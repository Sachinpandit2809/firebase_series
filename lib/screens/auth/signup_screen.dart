import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/firebase_services/auth_service.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/screens/homepage_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/notebook.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Text(
                  "Sign in !",
                  style: KTextStyle.K_24,
                ),
              ),
              const Center(
                child: Text(
                  "welcome !",
                  style: KTextStyle.K_24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              KTextformfield(
                  controller: usernameController, hintText: "username"),
              const SizedBox(
                height: 30,
              ),
              KTextformfield(controller: emailController, hintText: "emial"),
              const SizedBox(
                height: 30,
              ),
              KTextformfield(
                  controller: passwordController, hintText: "password"),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Signin",
                  onPress: () async {
                    User? user = await _firebaseServices.signUpMethod(
                        emailController.text, passwordController.text);
                    if (user != null) {
                      debugPrint("User Succesfully Created");
                      Utils().toastSuccessMessage("User Succesfully Created");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomepageScreen()));
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("allready have an account?"),
                  TextButton(
                    child: Text(
                      "Login",
                      style: KTextStyle.K_14.copyWith(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                  ),
                ],
              ),
              //next
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
