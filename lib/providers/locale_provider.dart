import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/user_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utils/const.dart';

class LocaleProvider extends ChangeNotifier {
  late BuildContext context;
  bool isInit = false;
  MyLocaleMode currentLocaleMode = MyLocaleMode.en;

  void init(BuildContext ctx) {
    if (!isInit) {
      isInit = true;
      context = ctx;
      currentLocaleMode = UserInfos.getLocale(context);
    }
  }

  void changeLocale(BuildContext context, MyLocaleMode localeMode) {
    currentLocaleMode = localeMode;
    UserInfos.setLocale(context, currentLocaleMode);
    notifyListeners();
  }

  TextDirection get textDirection => currentLocaleMode == MyLocaleMode.fa
      ? TextDirection.rtl
      : TextDirection.ltr;

  String get regularFontFamily =>
      currentLocaleMode == MyLocaleMode.fa ? IYR : PR;

  String get boldFontFamily => currentLocaleMode == MyLocaleMode.fa ? IYB : PB;

  //***********************************************************************************
  String get appName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'appNameEn' : 'appNameFa']
      .toString();
  String get userName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'userNameEn' : 'userNameFa']
      .toString();
  String get LaOrFa =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'En' : 'Fa'].toString();
  String get enterValidNationalCode =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'enterValidNationalCodeEn'
              : 'enterValidNationalCodeFa']
          .toString();
  String get enterValidMobile => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidMobileEn'
          : 'enterValidMobileFa']
      .toString();
  String get enterValidPhone => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidPhoneEn'
          : 'enterValidPhoneFa']
      .toString();
  String enterDynamicValue(String value) {
    if (currentLocaleMode == MyLocaleMode.en) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['enterValidValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['enterValidValueFa']}';
  }
  String get enterValidCode => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidCodeEn'
          : 'enterValidCodeFa']
      .toString();
  String selectDynamicValue(String value) {
    if (currentLocaleMode == MyLocaleMode.en) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['selectValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['selectValueEn']}';
  }
  String get password => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'passwordEn' : 'passwordFa']
      .toString();
  String get enterValidPassword =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'enterValidPasswordEn'
              : 'enterValidPasswordFa']
          .toString();
  String get login => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'loginEn' : 'loginFa']
      .toString();
}
