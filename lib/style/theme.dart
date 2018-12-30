/*
  MIT License

  Copyright (c) 2018 Hugo EXTRAT

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color backgroundPink = const Color(0xFFfc00ff);
  static const Color backgroundBlue = const Color(0xFF00dbde);

  static const primaryGradient = const LinearGradient(
    colors: [
      backgroundPink,
      backgroundBlue
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp
  );

  static const invertedPrimaryGradient = const LinearGradient(
    colors: [
      backgroundPink,
      backgroundBlue
    ],
    begin: const FractionalOffset(1.0, 1.0),
    end: const FractionalOffset(0.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp
  );

  static const boxShadow = <BoxShadow>[
    BoxShadow(
      color: backgroundPink,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
    BoxShadow(
      color: backgroundBlue,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
  ];
}