import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class MyTableItemWidget extends StatelessWidget {
  double? width;
  String? title;
  Widget? actions;
  Color? fontColor;
  String? fontFamily;
  MyTableItemWidget(
      {required this.width,
      this.title,
      this.actions,
      this.fontColor,
      this.fontFamily,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: actions ??
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: fontColor ?? context.read<ThemeProvider>().fontColor3,
                fontFamily: context.read<LocaleProvider>().regularFontFamily),
          ),
    );
  }
}
