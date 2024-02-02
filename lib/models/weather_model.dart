class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String? image;
  String weatherState;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.image,
  });

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: data['current']['temp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherState: data['current']['condition']['text'],
      image: data['current']['condition']['icon'],
    );
  }
}
