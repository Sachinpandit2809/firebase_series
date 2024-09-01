import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      title: Text("homepage"),
      actions: [
        IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((onValue) {
                Utils().toastErrorMessage("user logout");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              });
            },
            icon: Icon(Icons.logout)),
        SizedBox(
          width: 20,
        )
      ],
    ));
  }
}
