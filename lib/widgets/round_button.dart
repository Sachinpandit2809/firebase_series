import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButton extends StatefulWidget {
  String title;
  VoidCallback onPress;
   RoundButton({super.key ,required this.title,required this.onPress});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget. onPress,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black26),
        child: Center(
            child: Text(
         widget.title,
          style: KTextStyle.K_16,
        )),
      ),
    );
  }
}
