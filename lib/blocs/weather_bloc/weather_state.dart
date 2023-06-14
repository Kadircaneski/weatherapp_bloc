part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState(WeatherModels? model);

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState() : super(null); 
}

class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState() : super(null);
}

class WeatherLoadedState extends WeatherState {
  final WeatherModels weather;

  const WeatherLoadedState({required this.weather}) : super(weather);
}

class WeatherErrorState extends WeatherState {

  const WeatherErrorState() :super(null);
}
