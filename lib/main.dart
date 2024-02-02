import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'cubits/weather_cubit/weather_cubit.dart';
import 'views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key, this.weatherInfo}) : super(key: key);
  final WeatherModel? weatherInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: getThemeColor(
                    BlocProvider.of<WeatherCubit>(context)
                        .weather
                        ?.weatherState,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherState) {
  if (weatherState == 'Sunny' ||
      weatherState == 'Clear' ||
      weatherState == 'Partly cloudy') {
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
