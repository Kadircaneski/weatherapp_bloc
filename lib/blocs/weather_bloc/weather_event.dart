part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent(List<String> list);
  @override
  List<Object> get props => [];
}

class FecthWeatherEvent extends WeatherEvent {
  final String cityName;
  FecthWeatherEvent({required this.cityName}) : super([cityName]);
  
}


