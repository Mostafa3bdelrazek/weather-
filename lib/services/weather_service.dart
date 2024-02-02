import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '8b58caf2d4084bf6baa131015231408';
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      weather = WeatherModel.fromjson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later !';
      log(errorMessage);
      SnackBar(content: Text(errorMessage));
    } catch (e) {
      log(e.toString());
      SnackBar(content: Text(e.toString()));
    }
    return weather;
  }
}
