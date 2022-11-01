import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';

class AmountWidget extends StatefulWidget {
  String labelText;
  double? width;
  TextEditingController? textEditingController;
  bool? withWord;
  AmountWidget({
    required this.labelText,
    this.width,
    this.withWord,
    this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  TextEditingController? textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, _localeProvider, _themeProvider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(
            labelText: widget.labelText,
            width: widget.width,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            controller: widget.textEditingController ?? textEditingController,
            textDirection: _localeProvider.textDirection,
            textAlign: TextAlign.left,
            onChanged: (value) {
              setState(() {
                (widget.textEditingController ?? textEditingController)!.text =
                    value.replaceAll(',', '').seRagham();
                var cursorPos = TextSelection.fromPosition(TextPosition(
                    offset:
                        (widget.textEditingController ?? textEditingController)!
                            .text
                            .length));
                (widget.textEditingController ?? textEditingController)!
                    .selection = cursorPos;
              });
            },
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _localeProvider.moneySymbol,
                  style: TextStyle(
                      fontFamily: _localeProvider.regularFontFamily,
                      color: _themeProvider.fontColor3),
                ),
              ],
            ),
          ),
          if (widget.withWord ?? false)
            Text(
              (widget.textEditingController ?? textEditingController)!
                      .text
                      .isEmpty
                  ? ''
                  : _localeProvider.amountToWrod(int.tryParse(
                          (widget.textEditingController ??
                                  textEditingController)!
                              .text
                              .replaceAll(',', '')
                              .replaceAll('.', '')) ??
                      0),
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: _localeProvider.regularFontFamily,
                  color: _themeProvider.primaryColor),
            )
        ],
      );
    });
  }
}
