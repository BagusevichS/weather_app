import 'package:flutter/material.dart';
import 'package:weather_app/features/functions.dart';


class CityInfo extends StatelessWidget {
  const CityInfo({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weatherList[index].location.name,style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 5,),
          Text("${weatherList[index].location.localtime}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}
