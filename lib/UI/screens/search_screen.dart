import 'package:flutter/material.dart';
import 'package:weather_app/UI/widgets/weather_screen/city_container.dart';
import 'package:weather_app/features/functions.dart';
import 'package:weather_app/UI/widgets/search_screen/search_widget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
              'lib/assets/night_sky.jpg',
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
                        getWeather(cities);
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
    String cityName = controller.text.trim();
    if (cityName.isNotEmpty) {
      bool isValidCity = await checkCityExistence(cityName);
      if (isValidCity) {
        setState(() {
          cities.add(cityName);
          controller.clear();
          getWeather(cities);
        });
        showCityFoundDialog(context);
      } else {
        showCityNotFoundDialog(context);
      }
    }
  }
}



