import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_weather_app/data/models/current_weather_model.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_state.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherHasData){
              return Column(
                key: Key('weather_Daya'),
                children: [
                  Text(state.result.lon as String),
                  Text(state.result.lat as String),
                  Text(state.result.main),
                  Text(state.result.temperature as String),
                  Text(state.result.maxTemperature as String),
                  Text(state.result.minTemperature as String),
                  Text(state.result.pressure as String),
                  Text(state.result.humidity as String),
                  Text(state.result.cloud),
                  Text(state.result.winSpeed as String),
                  Text(state.result.visibility as String),
                ],
              );
            } else if (state is WeatherError) {
              return Center(child: Text('Something went wrong!'),);
            } else {
              return Center(child: Text('Initial State'),);
            }
          },
        ),
      );
    
  }
}
