import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:splitter/bloc/auth_bloc.dart';
import 'package:splitter/pages/home_page.dart';
import 'package:splitter/pages/splash_page.dart';
import 'package:splitter/utils/custom_hero.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CustomHero(
                photo: 'assets/img/login_logo.png',
                height: 200.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  await BlocProvider.of<AuthBloc>(context).logOut();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            SplashScreen(originalSize: 200.0)),
                  );
                },
              ),
              RaisedButton(
                child: Text('Second Page'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
