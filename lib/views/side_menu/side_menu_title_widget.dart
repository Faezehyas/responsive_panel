import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';

class SideMenuTitleWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  const SideMenuTitleWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider,LocaleProvider>(
      builder: (context,themeProvider,localeProvider,_) {
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
    );
  }
}
