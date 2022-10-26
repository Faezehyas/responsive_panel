
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';

import '../../providers/theme_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String route = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Column(
        children: [
          FormTitle(localeProvider.dashboard,'')
        ],
      );
    });
  }
}