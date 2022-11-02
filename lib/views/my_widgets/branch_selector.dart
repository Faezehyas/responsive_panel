import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';

class BranchSelector extends StatefulWidget {
  String? codeLabelText;
  String? descLabelText;
  double? width;
  BranchSelector({
    this.codeLabelText,
    this.descLabelText,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<BranchSelector> createState() => _BranchSelectorState();
}

class _BranchSelectorState extends State<BranchSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        width: widget.width,
        child: Row(
          children: [
            MyTextFormField(
              labelText: widget.codeLabelText ?? _localeProvider.branchCode,
              textDirection: _localeProvider.textDirection,
              maxLength: 7,
              width: 150,
              suffixIcon: IconTheme(
                data: IconThemeData(color: _themeProvider.primaryColor),
                child: const Icon(
                  Icons.manage_search_outlined,
                  size: 28,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_drop_up_rounded,
                    color: _themeProvider.primaryColor,),
                    Icon(Icons.arrow_drop_down_rounded,
                    color: _themeProvider.primaryColor,),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: MyTextFormField(
              textDirection: _localeProvider.textDirection,
              labelText: widget.descLabelText ?? _localeProvider.branchName,
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
