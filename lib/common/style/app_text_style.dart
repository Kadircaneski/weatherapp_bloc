import 'package:flutter/material.dart';

@immutable
class AppTextStyle {
  const AppTextStyle._();
  static const TextStyle appTitleStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const TextStyle conditionTextStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w700);

  static const TextStyle instantTextStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.w700);

  static const TextStyle latUpdateTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

  static const TextStyle locationTextStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}
