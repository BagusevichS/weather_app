import 'package:flutter/material.dart';
import 'package:weather_app/features/constants.dart';
import 'package:weather_app/UI/screens/search_screen.dart';
import 'package:weather_app/UI/widgets/weather_screen/slider_dot.dart';
import 'package:weather_app/UI/screens/weather_page.dart';

import '../../features/functions.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int currentPage = 0;

  onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void updateCities(List<String> updatedCities) {
    setState(() {
      cities = updatedCities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.add_location_alt_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen(onCitiesUpdated: updateCities)),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            Constants.setBackground(currentPage),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: MediaQuery.of(context).size.height / 7,
            ),
            child: Row(
              children: [
                for (int i = 0; i < cities.length; i++)
                  if (i == currentPage)
                    const SliderDot(isActive: true)
                  else
                    const SliderDot(isActive: false)
              ],
            ),
          ),
          PageView.builder(
            onPageChanged: onPageChanged,
            scrollDirection: Axis.horizontal,
            itemCount: cities.length,
            itemBuilder: (context, index) => WeatherPage(
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
