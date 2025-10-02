
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weathermodel;

  getWeather({required String value}) async{
    try{
      weathermodel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
      emit(WeatherLoadedState(weathermodel!));
    }catch(e){
      emit(WeatherFailureState(e.toString()));
    }
  }
}