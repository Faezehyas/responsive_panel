import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';

class WalletNumberSelector extends StatefulWidget {
  String codeLabelText;
  String descLabelText;
  WalletNumberSelector({
    required this.codeLabelText,
    required this.descLabelText,
    Key? key,
  }) : super(key: key);

  @override
  State<WalletNumberSelector> createState() => _WalletNumberSelectorState();
}

class _WalletNumberSelectorState extends State<WalletNumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _themeProvider.primaryColor)),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 12,
          children: [
            Text(
              '${widget.codeLabelText}:',
              style: TextStyle(
                  color: _themeProvider.fontColor3,
                  fontFamily: _localeProvider.boldFontFamily,
                  fontSize: 12),
            ),
            const SizedBox(
              width: 8,
            ),
            MyTextFormField(
              labelText: _localeProvider.branchCode,
              textDirection: TextDirection.ltr,
              maxLength: 7,
              width: 110,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up_rounded,
                      color: _themeProvider.primaryColor,
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      color: _themeProvider.primaryColor,
                    ),
                  ],
                ),
              ),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(6, 12, 4, 12),
            ),
            const SizedBox(
              width: 2,
            ),
            MyTextFormField(
              labelText: _localeProvider.walletType,
              textDirection: TextDirection.ltr,
              maxLength: 2,
              width: 90,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(6, 12, 4, 12),
            ),
            const SizedBox(
              width: 2,
            ),
            MyTextFormField(
              labelText: _localeProvider.customerCode,
              textDirection: TextDirection.ltr,
              maxLength: 10,
              width: 116,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(6, 12, 4, 12),
            ),
            const SizedBox(
              width: 2,
            ),
            MyTextFormField(
              labelText: _localeProvider.number,
              textDirection: TextDirection.ltr,
              maxLength: 10,
              width: 136,
              suffixIcon: IconTheme(
                data: IconThemeData(color: _themeProvider.primaryColor),
                child: const Icon(
                  Icons.manage_search_outlined,
                  size: 28,
                ),
              ),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(6, 12, 0, 12),
            ),
            const SizedBox(
              width: 8,
            ),
            MyTextFormField(
              textDirection: _localeProvider.textDirection,
              labelText: widget.descLabelText,
              textAlign: _localeProvider.textAlign,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.cleaning_services_rounded,
                size: 24,
              ),
            )
          ],
        ),
      );
    });
  }
}
