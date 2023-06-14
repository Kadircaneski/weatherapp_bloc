// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/common/style/app_text_style.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        location,
        style: AppTextStyle.locationTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
