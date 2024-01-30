import 'dart:convert';
import 'dart:io';

import '../entity/weather.dart';

class ApiClient{
  final client = HttpClient();

  Future<List<Weather>> getWeather(city) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=401e0a8e36a849ff9c8192952232111&q=$city&days=1&aqi=no&alerts=no');
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final weather = Weather.fromJson(json);
    return [weather];
  }
}