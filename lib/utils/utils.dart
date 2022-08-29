// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notely/utils/enums.dart';

class Utils {
  static const appFontFamily = "EuclidCircularB";
  static const appBorderRadius = 12.0;

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static final snackbarColors = {
    SnackbarTypes.INFO: Color(0xFF323232),
    SnackbarTypes.ERROR: Colors.red,
    SnackbarTypes.SUCCESS: Colors.green,
  };

  static SnackBar _toastSnackbar(String text,
      [SnackbarTypes type = SnackbarTypes.INFO, int duration = 3]) {
    return SnackBar(
      backgroundColor: snackbarColors[type],
      duration: Duration(seconds: duration),
      content: Text(
        text,
        style: TextStyle(
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 18),
      ),
    );
  }

  static void toastWithContext(
      {required ScaffoldMessengerState messengerState,
      required String text,
      SnackbarTypes type = SnackbarTypes.INFO,
      int duration = 3}) {
    messengerState.showSnackBar(_toastSnackbar(text, type, duration));
  }

  static void toast(
      {required BuildContext context,
      required String text,
      SnackbarTypes type = SnackbarTypes.INFO,
      int duration = 3}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(_toastSnackbar(text, type, duration));
  }
}
