import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/controller/home_screen_controller.dart';
import 'package:firebase_series/db_services/database_services.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/material_buttons.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  TextEditingController todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: const Text(
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
          builder: (context, homeScreenController, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hii",
                style: KTextStyle.K_24,
              ),

              const Text(
                "Let's begin the Work!",
                style: KTextStyle.K_24,
              ),
              10.heightBox,
              const Divider(),
              10.heightBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeScreenController.personal
                      ? CustomMaterialButtons(title: "Personal", onPress: () {})
                      : CustomAlternateMaterialButton(
                          title: "Personal",
                          onPress: () async {
                            homeScreenController.personalTrueSelecter();
                          },
                        ),
                  homeScreenController.college
                      ? CustomMaterialButtons(title: "College", onPress: () {})
                      : CustomAlternateMaterialButton(
                          title: "College",
                          onPress: () async {
                            homeScreenController.collegeTrueSelecter();
                          },
                        ),
                  homeScreenController.office
                      ? CustomMaterialButtons(title: "Office", onPress: () {})
                      : CustomAlternateMaterialButton(
                          title: "Office",
                          onPress: () async {
                            homeScreenController.officeTrueSelecter();
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
      }),
      floatingActionButton: Consumer<HomeScreenController>(
          builder: (context, homeScreenController, _) {
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
                              String id = const Uuid().v4();
                              Map<String, dynamic> userTask = {
                                'task': todoController.text,
                                'id': id,
                                'yes': false,
                                'isDeleted': false,
                              };
                              homeScreenController.personal
                                  ? DatabaseServices()
                                      .addPersonalTask(userTask, id)
                                  : homeScreenController.college
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
      }),
    );
  }
}
