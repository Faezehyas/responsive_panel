import 'package:corebancking_backoffice/utils/enums.dart';
import 'package:corebancking_backoffice/utils/user_infos.dart';
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

  TextDirection get getTextDirection => currentLocaleMode == MyLocaleMode.fa
      ? TextDirection.rtl
      : TextDirection.ltr;

  String get regularFontFamily =>
      currentLocaleMode == MyLocaleMode.fa ? IYR : PR;

  String get boldFontFamily =>
      currentLocaleMode == MyLocaleMode.fa ? IYR : PR;

  //***********************************************************************************
  String get appName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'appNameEn' : 'appNameFa']
      .toString();
  String get userName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'userNameEn' : 'userNameFa']
      .toString();
}
