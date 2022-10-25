import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/views/my_widgets/form_title.dart';

class WalletTypesScreen extends StatefulWidget {
  const WalletTypesScreen({super.key});

  static const route = '/wallet-types';

  @override
  State<WalletTypesScreen> createState() => _WalletTypesScreenState();
}

class _WalletTypesScreenState extends State<WalletTypesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Column(
        children: [
          FormTitle(localeProvider.system,localeProvider.walletTypes)
        ],
      );
    });
  }
}


