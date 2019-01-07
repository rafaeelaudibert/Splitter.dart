import 'package:flutter/material.dart';
import 'package:splitter/style/theme.dart' as Theme;

class SplashScreen extends StatefulWidget {
  double _originalSize;

  SplashScreen({double originalSize = 100.0}) {
    this._originalSize = originalSize;
  }

  _SplashScreenState createState() => _SplashScreenState(_originalSize);
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  double originalSize;

  _SplashScreenState(this.originalSize);

  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(seconds: 1),
                  () => Navigator.pushReplacementNamed(context, '/login'));
            }
          });
    animation = Tween(begin: this.originalSize, end: 400.0).animate(controller)
      ..addListener(() => setState(() {}));
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.Colors.backgroundBlue,
          ),
        ),
        Opacity(
          opacity: controller.value ?? 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: Theme.Colors.primaryGradient,
            ),
            child: Center(
              child: Hero(
                tag: 'logo',
                child: new Image(
                  width: 400.0,
                  height: 100 + animation.value,
                  fit: BoxFit.scaleDown,
                  image: new AssetImage('assets/img/login_logo.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
