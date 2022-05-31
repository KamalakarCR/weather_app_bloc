import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/location_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/screens/home_screen.dart';
import 'package:weather_app_bloc/screens/location_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc()),
        BlocProvider(
            create: (context) => LocationBloc()..add(LocationRequest())),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          '/location-details': (context) => LocationDetails(),
        },
      ),
    );
  }
}
