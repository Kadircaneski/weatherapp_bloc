import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/common/style/app_text_style.dart';

class InstantWeather extends StatelessWidget {
  const InstantWeather({super.key, required this.instantTemp});
  final String instantTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        instantTemp,
        
        style: AppTextStyle.instantTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
