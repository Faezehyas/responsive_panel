import 'package:flutter/material.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class SideMenuTitleWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final ThemeProvider themeProvider;
  final LocaleProvider localeProvider;
  const SideMenuTitleWidget({
    Key? key,
    required this.icon,
    required this.themeProvider,
    required this.title,
    required this.localeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: themeProvider.fontColor3,
              fontFamily: localeProvider.regularFontFamily,
              fontWeight: FontWeight.w700,
              letterSpacing:  1
            ),
          )
        ],
      ),
    );
  }
}
