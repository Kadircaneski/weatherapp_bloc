// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherapp_bloc/blocs/data/weather_repository.dart';
import 'package:weatherapp_bloc/blocs/data/locator.dart';
import 'package:weatherapp_bloc/models/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository wRepository = locator<WeatherRepository>();

  WeatherBloc() : super(const WeatherInitialState()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FecthWeatherEvent) {

        emit(const WeatherLoadingState());
        try {
          final WeatherModels getirilenweather = await wRepository.getWeather(event.cityName);
          emit(WeatherLoadedState(weather: getirilenweather));
        } catch (_) {
          emit(const WeatherErrorState());
        }
      }
    });
  }
}
