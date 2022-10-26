import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class MyButton extends StatelessWidget {
  GestureTapCallback? onPressed;
  String? title;
  Color? backgroundColor;
  BorderSide? borderSide;
  Color? fontColor;
  double? width;

  MyButton(
      {required this.onPressed,
      required this.title,
      this.backgroundColor,
      this.fontColor,
      this.borderSide,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, _) {
      return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  themeProvider.backgroundColor.withOpacity(0.3)),
              side: borderSide != null
                  ? MaterialStateProperty.all(borderSide)
                  : null,
              elevation: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.disabled) ? 0 : 6),
              backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? themeProvider.boxColor2
                      : backgroundColor ?? themeProvider.primaryColor),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 14))),
          child: SizedBox(
            height: 36,
            width: width ?? 100,
            child: Center(
                child: Text(
              title!,
              style: TextStyle(
                  color: onPressed != null
                      ? (fontColor ?? Colors.white)
                      : Colors.grey,
                  fontFamily: localeProvider.boldFontFamily),
            )),
          ));
    });
  }
}
