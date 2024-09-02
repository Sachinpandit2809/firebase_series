import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/material_buttons.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  bool personal = true, office = false, college = false;
  bool suggest = true;
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
          20.heightBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hii",
              style: KTextStyle.K_24,
            ),
            const Text(
              "Sachin",
              style: KTextStyle.K_24,
            ),
            const Text(
              "Let's begin the Work!",
              style: KTextStyle.K_18,
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                personal
                    ? CustomMaterialButtons(title: "Personal", onPress: () {})
                    : GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Text("Personal"),
                        ),
                        onTap: () {
                          personal = true;
                          office = false;
                          college = false;
                          setState(() {});
                        },
                      ),
                college
                    ? CustomMaterialButtons(title: "College", onPress: () {})
                    : GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Text("College"),
                        ),
                        onTap: () {
                          personal = false;
                          office = false;
                          college = true;
                          setState(() {});
                        },
                      ),
                office
                    ? CustomMaterialButtons(title: "Office", onPress: () {})
                    : GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Text("Office"),
                        ),
                        onTap: () {
                          personal = false;
                          office = true;
                          college = false;
                          setState(() {});
                        },
                      ),
              ],
            ),
            30.heightBox,
            CheckboxListTile(
              activeColor: Colors.amber,
              value: suggest,
              title: Text("Make Youtube videos"),
              onChanged: (onChanged) {
                setState(() {
                  suggest = onChanged!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade400,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
