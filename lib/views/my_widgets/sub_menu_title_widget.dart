import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';

class SubMenuTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final ThemeProvider themeProvider;
  final Widget? routeTo;
  const SubMenuTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.themeProvider,
    required this.routeTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        width: 200,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: themeProvider.boxColor3,
            ),
          ),
        ),
        child: Text(
          subtitle,
          style: TextStyle(color: themeProvider.fontColor3),
        ),
      ),
    );
  }
}
