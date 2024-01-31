import 'package:flutter/material.dart';
import 'package:weather_app/features/constants.dart';
import 'package:weather_app/features/functions.dart';


class DegreesContainer extends StatelessWidget {
  const DegreesContainer({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${weatherList[index].current.temp_c}\u00B0",style: const TextStyle(
              fontSize: 70,
              color: Colors.white,
              fontWeight: FontWeight.w300
          ),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(Constants.setIcon(index) as IconData?,color: Colors.white,size: 34),
              ),
              Text(Constants.setCondition(index),style: const TextStyle(
                color: Colors.white,
                fontSize: 24
              ),)
            ],
          )
        ],
      ),
    );
  }
}
