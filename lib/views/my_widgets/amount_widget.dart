import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

class AmountWidget extends StatefulWidget {
  String labelText;
  AmountWidget({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return MyTextFormField(
        labelText: widget.labelText,
        textDirection: _localeProvider.textDirection,
        textAlign: TextAlign.left,
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _localeProvider.moneySymbol,
              style: TextStyle(fontFamily: _localeProvider.regularFontFamily,
              color: _themeProvider.fontColor3),
            ),
          ],
        ),
      );
    });
  }
}
