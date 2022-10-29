import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

class TopicSelector extends StatefulWidget {
  String codeLabelText;
  String descLabelText;
  TopicSelector({
    required this.codeLabelText,
    required this.descLabelText,
    Key? key,
  }) : super(key: key);

  @override
  State<TopicSelector> createState() => _TopicSelectorState();
}

class _TopicSelectorState extends State<TopicSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            MyTextFormField(
              labelText: widget.codeLabelText,
              textDirection: _localeProvider.textDirection,
              maxLength: 9,
              width: 140,
              suffixIcon: IconTheme(
                data: IconThemeData(color: _themeProvider.primaryColor),
                child: const Icon(
                  Icons.manage_search_outlined,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: MyTextFormField(
              textDirection: _localeProvider.textDirection,
              labelText: widget.descLabelText,
              textAlign: _localeProvider.textAlign,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.cleaning_services_rounded,
                size: 24,
              ),
            ))
          ],
        ),
      );
    });
  }
}
