import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  final String name;
  final double mean;
  final String measure;
  const StatisticsContainer({Key? key, required this.name, required this.mean, required this.measure}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(name,style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),),Text(
          "$mean",style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),Text(measure,style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),),

      ],
    );
  }
}
