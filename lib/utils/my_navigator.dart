import 'package:flutter/cupertino.dart';

import '../main.dart';

class MyNavigator {
  static pop() => MyApp.navigator.currentState!.pop();

  static pushNamed(BuildContext context, String route, {Object? arguments}) {
    MyApp.navigator.currentState!.pushNamed(route, arguments: arguments);
  }

  static pushNamedReplacement(BuildContext context, String route,
      {Object? arguments}) {
    MyApp.navigator.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  static pushNamedAndRemoveUntil(BuildContext context, String route,
      {bool? goFirst, Object? arguments}) {
    MyApp.navigator.currentState!.pushNamedAndRemoveUntil(route,
        (Route<dynamic> route) => (goFirst ?? false) ? route.isFirst : false,
        arguments: arguments);
  }
}
