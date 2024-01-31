import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/functions.dart';
import 'package:weather_app/UI/screens/weather_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cities = await loadCities();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //блокирую альбомный режим
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
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'lib/assets/night_sky.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Center(
                      child: Text('При загрузке данных произошла ошибка.\n'
                          'Проверьте сетевое подключение и перезайдите в приложение.',),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const WeatherApp();
          }
        },
      ),
    );
  }

}