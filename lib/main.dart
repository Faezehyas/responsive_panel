import 'package:corebancking_backoffice/main_screen.dart';
import 'package:corebancking_backoffice/providers/locale_provider.dart';
import 'package:corebancking_backoffice/providers/main_provider.dart';
import 'package:corebancking_backoffice/providers/theme_provider.dart';
import 'package:corebancking_backoffice/utils/custom_page_route.dart';
import 'package:corebancking_backoffice/views/auth/login_Screen.dart';
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
  static final navigator = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<MainProvider>().init(context);
      if (!mounted) return;
      context.read<ThemeProvider>().initTheme(context);
      context.read<LocaleProvider>().init(context);
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
        // builder: (context, child) => BaseWidget(child: child!),
        initialRoute: '/',
        theme: themeProvider.myTheme,
        onGenerateRoute: (settings) => routing(settings),
      );
    });
  }

  routing(settings) {
    if (settings.name == '/') {
      return CustomPageRoute(MainScreen());
    }
  }
}
