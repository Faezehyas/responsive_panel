import 'dart:async';

import 'package:wallet_core_managment/base_screen.dart';
import 'package:wallet_core_managment/main_screen.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/main_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/views/customers/insert_real_customers_screen.dart';
import 'package:wallet_core_managment/views/auth/login_Screen.dart';
import 'package:wallet_core_managment/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_managment/views/side_menu/side_menu.dart';
import 'package:wallet_core_managment/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainProvider _mainProvider = MainProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  LocaleProvider _localeProvider = LocaleProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _mainProvider = context.read<MainProvider>();
      _themeProvider = context.read<ThemeProvider>();
      _localeProvider = context.read<LocaleProvider>();
      await _mainProvider.init(context);
      if (!mounted) return;
      _themeProvider.initTheme(context);
      _localeProvider.init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return MaterialApp(
        title: localeProvider.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.navigator,
        initialRoute: SplashScreen.route,
        theme: themeProvider.myTheme,
        builder: (context, child) => BaseScreen(child: child!),
        onGenerateRoute: (settings) => routing(settings),
      );
    });
  }

  routing(settings) {
    _mainProvider.updateCurrentRoute(settings.name);
    if (settings.name == SplashScreen.route) {
      return MaterialPageRoute(
          builder: (context) => SplashScreen(), settings: settings);
    }
    if (settings.name == LoginScreen.route) {
      return MaterialPageRoute(
          builder: (context) => LoginScreen(), settings: settings);
    }
    if (settings.name == DashboardScreen.route) {
      return MaterialPageRoute(
          builder: (context) => DashboardScreen(), settings: settings);
    }
    if (settings.name == InsertRealCustomersScreen.route) {
      return MaterialPageRoute(
          builder: (context) => InsertRealCustomersScreen(),
          settings: settings);
    }
  }

  Map<String, WidgetBuilder> get _router {
    return {
      SplashScreen.route: (context) => MainScreen(route: SplashScreen.route),
      LoginScreen.route: (context) => MainScreen(route: LoginScreen.route),
      DashboardScreen.route: (context) =>
          MainScreen(route: DashboardScreen.route),
      InsertRealCustomersScreen.route: (context) =>
          MainScreen(route: InsertRealCustomersScreen.route),
    };
  }
}
