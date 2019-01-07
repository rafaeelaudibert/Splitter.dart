import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:splitter/bloc/auth_bloc.dart';
import 'package:splitter/pages/home_page.dart';
import 'package:splitter/pages/login_page.dart';
import 'package:splitter/pages/splash_page.dart';

void main() => runApp(new Splitter());

class Splitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: AuthBloc(context),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
