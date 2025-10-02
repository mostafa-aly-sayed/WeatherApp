import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(), // the shared cubit between search view and home view
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state){
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context).weathermodel?.weatherCondition,
                    ),
                  ),
                  home: const HomeView(),
                );
          },
          ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {

  if (condition == null){
    return Colors.red;
  }
  condition = condition.toLowerCase(); // make case-insensitive

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.orange;
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return Colors.blueGrey;
  } else if (condition.contains('mist') ||
      condition.contains('fog') ||
      condition.contains('freezing fog')) {
    return Colors.grey;
  } else if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('shower')) {
    return Colors.blue;
  } else if (condition.contains('snow') || condition.contains('blizzard')) {
    return Colors.lightBlue;
  } else if (condition.contains('sleet') ||
      condition.contains('ice pellets')) {
    return Colors.cyan;
  } else if (condition.contains('thunder')) {
    return Colors.deepPurple;
  } else {
    // default fallback
    return Colors.teal;
  }
}