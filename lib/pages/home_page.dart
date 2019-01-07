import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:splitter/bloc/auth_bloc.dart';
import 'package:splitter/pages/splash_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: new Image(
                  width: 250.0,
                  height: 191.0,
                  fit: BoxFit.scaleDown,
                  image: new AssetImage('assets/img/login_logo.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  await BlocProvider.of<AuthBloc>(context).logOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(originalSize: 191.0)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
