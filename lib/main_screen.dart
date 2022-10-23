import 'package:corebancking_backoffice/providers/locale_provider.dart';
import 'package:corebancking_backoffice/providers/theme_provider.dart';
import 'package:corebancking_backoffice/utils/const.dart';
import 'package:corebancking_backoffice/utils/responsive.dart';
import 'package:corebancking_backoffice/views/auth/login_Screen.dart';
import 'package:corebancking_backoffice/views/side_menu.dart';
import 'package:corebancking_backoffice/views/splash_screen.dart';
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

  @override
  void initState() {
    _themeProvider = context.read<ThemeProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Navigator(
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (widget.route) {
            case SplashScreen.route:
              builder = (BuildContext context) => _view(SplashScreen());
              break;
            case LoginScreen.route:
              builder = (BuildContext context) => _view(LoginScreen());
              break;
            default:
              builder = (BuildContext context) => _view(SplashScreen());
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
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
          : AppBar(
              backgroundColor: _themeProvider.backgroundColor,
              leadingWidth: 40,
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: SvgPicture.asset(
                        '${iconAsset}ic_menu.svg',
                        color: _themeProvider.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
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
                : AppBar(
                    backgroundColor: _themeProvider.backgroundColor,
                  ),
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
}
