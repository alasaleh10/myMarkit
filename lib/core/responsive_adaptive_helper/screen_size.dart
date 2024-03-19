import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.sizeOf(context).width;
  } else {
    return MediaQuery.sizeOf(context).height;
  }
}

double screenWidth(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.sizeOf(context).height;
  } else {
    return MediaQuery.sizeOf(context).width;
  }
}
