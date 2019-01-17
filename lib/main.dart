import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:splitter/bloc/auth_bloc.dart';
import 'package:splitter/pages/splash_page.dart';

void main() => runApp(Splitter());

class Splitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: AuthBloc(context),
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child,
          );
        },
        theme: ThemeData(fontFamily: 'WorkSansSemiBold'),
        home: SplashScreen(),
      ),
    );
  }
}

// Removes glow on scroll on lists
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
