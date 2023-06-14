import 'package:get_it/get_it.dart';
import 'package:weatherapp_bloc/blocs/data/weather_api_client.dart';
import 'package:weatherapp_bloc/blocs/data/weather_repository.dart';


GetIt locator = GetIt.instance;


void setupLocator(){
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
