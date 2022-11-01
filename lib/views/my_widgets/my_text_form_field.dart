import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';

import '../../providers/locale_provider.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.labelText,
      this.textDirection,
      this.validator,
      this.readOnly = false,
      this.textAlign = TextAlign.start,
      this.onTap,
      this.floatingLabelBehavior,
      this.hintText,
      this.hintStyle,
      this.autofillHints,
      this.focusNode,
      this.maxLine,
      this.minLine,
      this.onChanged,
      this.suffixIcon,
      this.obscureText,
      this.prefixIcon,
      this.width,
      this.maxLength,
      this.contentPadding});

  final TextEditingController? controller;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool readOnly;
  final TextAlign textAlign;
  final void Function()? onTap;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? hintText;
  final TextStyle? hintStyle;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final int? maxLine;
  final int? minLine;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final double? width;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return IgnorePointer(
        ignoring: readOnly,
        child: SizedBox(
            width: width ?? 300,
            child: TextFormField(
              autofillHints: autofillHints,
              controller: controller,
              readOnly: readOnly,
              textAlign: textAlign,
              textDirection: textDirection ?? localeProvider.textDirection,
              cursorColor: themeProvider.primaryColor,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              focusNode: focusNode,
              minLines: minLine ?? 1,
              maxLines: maxLine ?? 1,
              maxLength: maxLength,
              onTap: onTap,
              obscureText: obscureText ?? false,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  counterText: "",
                  labelText: labelText,
                  floatingLabelBehavior: floatingLabelBehavior,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  contentPadding: contentPadding,
                  prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
                  floatingLabelStyle:
                      TextStyle(color: themeProvider.primaryColor),
                  labelStyle: TextStyle(
                    fontFamily: localeProvider.regularFontFamily,
                    fontSize: 12
                  ),
                  errorStyle: TextStyle(
                    fontFamily: localeProvider.regularFontFamily,
                  )),
              style: TextStyle(
                  fontFamily: localeProvider.regularFontFamily,
                  color: themeProvider.fontColor3),
            )),
      );
    });
  }
}
