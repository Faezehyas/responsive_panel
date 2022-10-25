import 'package:flutter/material.dart';
import 'package:wallet_core_managment/main.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/my_navigator.dart';
import 'package:wallet_core_managment/views/customers/insert_real_customers_screen.dart';

class SubMenuTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final ThemeProvider themeProvider;
  final LocaleProvider localeProvider;
  final Widget? routeTo;
  const SubMenuTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.themeProvider,
    required this.localeProvider,
    required this.routeTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyNavigator.pushNamed(context, InsertRealCustomersScreen.route);
      },
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
              color: themeProvider.fontColor3,
              fontFamily: localeProvider.regularFontFamily),
        ),
      ),
    );
  }
}
