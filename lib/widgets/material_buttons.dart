import 'package:flutter/material.dart';

class CustomMaterialButtons extends StatelessWidget {
  String title;
  VoidCallback onPress;

  CustomMaterialButtons(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(title),
        ),
      ),
    );
  }
}
