import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weather;
  String? cityName;

  getWeather() async {
    emit(WeatherLoadedState());
    try {
      weather = (await WeatherService(Dio()).getWeather(cityName: cityName!))!;
      emit(SuccessState());
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }

  MaterialColor getThemeColor(String? weatherState) {
    if (weatherState == null) {
      return Colors.blue;
    }
    if (weatherState == 'Sunny' ||
        weatherState == 'Clear' ||
        weatherState == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherState == 'Blizzard' ||
        weatherState == 'Patchy snow possible' ||
        weatherState == 'Patchy sleet possible' ||
        weatherState == 'Patchy freezing drizzle possible' ||
        weatherState == 'Blowing snow') {
      return Colors.grey;
    } else if (weatherState == 'Freezing fog' ||
        weatherState == 'Fog' ||
        weatherState == 'Heavy Cloud' ||
        weatherState == 'Mist' ||
        weatherState == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	' ||
        weatherState == 'Overcast') {
      return Colors.brown;
    } else if (weatherState == 'Thundery outbreaks possible' ||
        weatherState == 'Moderate or heavy snow with thunder' ||
        weatherState == 'Patchy light snow with thunder' ||
        weatherState == 'Moderate or heavy rain with thunder' ||
        weatherState == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.blue;
    }
  }
}
