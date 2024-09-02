import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_series/firebase_services/auth_service.dart';
import 'package:firebase_series/utils/utils.dart';

class DatabaseServices {
  Future addPersonalTask(
      Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Personal")
        .doc(id)
        .set(userPersonalMap)
        .then((onValue) {
      Utils().toastSuccessMessage("task added succesfully!");
    });
  }

  Future addCollegeTask(Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("College")
        .doc(id)
        .set(userPersonalMap)
        .then((onValue) {
      Utils().toastSuccessMessage("task added succesfully!");
    });
  }

  Future addOfficeTask(Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Office")
        .doc(id)
        .set(userPersonalMap)
        .then((onValue) {
      Utils().toastSuccessMessage("task added succesfully!");
    });
  }

  Future<Stream<QuerySnapshot>> getTask(String task) async {
    return await FirebaseFirestore.instance
        .collection(task)
        .where('isDeleted', isEqualTo: false)
        .snapshots();
  }

  tickMethod(String id, String task) async {
    return FirebaseFirestore.instance
        .collection(task)
        .doc(id)
        .update({'yes': true}).then((onValue) {
      Utils().toastSuccessMessage("task complted !");
    });
  }

  deleteMethod(String id, String task) async {
    return FirebaseFirestore.instance
        .collection(task)
        .doc(id)
        .update({'isDeleted': true}).then((onValue) {
      Utils().toastSuccessMessage("task deleted !");
    });
  }
}
