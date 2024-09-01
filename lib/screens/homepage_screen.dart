import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: const Text("homepage"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((onValue) {
                  Utils().toastErrorMessage("user logout");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                });
              },
              icon: const Icon(Icons.logout)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hii",
              style: KTextStyle.K_24,
            ),
            Text(
              "Sachin",
              style: KTextStyle.K_24,
            ),
            Text(
              "Let's begin the Work!",
              style: KTextStyle.K_18,
            )
          ],
        ),
      ),
    );
  }
}
