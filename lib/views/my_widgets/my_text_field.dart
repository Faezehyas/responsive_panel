import 'package:corebancking_backoffice/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import '../../providers/theme_provider.dart';

SizedBox myTextFormField(
      LocaleProvider localeProvider, ThemeProvider themeProvider,
      {String? hint}) {
    return SizedBox(
        width: 300,
        child: TextFormField(
          textDirection: localeProvider.getTextDirection,
          decoration: InputDecoration(
              hintText: hint,
              hintTextDirection: localeProvider.getTextDirection,
              hintStyle:
                  TextStyle(fontFamily: localeProvider.regularFontFamily)),
          style: TextStyle(
              fontFamily: localeProvider.regularFontFamily,
              color: themeProvider.fontColor3),
        ));
  }