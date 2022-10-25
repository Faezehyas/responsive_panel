import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class FormTitle extends StatelessWidget {
  FormTitle(this.title, this.subTitle, {
    Key? key,
  }) : super(key: key);

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: localeProvider.boldFontFamily,
                color: themeProvider.primaryColor,
                height: 1,
                fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: themeProvider.fontColor3,
              size: 16,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontFamily: localeProvider.regularFontFamily,
                color: themeProvider.fontColor3),
          ),
        ],
      );
    });
  }
}
