import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastSuccessMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 14,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.green);
  }

  void toastErrorMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 14,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: Colors.red);
  }
}
