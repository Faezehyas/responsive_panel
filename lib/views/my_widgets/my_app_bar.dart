import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/enums.dart';
import 'package:wallet_core_management/utils/responsive.dart';
import 'package:wallet_core_management/views/my_widgets/my_real_time_clock.dart';
import '../../utils/const.dart';
import 'dart:math' as math;

AppBar myAppBar(BuildContext context, ThemeProvider themeProvider,
    LocaleProvider localeProvider) {
  return AppBar(
    backgroundColor: themeProvider.boxColor1,
    leadingWidth: 40,
    titleTextStyle: const TextStyle(fontSize: 14),
    leading: Responsive.isDesktop(context)
        ? null
        : Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Transform.rotate(
                    angle: localeProvider.currentLocaleMode == MyLocaleMode.en
                        ? 0
                        : math.pi,
                    child: SvgPicture.asset(
                      '${iconAsset}ic_menu.svg',
                      color: themeProvider.primaryColor,
                    ),
                  ),
                ),
              );
            },
          ),
    title: Row(
      children: [
        Image.asset(
          '${iconAsset}logo.png',
          width: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        const RealTimeClock()
      ],
    ),
    actions: _actions(themeProvider, context, localeProvider),
  );
}

List<Widget> _actions(ThemeProvider themeProvider, BuildContext context,
    LocaleProvider localeProvider) {
  return [
    InkWell(
      splashColor: Colors.white.withOpacity(0),
      highlightColor: Colors.white.withOpacity(0),
      hoverColor: Colors.white.withOpacity(0),
      onTap: () => themeProvider.changeTheme(
          context,
          themeProvider.currentThemeMode == MyThemeMode.dark
              ? MyThemeMode.light
              : MyThemeMode.dark),
      child: Icon(
        themeProvider.currentThemeMode == MyThemeMode.dark
            ? Icons.light_mode_rounded
            : Icons.dark_mode_rounded,
        color: themeProvider.yellowColor,
        size: 20,
      ),
    ),
    const SizedBox(
      width: 24,
    ),
    InkWell(
      splashColor: Colors.white.withOpacity(0),
      highlightColor: Colors.white.withOpacity(0),
      hoverColor: Colors.white.withOpacity(0),
      mouseCursor: SystemMouseCursors.click,
      onTap: () {
        localeProvider.changeLocale(
            context,
            localeProvider.currentLocaleMode == MyLocaleMode.en
                ? MyLocaleMode.fa
                : MyLocaleMode.en);
      },
      child: Center(
        child: Text(
          localeProvider.LaOrFa,
          style: TextStyle(
            color: themeProvider.blueColor,
            fontFamily: localeProvider.regularFontFamily,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
    const SizedBox(
      width: 18,
    ),
  ];
}
