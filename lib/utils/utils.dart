import 'package:flutter/material.dart';

double screenSize(context, {required TypeSize typeSize, required double size}) {
  final screenSize = MediaQuery.of(context).size;
  final double sHeight = (screenSize.width >
          screenSize.height -
              MediaQuery.of(context).viewPadding.top -
              MediaQuery.of(context).viewPadding.bottom)
      ? ((screenSize.height -
                  MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).viewPadding.bottom) *
              size) *
          2.4
      : ((screenSize.height -
              MediaQuery.of(context).viewPadding.top -
              MediaQuery.of(context).viewPadding.bottom) *
          size);
  final double sWidth = (screenSize.width -
          MediaQuery.of(context).viewPadding.left -
          MediaQuery.of(context).viewPadding.right) *
      size;
  if (typeSize == TypeSize.height) {
    return sHeight;
  } else if (typeSize == TypeSize.width) {
    return sWidth;
  } else {
    return 0.0;
  }
}

enum TypeSize { height, width }