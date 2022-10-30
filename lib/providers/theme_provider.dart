import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/utils/user_infos.dart';
import 'package:flutter/material.dart';

import '../theme/my_dark_theme.dart';
import '../theme/my_light_theme.dart';
import '../utils/enums.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData myTheme = MyLightTheme.data;
  MyThemeMode currentThemeMode = MyThemeMode.light;

  void initTheme(BuildContext context) {
    currentThemeMode = UserInfos.getTheme(context);
    changeTheme(context, currentThemeMode);
  }

  void changeTheme(BuildContext context, MyThemeMode themeMode) {
    if (themeMode.isDark) {
      myTheme = MyDarkTheme.data;
    } else {
      myTheme = MyLightTheme.data;
    }
    currentThemeMode = themeMode;
    UserInfos.setTheme(context, currentThemeMode);
    notifyListeners();
  }

  //colors
  Color get primaryColor => MyDarkTheme.instance.colors.primaryColor;
  Color get secondryColor => MyDarkTheme.instance.colors.secondryColor;
  Color get blueColor => MyDarkTheme.instance.colors.blueColor;
  Color get greenColor => MyDarkTheme.instance.colors.greenColor;
  Color get yellowColor => MyDarkTheme.instance.colors.yellowColor;
  Color get orangeColor => MyDarkTheme.instance.colors.orangeColor;

  Color get backgroundColor => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.backgroundColor
      : MyLightTheme.instance.colors.backgroundColor;

  Color get boxColor1 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.boxColor1
      : MyLightTheme.instance.colors.boxColor1;

  Color get boxColor2 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.boxColor2
      : MyLightTheme.instance.colors.boxColor2;

  Color get boxColor3 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.boxColor3
      : MyLightTheme.instance.colors.boxColor3;

  Color get fontColor1 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.fontColor1
      : MyLightTheme.instance.colors.fontColor1;

  Color get fontColor2 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.fontColor2
      : MyLightTheme.instance.colors.fontColor2;

  Color get fontColor3 => currentThemeMode.isDark
      ? MyDarkTheme.instance.colors.fontColor3
      : MyLightTheme.instance.colors.fontColor3;
}
