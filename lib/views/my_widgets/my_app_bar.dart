import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

import '../../utils/const.dart';

AppBar myAppBar(ThemeProvider themeProvider,LocaleProvider localeProvider) {
    return AppBar(
      backgroundColor: themeProvider.backgroundColor,
      leadingWidth: 40,
      leading: Builder(
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
    );
  }