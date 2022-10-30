import 'package:wallet_core_managment/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_core_managment/views/auth/login_Screen.dart';
import 'package:wallet_core_managment/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_managment/views/systems/accounting_topics_managment_screen.dart';
import 'package:wallet_core_managment/views/systems/user_managment_screen.dart';
import 'package:wallet_core_managment/views/systems/wallet_types_screen.dart';

class MainProvider extends ChangeNotifier {
  static late SharedPreferences sharedPreferences;
  bool isInit = false;
  String currentRoute = '';


  Future<void> init(BuildContext context) async {
    if (!isInit) {
      isInit = true;
      sharedPreferences = await SharedPreferences.getInstance();
      MyNavigator.pushNamedAndRemoveUntil(context, AccountingTopicsManagmentScreen.route);
    }
  }

  void updateCurrentRoute(String route){
    currentRoute = route;
    notifyListeners();
  }
}
