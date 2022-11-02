import 'dart:async';
import 'package:wallet_core_management/base_screen.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/main_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/accounting/account_management_screen.dart';
import 'package:wallet_core_management/views/customers/insert_real_customers_screen.dart';
import 'package:wallet_core_management/views/auth/login_Screen.dart';
import 'package:wallet_core_management/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_management/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:wallet_core_management/views/systems/accounting_topics_managment_screen.dart';
import 'package:wallet_core_management/views/systems/branch_management_screen.dart';
import 'package:wallet_core_management/views/systems/commision_setting_screen.dart';
import 'package:wallet_core_management/views/systems/transaction_limitation_screen.dart';
import 'package:wallet_core_management/views/systems/user_managment_screen.dart';
import 'package:wallet_core_management/views/systems/wallet_types_screen.dart';
import 'package:wallet_core_management/views/wallets/customers_wallet_management_screen.dart';
import 'package:wallet_core_management/views/wallets/group_settlement_screen.dart';
import 'package:wallet_core_management/views/wallets/transfer_screen.dart';

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
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashScreen(),
          settings: settings);
    }
    if (settings.name == LoginScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(), settings: settings);
    }
    if (settings.name == DashboardScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DashboardScreen(),
          settings: settings);
    }
    if (settings.name == InsertRealCustomersScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const InsertRealCustomersScreen(),
          settings: settings);
    }
    if (settings.name == WalletTypesScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WalletTypesScreen(),
          settings: settings);
    }
    if (settings.name == UserManagementScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const UserManagementScreen(),
          settings: settings);
    }
    if (settings.name == AccountingTopicsManagementScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AccountingTopicsManagementScreen(),
          settings: settings);
    }
    if (settings.name == TransactionLimitationScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const TransactionLimitationScreen(),
          settings: settings);
    }
    if (settings.name == CommisionSettingScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CommisionSettingScreen(),
          settings: settings);
    }
    if (settings.name == BranchManagementScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const BranchManagementScreen(),
          settings: settings);
    }
    if (settings.name == CustomersWalletManagement.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CustomersWalletManagement(),
          settings: settings);
    }
    if (settings.name == TransferSceen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const TransferSceen(),
          settings: settings);
    }
    if (settings.name == GroupSettlementScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const GroupSettlementScreen(),
          settings: settings);
    }
    if (settings.name == AccountManagementScreen.route) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AccountManagementScreen(),
          settings: settings);
    }
  }
}
