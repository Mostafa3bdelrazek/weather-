
class WeatherState {}

class NoWeatherState extends WeatherState {}

class SuccessState extends WeatherState {}
class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState(this.errorMessage);
}
