import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12:5,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      duration: const Duration(milliseconds: 120),
    );
  }
}
