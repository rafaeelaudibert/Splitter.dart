import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splitter/pages/default_app_bar.dart';
import 'package:splitter/style/theme.dart' as Theme;

class HomePage extends StatelessWidget {
  final List<String> nameList = ['Rafael', 'Liliane', 'Ana', 'Teo'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: Theme.Colors.invertedPrimaryGradientWithAlpha,
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 90.0),
                itemBuilder: (context, index) {
                  String userName = nameList[Random().nextInt(nameList.length)];
                  double userValue = pow(-3.23, index);
                  print(index);

                  return GestureDetector(
                    onTap: () {
                      print(userName);
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 25.0, 0.0),
                      child: Stack(
                        children: <Widget>[
                          userCard(userName, userValue),
                          userImage('assets/profile.png'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            DefaultAppBar(),
            DefaultBottomBar()
          ],
        ),
      ),
    );
  }

  Padding userCard(String userName, double userValue) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 125.0,
        width: double.infinity,
        child: FriendCard(name: userName, value: userValue),
      ),
    );
  }

  Container userImage(String imagePath) {
    return Container(
      height: 85.0,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Image.asset(imagePath),
    );
  }
}

class DefaultBottomBar extends StatefulWidget {
  _DefaultBottomBarState createState() => _DefaultBottomBarState();
}

class _DefaultBottomBarState extends State<DefaultBottomBar> {
  final height = 70.0;
  String _selected = 'Friends';

  bool get _friendSelected => _selected == 'Friends';
  bool get _groupSelected => _selected == 'Group';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 3.0)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTabBar(_friendSelected, 'Friends', Icons.person),
            buildPlusButton(),
            buildTabBar(_groupSelected, 'Group', Icons.group),
          ],
        ),
      ),
    );
  }

  GestureDetector buildTabBar(bool selected, String name, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          _selected = name;
          setState(() {
            print('Clicked on $name');
          });
        }
      },
      child: BottomBarIcon(selected: selected, name: name, icon: icon),
    );
  }

  Transform buildPlusButton() {
    return Transform.translate(
      offset: Offset(0.0, -35.0),
      child: GestureDetector(
        onTap: () {
          print('Clicked on the PLUS button');
        },
        child: Container(
          height: 65.0,
          width: 65.0,
          decoration: BoxDecoration(
            gradient: Theme.Colors.blueGradient,
            shape: BoxShape.circle,
            boxShadow: Theme.Colors.blackBoxShadow,
          ),
          child: Icon(Icons.add, size: 45.0, color: Colors.white),
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  BottomBarIcon(
      {Key key,
      @required bool selected,
      @required String name,
      @required IconData icon})
      : _selected = selected,
        _icon = icon,
        _name = name,
        super(key: key);

  final bool _selected;
  final String _name;
  final IconData _icon;

  final Color _pink = Theme.Colors.backgroundPink.withAlpha(150);
  final Color _grey = Color(0x66666666);
  final Color _transparent = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Icon(_icon, size: 38.0, color: _selected ? _pink : _grey),
        ),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          child: Text(_name),
          style: TextStyle(
            color: !_selected ? _grey : _transparent,
            fontFamily: 'WorkSansMedium',
          ),
        ),
        Container(
          height: 3.0,
          width: MediaQuery.of(context).size.width / 4,
          color: _selected ? _pink : _transparent,
        ),
      ],
    );
  }
}

class FriendCard extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency(name: 'BRL');
  final double value;
  final String name;

  FriendCard({this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(80.0, 10.0, 0.0, 0.0),
            child: Text(
              this.name,
              style: TextStyle(fontSize: 24.0, fontFamily: "WorkSansMedium"),
            ),
          ),
          Positioned(right: 15.0, bottom: 40.0, child: valueText(this.value))
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
      ),
    );
  }
}
