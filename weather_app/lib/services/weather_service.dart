import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = '150f6755668f8e0bfef83c87481641f2';
  static const String baseURL = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> getWeather(String cityName) async {
    try {
      final String url = '$baseURL?q=$cityName&appid=$apiKey&units=metric';

      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data);
      }
      else if (response.statusCode == 404) {
        throw Exception('City not found, pls check the spelling');
      }
      else {
        throw Exception('Failed to load Weather, status: ${response.statusCode}');
      }
    }
    catch (e) {
      throw Exception('Error fetching Weather: $e');
    }
  }
}