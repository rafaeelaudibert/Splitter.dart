import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  const CustomHero({Key key, this.photo, this.height}) : super(key: key);

  final String photo;
  final double height;

  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: Image.asset(
            photo,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
