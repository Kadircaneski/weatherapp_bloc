import 'package:weatherapp_bloc/blocs/data/weather_api_client.dart';
import 'package:weatherapp_bloc/blocs/data/locator.dart';
import 'package:weatherapp_bloc/models/weather_data.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<WeatherModels> getWeather(String city) async {
    final res = await weatherApiClient.getWeatherModelsFromApi(city);
    return res;
  }
}
