import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class MyCheckBoxTitle extends StatefulWidget {
  String label;
  double? width;
  MyCheckBoxTitle({super.key,required this.label, this.width});

  @override
  State<MyCheckBoxTitle> createState() => _MyCheckBoxTitleState();
}

class _MyCheckBoxTitleState extends State<MyCheckBoxTitle> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return SizedBox(
        width: widget.width ?? 200,
        child: CheckboxListTile(
          value: true,
          activeColor: _themeProvider.primaryColor,
          onChanged: (state) {},
          checkboxShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          dense: true,
          title: Text(
            widget.label,
            style: TextStyle(fontFamily: _localeProvider.regularFontFamily,
            color: _themeProvider.fontColor3),
          ),
        ),
      );
    });
  }
}
