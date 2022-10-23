import 'package:flutter/widgets.dart';
import '../providers/main_provider.dart';
import 'enums.dart';

class UserInfos {
  static Future<void> clear(BuildContext context) async {
    MyThemeMode myThemeMode = getTheme(context);
    setTheme(context, myThemeMode);
    MainProvider.sharedPreferences.clear();
  }

  static setTheme(BuildContext context, MyThemeMode themeMode) =>
      UserInfos.setBool(context, 'isDark', themeMode == MyThemeMode.dark);

  static MyThemeMode getTheme(BuildContext context) =>
      (UserInfos.getbool(context, 'isDark') ?? true)
          ? MyThemeMode.dark
          : MyThemeMode.light;

  static setLocale(BuildContext context, MyLocaleMode localeMode) =>
      UserInfos.setBool(context, 'isEn', localeMode == MyLocaleMode.en);

  static MyLocaleMode getLocale(BuildContext context) =>
      (UserInfos.getbool(context, 'isEn') ?? true)
          ? MyLocaleMode.en
          : MyLocaleMode.fa;

  static setToken(BuildContext context, String token) async =>
      await MainProvider.sharedPreferences.setString('token', token);

  static String? getToken(BuildContext context) =>
      MainProvider.sharedPreferences.getString('token');

  static setEmail(BuildContext context, String email) async =>
      await MainProvider.sharedPreferences.setString('email', email);

  static String? getEmail(BuildContext context) =>
      MainProvider.sharedPreferences.getString('email');

  static setWalletAddress(BuildContext context, String walletAddress) async =>
      await MainProvider.sharedPreferences
          .setString('walletAddress', walletAddress);

  static String? getWalletAddress(BuildContext context) =>
      MainProvider.sharedPreferences.getString('walletAddress');

  static setAvatar(BuildContext context, String avatar) async =>
      await MainProvider.sharedPreferences.setString('Avatar', avatar);

  static String? getAvatar(BuildContext context) {
    return MainProvider.sharedPreferences.getString('Avatar');
  }

  static setcanWithdraw(BuildContext context, bool canWithdraw) async =>
      await MainProvider.sharedPreferences.setBool('canWithdraw', canWithdraw);

  static bool? getcanWithdraw(BuildContext context) =>
      MainProvider.sharedPreferences.getBool('canWithdraw');

  //for unknown value
  static setString(BuildContext context, String name, String value) async =>
      await MainProvider.sharedPreferences.setString(name, value);

  static setListString(
    BuildContext context,
    String name,
    List<String> value,
  ) async =>
      await MainProvider.sharedPreferences.setStringList(name, value);

  static setInt(BuildContext context, String name, int value) async =>
      await MainProvider.sharedPreferences.setInt(name, value);

  static setBool(BuildContext context, String name, bool value) async =>
      await MainProvider.sharedPreferences.setBool(name, value);

  static String? getString(BuildContext context, String name) =>
      MainProvider.sharedPreferences.getString(name);

  static List<String>? getListString(BuildContext context, String name) =>
      MainProvider.sharedPreferences.getStringList(name);

  static int? getInt(BuildContext context, String name) =>
      MainProvider.sharedPreferences.getInt(name);

  static bool? getbool(BuildContext context, String name) =>
      MainProvider.sharedPreferences.getBool(name);

  //for unknown value

  static remove(String name) => MainProvider.sharedPreferences.remove(name);
}
