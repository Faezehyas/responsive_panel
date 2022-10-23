import 'package:corebancking_backoffice/main.dart';
import 'package:corebancking_backoffice/utils/my_navigator.dart';
import 'package:corebancking_backoffice/views/auth/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  static late SharedPreferences sharedPreferences;
  bool isInit = false;
  String selectedMenu = '';
  String selectedSubmenu = '';


  Future<void> init(BuildContext context) async {
    if (!isInit) {
      isInit = true;
      sharedPreferences = await SharedPreferences.getInstance();
      MyNavigator.pushNamedAndRemoveUntil(context, LoginScreen.route);
    }
  }
}
