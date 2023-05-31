import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetStyles extends StatelessWidget {
  String text;
  TextAlign align;
  Color color;
  double size;
  FontWeight fontWeight;

  GetStyles({Key? key,
    required this.text,
    this.align=TextAlign.left,
    this.color=Colors.black, this.size=14,
    this.fontWeight=FontWeight.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: align, style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      fontFamily: 'CormorantGaramond-Medium.ttf'
    ),
    );
  }
}
