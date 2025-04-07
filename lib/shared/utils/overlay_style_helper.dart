import 'package:flutter/services.dart';

SystemUiOverlayStyle getOverlayStyle(bool isDark) {
  return isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
}
