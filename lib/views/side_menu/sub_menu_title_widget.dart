import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/main_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/my_navigator.dart';

class SubMenuTitleWidget extends StatelessWidget {
  final String subtitle;
  final String routeTo;
  const SubMenuTitleWidget({
    Key? key,
    required this.subtitle,
    required this.routeTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<MainProvider, ThemeProvider, LocaleProvider>(
        builder: (context, mainProvider, themeProvider, localeProvider, _) {
      return InkWell(
        onTap: routeTo.isNotEmpty
            ? () => MyNavigator.pushNamedAndRemoveUntil(context, routeTo)
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: 200,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: themeProvider.boxColor3,
              ),
            ),
          ),
          child: Text(
            subtitle,
            style: TextStyle(
                color: mainProvider.currentRoute == routeTo
                    ? themeProvider.secondryColor
                    : themeProvider.fontColor3,
                fontFamily: localeProvider.regularFontFamily),
          ),
        ),
      );
    });
  }
}
