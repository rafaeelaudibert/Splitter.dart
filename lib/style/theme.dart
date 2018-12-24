import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color loginGradientEnd = const Color(0xFFf7418c);
  static const Color socialMedia = const Color(0xFF0084ff);

  static const primaryGradient = const LinearGradient(
    colors: [
      loginGradientStart,
      loginGradientEnd
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp
  );

  static const invertedPrimaryGradient = const LinearGradient(
    colors: [
      loginGradientStart,
      loginGradientEnd
    ],
    begin: const FractionalOffset(1.0, 1.0),
    end: const FractionalOffset(0.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp
  );

  static const boxShadow = <BoxShadow>[
    BoxShadow(
      color: loginGradientStart,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
    BoxShadow(
      color: loginGradientEnd,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
  ];
}