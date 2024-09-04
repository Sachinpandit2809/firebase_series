import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/controller/home_screen+controller.dart';
import 'package:firebase_series/db_services/database_services.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/material_buttons.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  TextEditingController todoController = TextEditingController();
  // bool personal = true, office = false, college = false;
  // bool suggest = true;
  // Stream? todoStream;

  // Future goToTheLoad() async {
  //   todoStream = await DatabaseServices().getTask(personal
  //       ? "Personal"
  //       : office
  //           ? "Office"
  //           : "College");
  //   setState() {}
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Widget getTask() {
  //   return StreamBuilder(
  //     //stream: FirebaseFirestore.instance.collection("Personal").snapshots(),
  //     stream: todoStream,
  //     builder: (context, AsyncSnapshot snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       if (!snapshot.hasData) {
  //         Utils().toastErrorMessage("No data ");
  //       }
  //       return snapshot.hasData
  //           ? Expanded(
  //               child: ListView.builder(
  //                 itemCount: snapshot.data.docs.length,
  //                 itemBuilder: (context, index) {
  //                   DocumentSnapshot documentSnapshot =
  //                       snapshot.data.docs[index];
  //                   return Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.amber.shade100,
  //                         borderRadius: BorderRadius.circular(12)),
  //                     child: CheckboxListTile(
  //                       activeColor: Color.fromARGB(255, 2, 150, 7),
  //                       value: documentSnapshot['yes'],
  //                       title: Row(
  //                         children: [
  //                           Text(documentSnapshot['task']),
  //                           Spacer(),
  //                           InkWell(
  //                               onTap: () async {
  //                                 await DatabaseServices().deleteMethod(
  //                                     documentSnapshot['id'],
  //                                     personal
  //                                         ? 'Personal'
  //                                         : college
  //                                             ? 'College'
  //                                             : 'Office');
  //                               },
  //                               child: const Icon(
  //                                 Icons.delete,
  //                                 color: Colors.red,
  //                               ))
  //                         ],
  //                       ),
  //                       onChanged: (onChanged) async {
  //                         await DatabaseServices().tickMethod(
  //                             documentSnapshot['id'],
  //                             personal
  //                                 ? 'Personal'
  //                                 : college
  //                                     ? 'College'
  //                                     : 'Office');
  //                         setState(() {});
  //                       },
  //                       controlAffinity: ListTileControlAffinity.leading,
  //                     ),
  //                   );
  //                 },
  //               ),
  //             )
  //           : SizedBox();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text(
          "Manage Work",
          style: KTextStyle.K_20,
        ),
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
      body: Consumer<HomeScreenController>(
        builder: (context,homeScreenController,_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hii",
                  style: KTextStyle.K_24,
                ),
                // const Text(
                //   "Sachin",
                //   style: KTextStyle.K_24,
                // ),
                const Text(
                  "Let's begin the Work!",
                  style: KTextStyle.K_24,
                ),
                10.heightBox,
                Divider(),
                10.heightBox,
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeScreenController.personal
                        ? CustomMaterialButtons(title: "Personal", onPress: () {})
                        : GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: Text("Personal"),
                            ),
                            onTap: () async {
                            homeScreenController.  personal = true;
                            homeScreenController.  office = false;
                             homeScreenController. college = false;
                              await homeScreenController.goToTheLoad();
                              setState(() {});
                            },
                          ),
                   homeScreenController. college
                        ? CustomMaterialButtons(title: "College", onPress: () {})
                        : GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: Text("College"),
                            ),
                            onTap: () async {
                             homeScreenController. personal = false;
                             homeScreenController. office = false;
                             homeScreenController. college = true;
          
                              await homeScreenController.goToTheLoad();
                              setState(() {});
                            },
                          ),
                    homeScreenController.office
                        ? CustomMaterialButtons(title: "Office", onPress: () {})
                        : GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: Text("Office"),
                            ),
                            onTap: () async {
                             homeScreenController. personal = false;
                            homeScreenController.  office = true;
                            homeScreenController.  college = false;
                              await homeScreenController. goToTheLoad();
                              setState(() {});
                            },
                          ),
                  ],
                ),
                30.heightBox,
                // caliing Widget State palce
                homeScreenController.getTask()
              ],
            ),
          );
        }
      ),
      floatingActionButton: Consumer<HomeScreenController>(
        builder: (context,homeScreenController,_) {
          return FloatingActionButton(
            backgroundColor: Colors.amber.shade400,
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const CircleAvatar(
                                      backgroundColor: Colors.amberAccent,
                                      child: Icon(Icons.close))),
                              10.widthtBox,
                              const Text(
                                "Add ToDo Task",
                                style: KTextStyle.K_20,
                              ),
                            ],
                          ),
                          10.heightBox,
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Task",
                              style: KTextStyle.K_18,
                            ),
                          ),
                          20.heightBox,
          
                          KTextformfield(
                            controller: todoController,
                          ),
                          20.heightBox,
                          RoundButton(
                              title: "Add Task",
                              onPress: () {
                                debugPrint("triggred");
                                String id = Uuid().v4();
                                Map<String, dynamic> userTask = {
                                  'task': todoController.text,
                                  'id': id,
                                  'yes': false,
                                  'isDeleted': false,
                                };
                               homeScreenController. personal
                                    ? DatabaseServices()
                                        .addPersonalTask(userTask, id)
                                    :homeScreenController. college
                                        ? DatabaseServices()
                                            .addCollegeTask(userTask, id)
                                        : DatabaseServices()
                                            .addOfficeTask(userTask, id);
                                Navigator.pop(context);
                              }),
          
                          // next
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      ),
    );
  }
}
