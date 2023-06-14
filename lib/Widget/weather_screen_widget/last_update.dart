import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/common/constant/weather_string_constant.dart';
import 'package:weatherapp_bloc/common/style/app_text_style.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget(
      {super.key,
      required this.instantDateTime,
      required this.instantDateDate});
  final String instantDateTime;
  final String instantDateDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text(
            '${WeatherStringConstant.lastUpdate}$instantDateTime',
            style: AppTextStyle.latUpdateTextStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            '${WeatherStringConstant.lastUpdate}$instantDateDate',
            style: AppTextStyle.latUpdateTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
