import 'package:wallet_core_managment/main.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/main_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/const.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/customers/insert_real_customers_screen.dart';
import 'package:wallet_core_managment/views/auth/login_Screen.dart';
import 'package:wallet_core_managment/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_managment/views/my_widgets/my_app_bar.dart';
import 'package:wallet_core_managment/views/side_menu/side_menu.dart';
import 'package:wallet_core_managment/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  Widget child;
  BaseScreen({required this.child});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  ThemeProvider _themeProvider = ThemeProvider();
  LocaleProvider _localeProvider = LocaleProvider();
  MainProvider _mainProvider = MainProvider();

  @override
  void initState() {
    _themeProvider = context.read<ThemeProvider>();
    _localeProvider = context.read<LocaleProvider>();
    _mainProvider = context.read<MainProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ThemeProvider, LocaleProvider, MainProvider>(
        builder: (context, themeProvider, localeProvider, mainProvider, _) {
      return Directionality(
        textDirection: localeProvider.textDirection,
        child: _view(widget.child),
      );
    });
  }

  _view(Widget child) => SafeArea(
        child: Responsive(
          mobile: _tabletAndMobile(context, child),
          tablet: _tabletAndMobile(context, child),
          desktop: _desktop(context, child),
        ),
      );

  Scaffold _tabletAndMobile(BuildContext context, Widget child) {
    return Scaffold(
      appBar: _mainProvider.currentRoute == LoginScreen.route ||
              _mainProvider.currentRoute == SplashScreen.route
          ? null
          : myAppBar(context, _themeProvider, _localeProvider),
      drawer: _mainProvider.currentRoute == LoginScreen.route ||
              _mainProvider.currentRoute == SplashScreen.route
          ? null
          : SideMenu(),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
        height: Responsive.height(context),
        width: Responsive.width(context),
        decoration: BoxDecoration(
          color: _themeProvider.backgroundColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('${imageAsset}dashboard_bg.jpg'),
            opacity: 0.2,
          ),
        ),
        child: child,
      ),
    );
  }

  _desktop(BuildContext context, Widget child) {
    return Row(
      children: [
        if (!(_mainProvider.currentRoute == LoginScreen.route ||
            _mainProvider.currentRoute == SplashScreen.route))
          SideMenu(),
        Expanded(
          child: Scaffold(
            appBar: (_mainProvider.currentRoute == LoginScreen.route ||
                    _mainProvider.currentRoute == SplashScreen.route)
                ? null
                : myAppBar(context, _themeProvider, _localeProvider),
            body: Container(
              height: Responsive.height(context),
              width: Responsive.width(context),
              padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
              decoration: BoxDecoration(
                color: _themeProvider.backgroundColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('${imageAsset}dashboard_bg.jpg'),
                  opacity: 0.2,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
