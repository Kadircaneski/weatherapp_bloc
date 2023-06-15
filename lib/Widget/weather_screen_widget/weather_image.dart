import 'package:flutter/material.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({super.key, required this.conditionImage});
   final String? conditionImage;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 16),
      
      child: Image.network(
        conditionImage!,
        width: 250,
        height: 250,
        fit: BoxFit.fill,
      )
    );
  }
}