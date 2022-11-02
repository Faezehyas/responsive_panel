import 'package:wallet_core_management/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_core_management/views/accounting/create_account_screen.dart';

class MainProvider extends ChangeNotifier {
  static late SharedPreferences sharedPreferences;
  bool isInit = false;
  String currentRoute = '';


  Future<void> init(BuildContext context) async {
    if (!isInit) {
      isInit = true;
      sharedPreferences = await SharedPreferences.getInstance();
      MyNavigator.pushNamedAndRemoveUntil(context, CreateAccountScreen.route);
    }
  }

  void updateCurrentRoute(String route){
    currentRoute = route;
    notifyListeners();
  }
}
