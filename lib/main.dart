import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/functions.dart';
import 'package:weather_app/UI/screens/weather_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cities = await loadCities();

  // Запрос на использование геопозиции
  await requestLocationPermission();

  if (cities.isEmpty) {
    // получение города из геолокации
    String currentCity = await getCurrentCityFromGeolocation();
    cities.add(currentCity.toUpperCase());

    // сохранение города
    await saveCities(cities);
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FutureBuilder<void>(
        future: getWeather(cities),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            Future.delayed(Duration.zero, () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('При загрузке данных произошла ошибка.'),
                    content: const Text('Проверьте сетевое подключение и перезайдите в приложение.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            });
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'lib/assets/background/night_sky.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          } else {
            return WeatherApp();
          }
        },
      ),
    );
  }
}


