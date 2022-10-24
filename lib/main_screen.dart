import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/const.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/auth/login_Screen.dart';
import 'package:wallet_core_managment/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_managment/views/my_widgets/my_app_bar.dart';
import 'package:wallet_core_managment/views/my_widgets/side_menu.dart';
import 'package:wallet_core_managment/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final Object? arg;
  final String route;
  MainScreen({required this.route, this.arg});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ThemeProvider _themeProvider = ThemeProvider();
  LocaleProvider _localeProvider = LocaleProvider();

  @override
  void initState() {
    _themeProvider = context.read<ThemeProvider>();
    _localeProvider = context.read<LocaleProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Directionality(
        textDirection: localeProvider.textDirection,
        child: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            return _routing(settings);
          },
        ),
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
      appBar: widget.route == LoginScreen.route ||
              widget.route == SplashScreen.route
          ? null
          : myAppBar(context,_themeProvider, _localeProvider),
      drawer: widget.route == LoginScreen.route ||
              widget.route == SplashScreen.route
          ? null
          : SideMenu(),
      body: Container(
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
        if (!(widget.route == LoginScreen.route ||
            widget.route == SplashScreen.route))
          SideMenu(),
        Expanded(
          child: Scaffold(
            appBar: (widget.route == LoginScreen.route ||
                    widget.route == SplashScreen.route)
                ? null
                : myAppBar(context,_themeProvider, _localeProvider),
            body: Container(
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
          ),
        ),
      ],
    );
  }

  MaterialPageRoute<dynamic> _routing(RouteSettings settings) {
    WidgetBuilder builder;
    switch (widget.route) {
      case SplashScreen.route:
        builder = (BuildContext context) => _view(SplashScreen());
        break;
      case LoginScreen.route:
        builder = (BuildContext context) => _view(LoginScreen());
        break;
      case DashboardScreen.route:
        builder = (BuildContext context) => _view(DashboardScreen());
        break;
      default:
        builder = (BuildContext context) => _view(SplashScreen());
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
