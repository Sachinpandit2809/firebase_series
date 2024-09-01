import 'package:flutter/widgets.dart';

extension NumExt on num {
  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get widthtBox => SizedBox(width: toDouble());
}
