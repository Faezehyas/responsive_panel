import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class BoxContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? margin;
  BoxContainer({
    required this.child,this.margin,
    Key? key, height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,themeProvider,_) {
        return Container(
          margin: margin,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: themeProvider.boxColor3,
              borderRadius: BorderRadius.circular(8)),
              child: child,
        );
      }
    );
  }
}

class FormSubTitle extends StatelessWidget {
  const FormSubTitle({
    Key? key,
    required String title,
  }) : _title = title, super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
        return Text(
          _title,
          style: TextStyle(
              fontFamily: localeProvider.boldFontFamily,
              color: themeProvider.fontColor3),
        );
      }
    );
  }
}

class FormTitle extends StatelessWidget {
  FormTitle(
    this.title,
    this.subTitle, {
    Key? key,
  }) : super(key: key);

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: localeProvider.boldFontFamily,
                  color: themeProvider.primaryColor,
                  height: 1,
                  fontSize: 18),
            ),
            if (subTitle.isNotEmpty) ...[
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
            ]
          ],
        ),
      );
    });
  }
}
