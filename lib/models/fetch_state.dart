import 'package:weatherapp_bloc/models/weather_data.dart';

class FetchState {
  num? tempC;
  String? conditionText;
  String? conditionIcon;
  String? lastUpdate;
  String? lastUpdateTime;
  String? lastUpdateDate;

  FetchState(WeatherModels weatherModel) {
    tempC = weatherModel.current?.tempC;
    conditionText = weatherModel.current?.condition?.text;
    conditionIcon = 'https:${weatherModel.current?.condition?.icon}';
    lastUpdate = weatherModel.current?.lastUpdated;
    lastUpdateTime = lastUpdate.toString().split(' ')[1];
    lastUpdateDate = lastUpdate.toString().split(' ')[0];
  }
}
