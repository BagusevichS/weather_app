import 'package:flutter/material.dart';
import 'package:weather_app/UI/widgets/weather_screen/city_container.dart';
import 'package:weather_app/features/functions.dart';
import 'package:weather_app/UI/widgets/search_screen/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.onCitiesUpdated}) : super(key: key);

  final Function(List<String>) onCitiesUpdated;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/background/night_sky.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(onAddTap: () => addCity(controller, context)),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cities.length,
                  itemBuilder: (context, index) => CityContainer(
                    city: cities.elementAt(index),
                    onDelete: () {
                      setState(() {
                        cities.removeAt(index);
                        weatherList.removeAt(index);
                        saveCities(cities);
                        widget.onCitiesUpdated(cities); // уведомляю WeatherApp, что нужно обновиться
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addCity(controller, context) async {
    String cityName = controller.text.trim().toUpperCase();
    if (cityName.isNotEmpty) {
      bool isValidCity = await checkCityExistence(cityName);
      if(cities.contains(cityName)){
        showCityIsExist(context);
      }else{
        if (isValidCity) {
          controller.clear();
          showCityFoundDialog(context);
          setState(() {
            cities.add(cityName); // стейт нужен, чтобы текущий скрин обновился
          });
          await getWeather(cities);
          widget.onCitiesUpdated(cities); // уведомляю WeatherApp, что нужно обновиться
          saveCities(cities);
        } else {
          showCityNotFoundDialog(context);
        }
      }
    }
  }
}
