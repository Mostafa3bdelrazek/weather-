import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onFieldSubmitted: (value) async {
              BlocProvider.of<WeatherCubit>(context).cityName = value;
              BlocProvider.of<WeatherCubit>(context).getWeather();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              hintText: 'Enter a city',
              hintStyle: const TextStyle(color: Colors.blue),
              label: const Text('Search'),
              labelStyle: const TextStyle(color: Colors.blue),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
