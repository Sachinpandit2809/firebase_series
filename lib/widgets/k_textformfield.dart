import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KTextformfield extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  TextInputType keyboard;
  KTextformfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.keyboard = TextInputType.text});

  @override
  State<KTextformfield> createState() => _KTextformfieldState();
}

class _KTextformfieldState extends State<KTextformfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboard,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
          labelText: widget.hintText,
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.black12,
          // contentPadding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
