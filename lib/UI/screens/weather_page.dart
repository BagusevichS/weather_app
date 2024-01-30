import 'package:flutter/material.dart';
import 'package:weather_app/UI/widgets/weather_screen/city_info.dart';
import 'package:weather_app/UI/widgets/weather_screen/degrees_container.dart';
import 'package:weather_app/features/functions.dart';
import 'package:weather_app/UI/widgets/weather_screen/statistics_container.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CityInfo(index: widget.index,),
                    DegreesContainer(index: widget.index,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width/5,
                ),
                child: Column(
                  children: [
                    Divider(height:MediaQuery.of(context).size.height/15,color: Colors.white30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatisticsContainer(name: 'Ветер', mean: weatherList[widget.index].current.wind_kph, measure: 'км/ч'),
                        StatisticsContainer(name: 'Влажность', mean: weatherList[widget.index].current.humidity, measure: '%'),
                        StatisticsContainer(name: 'Дождь', mean: weatherList[widget.index].forecast.forecastday[0].day.daily_chance_of_rain, measure: '%'),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
