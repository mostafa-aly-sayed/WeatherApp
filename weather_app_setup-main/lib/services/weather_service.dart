

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseURL ='https://api.weatherapi.com/v1/';
  final String apiKey = '3e4bd406ed1547c39c4161615252309';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async{

    try{
      Response response = await dio.get('$baseURL forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch(e){
      final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, Try later';
      throw Exception(errorMessage);
    } catch(e){
      throw Exception("Unexpected error: $e");
    }
  }
}