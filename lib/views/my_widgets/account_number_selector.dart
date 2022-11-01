import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';

class AccountNumberSelector extends StatefulWidget {
  String? codeLabelText;
  String? descLabelText;
  AccountNumberSelector({
    this.codeLabelText,
    this.descLabelText,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountNumberSelector> createState() => _AccountNumberSelectorState();
}

class _AccountNumberSelectorState extends State<AccountNumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _themeProvider.primaryColor)),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 12,
                spacing: 2,
                children: [
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
                  MyTextFormField(
                    labelText: _localeProvider.topicCode,
                    textDirection: TextDirection.ltr,
                    maxLength: 10,
                    width: 116,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(6, 12, 4, 12),
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
                  MyTextFormField(
                    textDirection: _localeProvider.textDirection,
                    labelText: widget.descLabelText ?? _localeProvider.targetAccountName,
                    textAlign: _localeProvider.textAlign,
                    readOnly: true,
                    suffixIcon: const Icon(
                      Icons.cleaning_services_rounded,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned.directional(
            top: 0,
            start: 4,
            textDirection: _localeProvider.textDirection,
            child: Container(
              color: _themeProvider.boxColor3,
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                widget.codeLabelText ?? _localeProvider.accountNumber,
                style: TextStyle(
                    color: _themeProvider.fontColor3,
                    fontFamily: _localeProvider.boldFontFamily,
                    fontSize: 12),
              ),
            ),
          )
        ],
      );
    });
  }
}
