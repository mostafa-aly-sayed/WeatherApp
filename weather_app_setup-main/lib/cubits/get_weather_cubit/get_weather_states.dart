

import 'package:weather_app/models/weather_model.dart';

class WeatherState {}
class NoWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weatherModel);
  final WeatherModel weatherModel;

}

class WeatherFailureState extends WeatherState{
  WeatherFailureState(this.errorMessage);
  final String errorMessage;
}