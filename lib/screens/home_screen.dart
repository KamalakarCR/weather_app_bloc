import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/location_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';

import '../utilities/string_ext.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocConsumer<LocationBloc, LocationState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LocationError) {
                  return const Center(
                      child: Text("Not able to fecth lat long"));
                } else if (state is LocationSuccess) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "Latitude: ${state.position.latitude}",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Longitude: ${state.position.longitude}",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            ZipCodeForm(),
          ],
        ),
      ),
    );
  }
}

class ZipCodeForm extends StatelessWidget {
  ZipCodeForm({Key? key}) : super(key: key);

  final _zipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _zipController,
              decoration: const InputDecoration(
                labelText: 'Zip Code',
                hintText: 'Enter zip code',
                counterText: "",
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
              validator: (val) {
                if (val != null && !val.isZipValid) {
                  return "Please enter valid zip code";
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState?.save();
              BlocProvider.of<WeatherBloc>(context)
                  .add(WeatherRequest(zipCode: _zipController.text));
              Navigator.pushNamed(context, '/location-details');
              //Get.toNamed(AppRoutes.weatherDetails);
            }
          },
          child: const Text(
            "Submit",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
