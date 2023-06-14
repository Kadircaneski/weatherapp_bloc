// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:weatherapp_bloc/models/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://api.weatherapi.com';
  final http.Client httpClient = http.Client();

  Future<WeatherModels> getWeatherModelsFromApi(String cityName) async {
    print(cityName);
    final cityUrl = Uri.parse('$baseUrl/v1/current.json?key=5e780eda2ff440b08f3211414231204&q=$cityName&aqi=no');
    final gelenCevap = await httpClient.get(cityUrl);
    if (gelenCevap.statusCode != 200) {
      throw Exception('İstek hatası: Geçersiz durum kodu - ${gelenCevap.statusCode}');
    }
    var modelRes;
    try{
        Map<String, dynamic> weatherModel = await (jsonDecode(gelenCevap.body)); 
        print("getWeatherModelsFromApi -> weatherModel -> temp_c : ${weatherModel['current']['temp_c']}");
        modelRes = WeatherModels.fromJson(weatherModel);
    }catch(error){
        print("getWeatherModelsFromApi -> error message : $error");
    }
    return modelRes ;
  }

 
}


