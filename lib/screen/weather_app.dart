import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/Location_widgets.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/city_selected.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/condition_widget.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/instant_weather.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/last_update.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/weather_image.dart';
import 'package:weatherapp_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weatherapp_bloc/common/constant/weather_string_constant.dart';
import 'package:weatherapp_bloc/common/style/app_text_style.dart';
import 'package:weatherapp_bloc/models/weather_data.dart';

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    String userSelectedCity = '';

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(WeatherStringConstant.appTitle,
                style: AppTextStyle.appTitleStyle),
            actions: [
              Form(
                child: IconButton(
                  onPressed: () async {
                    final finalResult = await showSearch(
                      context: context,
                      delegate: CitySelected(),
                    );
                    userSelectedCity = finalResult.toString();
                    if (userSelectedCity != null) {
                      weatherBloc
                          .add(FecthWeatherEvent(cityName: userSelectedCity));
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              )
            ],
          ),
          body: BlocBuilder(
            bloc: weatherBloc,
            builder: (context, WeatherState state) {
              if (state is WeatherInitialState) {
                return const Center(
                  child: Text(WeatherStringConstant.searchCity),
                );
              }
              if (state is WeatherLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WeatherLoadedState) {
                final WeatherModels fetchWeatherData = state.weather;
                final num? tempC = fetchWeatherData.current?.tempC;
                final String? conditionText =
                    fetchWeatherData.current?.condition?.text;
                final String conditionIcon =
                    'https:${fetchWeatherData.current?.condition?.icon}';
                final String? lastUpdate =
                    fetchWeatherData.current?.lastUpdated;
                final String lastUpdateTime =
                    lastUpdate.toString().split(' ')[1];
                final String lastUpdateDate =
                    lastUpdate.toString().split(' ')[0];

                return userSelectedCity == ''
                    ? const Center(
                        child: Text(WeatherStringConstant.noCitySelected,
                            style: AppTextStyle.appTitleStyle),
                      )
                    : ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              LocationWidget(location: userSelectedCity),
                              LastUpdateWidget(
                                instantDateTime: lastUpdateTime,
                                instantDateDate: lastUpdateDate,
                              ),
                              InstantWeather(
                                instantTemp: '${tempC?.toInt()}°C',
                              ),
                              WeatherImageWidget(
                                conditionImage: conditionIcon,
                              ),
                              ConditionWidget(condition: '$conditionText'),
                            ],
                          );
                        },
                      );
              }
              if (state is WeatherErrorState) {
                return const Center(
                  child: Text(WeatherStringConstant.pleaseTryAgain),
                );
              }
              return const Center(
                child: Text(WeatherStringConstant.pleaseRestartApp),
              );
            },
          ),
        );
      },
    );
  }
}
