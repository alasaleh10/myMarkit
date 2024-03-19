import 'dart:io';

bool isIphone() {
  if (Platform.isIOS) {
    return true;
  } else {
    return false;
  }
}
