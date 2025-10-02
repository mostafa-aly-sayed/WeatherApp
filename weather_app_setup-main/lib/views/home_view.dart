import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);



  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state)
          {
            if (state is NoWeatherState)
            {
              return  const NoWeatherBody();
            }
            else if(state is WeatherLoadedState)
            {
              return WeatherInfoBody(
                  weather: state.weatherModel
              );
            }
            else{
              return const Text('Oops, there Was an error, try later');
            }
          }
      ),
    );
  }
}


// important case : if the variab


// cubit pattern

// create states
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit
