import 'package:flutter/material.dart';
import 'package:splitter/pages/login_page.dart';
import 'package:splitter/utils/custom_hero.dart';
import 'package:splitter/style/theme.dart' as Theme;
import 'package:splitter/utils/routes_helper.dart';

class SplashScreen extends StatefulWidget {
  final double originalSize;

  SplashScreen({Key key, this.originalSize});

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(
                Duration(seconds: 1),
                () => pushAndReplace(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    ),
              );
            }
          });
    animation = Tween(begin: widget.originalSize ?? 100.0, end: 400.0)
        .animate(controller)
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
          ),
        ),
        Center(
          child: CustomHero(
            photo: 'assets/img/login_logo.png',
            height: animation.value,
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
