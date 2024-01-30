import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  const SquareButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap:onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent
        ),
        child: const Center(
          child: Icon(Icons.add_circle,color: Colors.white,)
        ),
      ),
    );
  }
}
