import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/common/style/app_text_style.dart';

class ConditionWidget extends StatelessWidget {
  const ConditionWidget({super.key, required this.condition});
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Text(
      condition,
      style: AppTextStyle.conditionTextStyle
    );
  }
}