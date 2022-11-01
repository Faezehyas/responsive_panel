import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/main_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/my_navigator.dart';
import 'package:wallet_core_management/utils/responsive.dart';

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
            ? () {
              MyNavigator.pushNamedAndRemoveUntil(context, routeTo);
              if(!Responsive.isDesktop(context)) Scaffold.of(context).closeDrawer();
            }
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
