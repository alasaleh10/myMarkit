import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  if (MediaQuery.sizeOf(context).width > 0 &&
      MediaQuery.sizeOf(context).width <= 500) {
    return true;
  } else {
    return false;
  }
}

bool isTablet(BuildContext context) {
  if (MediaQuery.sizeOf(context).width >= 501 &&
      MediaQuery.sizeOf(context).width <= 950) {
    return true;
  } else {
    return false;
  }
}

bool isDeskTop(BuildContext context) {
  if (MediaQuery.sizeOf(context).width >= 951) {
    return true;
  } else {
    return false;
  }
}
