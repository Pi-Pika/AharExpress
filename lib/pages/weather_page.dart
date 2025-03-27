import 'package:first_app/model/weather_model.dart';
import 'package:first_app/services/weather/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'lib/images/animation/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'lib/images/animation/cloudy.json';
      case 'rain':
      case 'shower rain':
      case 'drizzle':
        return 'lib/images/animation/rain.json';
      case 'clear':
        return 'lib/images/animation/sunny.json';
      default:
        return 'lib/images/animation/sunny.json';
    }
  }


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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //city name
              Text(_weather?.cityName ?? "Loading city.."),
          
              //animation
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
          
              //temparature
              Text('${_weather?.temparature.round()} Degree Celcius'),
          
              //weather condition
              Text(_weather?.mainCondition ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
