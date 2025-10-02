

import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';
// import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Search a City'),
        // backgroundColor: Colors.orange,

      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
//          onChanged: (value){},// accepts the value everytime it changes not once "onChanged"
            onSubmitted: (value) async{
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getWeather(value: value);
              Navigator.pop(context);

            },

            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16
              ), // padding inside text field , use for manipulating height of text field
              labelText:'Search',
              suffixIcon:  Icon(Icons.search),
              hintText: 'Enter City Name',
                border: OutlineInputBorder(borderSide:  BorderSide(color: Colors.orange),
                ) ,
              // border is around all directions
            ),
          ) ,
        ),
      )
    );
  }
}


// border : general
// focussed border
// enabled border
// all in InputDecoration
