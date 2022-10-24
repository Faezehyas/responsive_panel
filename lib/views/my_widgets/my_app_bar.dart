import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:wallet_core_managment/views/my_widgets/my_real_time_clock.dart';
import '../../utils/const.dart';

var _currentDate = '${DateTime.now().toPersianDateStr(showDayStr: true)} ';
var _currentTime = DateFormat.jms().format(DateTime.now());

AppBar myAppBar(BuildContext context, ThemeProvider themeProvider,
    LocaleProvider localeProvider) {
  return AppBar(
    backgroundColor: themeProvider.backgroundColor,
    leadingWidth: 40,
    leading: Responsive.isDesktop(context)
        ? null
        : Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SvgPicture.asset(
                    '${iconAsset}ic_menu.svg',
                    color: themeProvider.primaryColor,
                  ),
                ),
              );
            },
          ),
    actions: [
      // const Center(
      //   child: RealTimeClock(),
      // ),
      // const SizedBox(
      //   width: 16,
      // ),
      // Center(child: Text(_currentDate)),
      // const SizedBox(
      //   width: 16,
      // ),
      InkWell(
        onTap: () => themeProvider.changeTheme(
            context,
            themeProvider.currentThemeMode == MyThemeMode.dark
                ? MyThemeMode.light
                : MyThemeMode.dark),
        child: Center(
          child: Icon(
            themeProvider.currentThemeMode == MyThemeMode.dark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
            color: themeProvider.yellowColor,
          ),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
      InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: () {
          localeProvider.changeLocale(
              context,
              localeProvider.currentLocaleMode == MyLocaleMode.en
                  ? MyLocaleMode.fa
                  : MyLocaleMode.en);
          // _formKey.currentState!.validate();
        },
        child: Center(
          child: Text(
            localeProvider.LaOrFa,
            style: TextStyle(
                color: themeProvider.blueColor,
                fontFamily: localeProvider.regularFontFamily,
                decoration: TextDecoration.underline,
                fontSize: 16),
          ),
        ),
      ),
      const SizedBox(
        width: 8,
      ),
    ],
  );
}
