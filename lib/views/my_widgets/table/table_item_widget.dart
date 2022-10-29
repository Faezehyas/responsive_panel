import 'package:flutter/material.dart';

Widget tableItemWidget(
        {String? title,
        Widget? actions,
        Color? fontColor,
        String? fontFamily}) =>
    SizedBox(
      width: 60,
      child: actions ?? Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: fontColor,
            fontFamily: fontFamily),
      ),
    );
