import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weatherapp_bloc/common/constant/weather_string_constant.dart';
import 'package:weatherapp_bloc/screen/weather_app.dart';
import 'package:weatherapp_bloc/blocs/data/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: WeatherStringConstant.appTitle,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:  const WeatherAppView(),
      ),
    );
  }
}
