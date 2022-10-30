import 'package:flutter/material.dart';

Widget tableItemWidget(
        {required double? width,
          String? title,
        Widget? actions,
        Color? fontColor,
        String? fontFamily}) =>
    SizedBox(
      width: width,
      child: actions ?? Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: fontColor,
            fontFamily: fontFamily),
      ),
    );
