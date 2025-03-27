import 'package:first_app/model/weather_model.dart';
import 'package:first_app/services/weather/weather_services.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('7cdcce671f3b9ff9bff74d027dc5dbf9');
  Weather? _weather;

  //fewtch weather
  _fetchWeather() async{
    //current city
    String cityName = await _weatherService.getCurrentCity();

    //weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // error
    catch(e) {
      print(e);
    }
  }

  //weather animation


  //
  @override
  void initState() {
    super.initState();

    //weather fetch on startup
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(_weather?.cityName ?? "Loading city.."),

            //temparature
            Text('${_weather?.temparature.round()} Degree Celcius'),
          ],
        ),
      ),
    );
  }
}
