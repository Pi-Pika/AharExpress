import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:first_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.
      get(Uri.parse('$BASE_URL?q=$cityName&appId=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Weather Data.");
    }
  }
  Future<String> getCurrentCity() async {
    //user permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    //convert location into a list
    List<Placemark> placemarks =
      await placemarkFromCoordinates(
          position.latitude, position.longitude,
      );

    //extract city name
    String? city = placemarks[0].locality;

    return city ?? "";

  }

}