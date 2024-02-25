import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/api_clients/api_client.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:http/http.dart' as http;
var cities = <String>[];
List<Weather> weatherList = [];

Future<void> getWeather(List<String> cities) async {
  weatherList.clear();
  for (String city in cities) {
    try{
      final apiWeather = await ApiClient().getWeather(city);
      weatherList.addAll(apiWeather);
    }
    catch (e){
      if (kDebugMode) {
        print('Ошибка при получении погоды для города $city: $e');
      }
      return Future.error(e);
    }
  }
}

Future<bool> checkCityExistence(String cityName) async {
  final apiUrl = 'http://api.weatherapi.com/v1/forecast.json?key=401e0a8e36a849ff9c8192952232111&q=$cityName&days=1&aqi=no&alerts=no';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Город существует
    return true;
  } else {
    // Город не существует или какая-то другая ошибка
    return false;
  }
}


void showCityNotFoundDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Нет данных ;('),
        content: const Text('К сожалению, я не могу найти информацию по этому городу.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showCityFoundDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Успех!'),
        content: const Text('Город успешно добавлен на главный экран.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
void showCityIsExist(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Внимание!'),
        content: const Text('Город уже был добавлен.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<void> saveCities(List<String> cities) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('cities', cities);
}

Future<List<String>> loadCities() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('cities') ?? [];
}

Future<String> getCurrentCityFromGeolocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String cityName = placemarks.isNotEmpty ? placemarks[0].locality ?? 'Москва' : 'Москва';

    return cityName;
  } catch (e) {
    print('Error getting geolocation: $e');
    return 'Москва';
  }
}

Future<void> requestLocationPermission() async {
  await Permission.location.request();
}