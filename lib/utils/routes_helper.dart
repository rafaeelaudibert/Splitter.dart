import 'package:flutter/material.dart';

Future<void> pushAndReplace(BuildContext context, PageRoute route) async {
  final current = ModalRoute.of(context);
  Navigator.push(context, route);
  await Future.delayed(Duration(milliseconds: 300));
  Navigator.removeRoute(context, current);
}
