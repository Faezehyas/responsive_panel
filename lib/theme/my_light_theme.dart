import 'package:corebancking_backoffice/utils/const.dart';
import 'package:flutter/material.dart';

class _Colors {
  final primaryColor = const Color(0xff4f46e5);
  final secondryColor = const Color(0xfff000b9);
  final backgroundColor = Colors.grey.shade100;
  final boxColor1 = Colors.white;
  final boxColor2 = Colors.grey.shade300;
  final boxColor3 = Colors.grey.shade400;
  final fontColor1 = const Color(0xff5d677c);
  final fontColor2 = const Color(0xff7c8699);
  final fontColor3 = const Color(0xff334155);
  final blueColor = const Color(0xff0ea5e9);
  final greenColor = const Color(0xff10b981);
  final yellowColor = const Color(0xffff9800);
  final orangeColor = const Color(0xffff5724);
}

class MyLightTheme {
  static final instance = MyLightTheme();
  static final data = ThemeData(
    backgroundColor: MyLightTheme.instance.colors.backgroundColor,
    primaryColor: MyLightTheme.instance.colors.primaryColor,
    scaffoldBackgroundColor: MyLightTheme.instance.colors.backgroundColor,
    fontFamily: PR,
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
      buttonColor: MyLightTheme.instance.colors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: MyLightTheme.instance.colors.primaryColor,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.fromLTRB(6, 12, 6, 12),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyLightTheme.instance.colors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16,
            fontFamily: PB,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: MyLightTheme.instance.colors.fontColor1,
      ),
      bodyText1: TextStyle(
        color: MyLightTheme.instance.colors.fontColor1,
      ),
      bodyText2: TextStyle(
        color: MyLightTheme.instance.colors.fontColor1,
      ),
    ),
  );

  final colors = _Colors();
}
