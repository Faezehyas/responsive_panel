import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';

import '../../utils/my_navigator.dart';

deleteDialog(BuildContext context, {required String desc}) {
  ThemeProvider themeProvider = context.read<ThemeProvider>();
  LocaleProvider localeProvider = context.read<LocaleProvider>();
  return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 350),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      barrierLabel: '',
      barrierColor: Colors.white.withOpacity(0),
      pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
            backgroundColor: themeProvider.backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              MyButton(
                onPressed: () => MyNavigator.pop(),
                title: localeProvider.yes,
                width: 40,
                backgroundColor: themeProvider.orangeColor,
              ),
              MyButton(
                onPressed: () => MyNavigator.pop(),
                title: localeProvider.no,
                width: 40,
              )
            ],
            content: SizedBox(
              height: 160,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Icon(
                      Icons.delete_forever_rounded,
                      color: themeProvider.orangeColor,
                      size: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      localeProvider.areYouSure,
                      style: TextStyle(
                          color: themeProvider.fontColor3,
                          fontFamily: localeProvider.boldFontFamily,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    '${localeProvider.delete} $desc',
                    style: TextStyle(
                      color: themeProvider.fontColor3,
                      fontFamily: localeProvider.regularFontFamily,
                    ),
                  )
                ],
              ),
            ),
          ));
}
