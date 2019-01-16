import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splitter/pages/default_app_bar.dart';
import 'package:splitter/style/theme.dart' as Theme;
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final List<String> nameList = ['Rafael', 'Liliane', 'Ana', 'Teo'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: 9,
              padding: EdgeInsets.symmetric(vertical: 90.0),
              itemBuilder: (context, index) {
                String name = nameList[index % nameList.length];
                double userValue = pow(-3.23, index);

                return Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 25.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      print(name);
                    },
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            height: 125.0,
                            width: double.infinity,
                            child: FriendCard(name, userValue),
                          ),
                        ),
                        Container(
                          height: 85.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/profile.png'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            DefaultAppBar(),
            DefaultBottomBar()
          ],
        ),
      ),
    );
  }
}

class DefaultBottomBar extends StatelessWidget {
  final height = 70.0;

  const DefaultBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration:
                new BoxDecoration(gradient: Theme.Colors.primaryGradient),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.group, size: 38.0),
              Transform.translate(
                offset: Offset(0.0, -25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: Theme.Colors.boxShadowWithWhiteHalo,
                  ),
                  child: Icon(Icons.add, size: 55.0),
                ),
              ),
              Icon(Icons.gesture, size: 38.0),
            ],
          ),
        ],
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency(name: 'BRL');
  final double value;
  final String name;

  FriendCard(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(80.0, 10.0, 0.0, 0.0),
            child: Text(
              this.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w100,
                fontFamily: "WorkSansMedium",
              ),
            ),
          ),
          Positioned(
            right: 15.0,
            bottom: 40.0,
            child: valueText(this.value),
          )
        ],
      ),
    );
  }

  Text valueText(double value) {
    return Text(
      formatCurrency.format(value),
      style: TextStyle(
        color: value >= 0 ? Colors.greenAccent : Colors.redAccent,
        fontSize: 32.0,
        fontFamily: "WorkSansSemiBold",
      ),
    );
  }
}
