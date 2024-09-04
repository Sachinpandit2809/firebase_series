import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_series/db_services/database_services.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenController with ChangeNotifier {
  bool personal = true, office = false, college = false;
  Stream? todoStream;

  Future goToTheLoad() async {
    todoStream = await DatabaseServices().getTask(personal
        ? "Personal"
        : office
            ? "Office"
            : "College");
    ChangeNotifier();
  }

// THIS IS FOR CHECKbOX AND tEXT tASK PRINTING

  Widget getTask() {
    return StreamBuilder(
      //stream: FirebaseFirestore.instance.collection("Personal").snapshots(),
      stream: todoStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          Utils().toastErrorMessage("No data ");
        }
        return snapshot.hasData
            ? Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data.docs[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: CheckboxListTile(
                        activeColor: Color.fromARGB(255, 2, 150, 7),
                        value: documentSnapshot['yes'],
                        title: Row(
                          children: [
                            Text(documentSnapshot['task']),
                            Spacer(),
                            InkWell(
                                onTap: () async {
                                  await DatabaseServices().deleteMethod(
                                      documentSnapshot['id'],
                                      personal
                                          ? 'Personal'
                                          : college
                                              ? 'College'
                                              : 'Office');
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                        onChanged: (onChanged) async {
                          await DatabaseServices().tickMethod(
                              documentSnapshot['id'],
                              personal
                                  ? 'Personal'
                                  : college
                                      ? 'College'
                                      : 'Office');
                          ChangeNotifier();
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  },
                ),
              )
            : SizedBox();
      },
    );
  }
}
