import 'package:wallet_core_management/utils/const.dart';
import 'package:flutter/material.dart';

class _Colors {
  final primaryColor = const Color(0xff4f46e5);
  final secondryColor = const Color(0xfff000b9);
  final backgroundColor = const Color(0xff192132);
  final boxColor1 = const Color(0xff212c43);
  final boxColor2 = const Color(0xff26334d);
  final boxColor3 = const Color(0xff1b2335);
  final fontColor1 = const Color(0xff334155);
  final fontColor2 = const Color(0xff475569);
  final fontColor3 = const Color(0xffe7e9ef);
  final blueColor = const Color(0xff0ea5e9);
  final greenColor = const Color(0xff10b981);
  final yellowColor = const Color(0xffff9800);
  final orangeColor = const Color(0xffff5724);
}

class MyDarkTheme {
  static final instance = MyDarkTheme();
  static final data = ThemeData(
    backgroundColor: MyDarkTheme.instance.colors.backgroundColor,
    primaryColor: MyDarkTheme.instance.colors.primaryColor,
    scaffoldBackgroundColor: MyDarkTheme.instance.colors.backgroundColor,
    fontFamily: PR,
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(
      buttonColor: MyDarkTheme.instance.colors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: MyDarkTheme.instance.colors.primaryColor,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(6, 12, 6, 12),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyDarkTheme.instance.colors.primaryColor,
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
      subtitle1: TextStyle(color: MyDarkTheme.instance.colors.fontColor1),
      bodyText1: TextStyle(color: MyDarkTheme.instance.colors.fontColor1),
      bodyText2: TextStyle(color: MyDarkTheme.instance.colors.fontColor1),
    ),
  );
  final colors = _Colors();
}
