import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/views/search_view.dart';

import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessState) {
            
            return const WeatherInfoBody();
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text(
                "oops there was an error , try again !",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            );
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
