import 'package:flutter/material.dart';
import 'package:splitter/style/theme.dart' as Theme;

class DefaultAppBar extends StatelessWidget {
  final height = 95.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        clipPath1(clipPath2(clipPath3(Container()))),
        Positioned(
          top: 15.0,
          left: 15.0,
          child: GestureDetector(
            onTap: () {
              print('Open drawer plox');
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          right: 15.0,
          child: Text(
            'Friends',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: "WorkSansSemiBold"),
          ),
        )
      ],
    );
  }

  ClipPath clipPath1(Widget child) {
    return ClipPath(
      clipper: WaveClipper1(),
      child: Container(
        height: height,
        width: double.infinity,
        color: Theme.Colors.backgroundBlue.withAlpha(255 ~/ 3),
        child: child,
      ),
    );
  }

  ClipPath clipPath2(Widget child) {
    return ClipPath(
      clipper: WaveClipper2(),
      child: Container(
        height: height,
        width: double.infinity,
        color: Theme.Colors.backgroundBlue.withAlpha(255 ~/ 3),
        child: child,
      ),
    );
  }

  ClipPath clipPath3(Widget child) {
    return ClipPath(
      clipper: WaveClipper3(),
      child: Container(
        height: height,
        width: double.infinity,
        color: Theme.Colors.backgroundBlue.withAlpha(255),
        child: child,
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 4 / 5 * size.height);

    path.quadraticBezierTo(1 / 7 * size.width, size.height, 3 / 12 * size.width,
        4 / 5 * size.height);

    path.quadraticBezierTo(2 / 6 * size.width, 6 / 10 * size.height,
        5 / 11 * size.width, 7 / 9 * size.height);

    path.quadraticBezierTo(
        5 / 9 * size.width, size.height, 5 / 8 * size.width, size.height);

    path.quadraticBezierTo(9 / 11 * size.width, size.height,
        17 / 20 * size.width, 11 / 12 * size.height);

    path.quadraticBezierTo(
        19 / 20 * size.width, 8 / 10 * size.height, size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 9 / 10 * size.height);

    path.quadraticBezierTo(size.width / 6, 2 / 3 * size.height, size.width / 4,
        4 / 5 * size.height);

    path.quadraticBezierTo(
        size.width / 3, size.height, size.width / 2, 4 / 5 * size.height);

    path.quadraticBezierTo(2 / 3 * size.width, 3 / 5 * size.height,
        3 / 4 * size.width, 8 / 9 * size.height);

    path.quadraticBezierTo(
        5 / 6 * size.width, size.height, size.width, 7 / 8 * size.height);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 2 / 3 * size.height);

    path.quadraticBezierTo(size.width / 6, 8 / 9 * size.height, size.width / 4,
        4 / 5 * size.height);

    path.quadraticBezierTo(6 / 12 * size.width, 5 / 10 * size.height,
        5 / 8 * size.width, 7 / 9 * size.height);

    path.quadraticBezierTo(
        10 / 11 * size.width, size.height, size.width, 2 / 3 * size.height);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
