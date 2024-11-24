import 'package:flutter/material.dart';

class PositionedCircle extends StatelessWidget {
  final double top;
  final double left;
  final double diameter;
  final Color color;

  const PositionedCircle({
    Key? key,
    required this.top,
    required this.left,
    required this.diameter,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)));
  }
}
