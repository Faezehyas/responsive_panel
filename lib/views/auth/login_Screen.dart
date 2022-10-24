import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/theme/my_dark_theme.dart';
import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/my_navigator.dart';
import 'package:wallet_core_managment/utils/validators.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurepass = true;
  IconData _passIcon = Icons.visibility;
  final _userNameFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _userNameFocusNode.addListener(() {
      setState(() {});
    });
    _passFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 360,
            height: 380,
            decoration: BoxDecoration(
                color: themeProvider.backgroundColor,
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _titleAndInputBox(localeProvider, themeProvider),
                    _loginBtn(themeProvider, localeProvider)
                  ],
                ),
                _languageAndTheme(localeProvider, context, themeProvider),
              ],
            ),
          ),
        ),
      );
    });
  }

  InkWell _loginBtn(
      ThemeProvider themeProvider, LocaleProvider localeProvider) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () {
        // if (_formKey.currentState!.validate()) {
        MyNavigator.pushNamedAndRemoveUntil(context, DashboardScreen.route);
        // }
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: themeProvider.primaryColor,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localeProvider.login,
              style: TextStyle(
                  color: MyDarkTheme.instance.colors.fontColor3,
                  fontFamily: localeProvider.boldFontFamily,
                  fontSize: 18),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              Icons.key_sharp,
              color: MyDarkTheme.instance.colors.fontColor3,
            )
          ],
        ),
      ),
    );
  }

  Column _titleAndInputBox(
      LocaleProvider localeProvider, ThemeProvider themeProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 48),
          child: Text(
            localeProvider.appName,
            textAlign: TextAlign.center,
            textDirection: localeProvider.textDirection,
            style: TextStyle(
                color: themeProvider.primaryColor,
                fontFamily: localeProvider.boldFontFamily,
                fontSize: 18),
          ),
        ),
        MyTextFormField(
            labelText: localeProvider.userName,
            textDirection: TextDirection.ltr,
            focusNode: _userNameFocusNode,
            prefixIcon: Icon(
              Icons.person_rounded,
              size: 24,
              color: _userNameFocusNode.hasFocus
                  ? themeProvider.primaryColor
                  : themeProvider.fontColor3,
            ),
            onChanged: ((p0) {
              setState(() {});
            }),
            validator: (value) => generalValidator(
                value, localeProvider.userName, localeProvider)),
        const SizedBox(
          height: 16,
        ),
        MyTextFormField(
            labelText: localeProvider.password,
            textDirection: TextDirection.ltr,
            focusNode: _passFocusNode,
            prefixIcon: Icon(
              Icons.lock_rounded,
              size: 20,
              color: _passFocusNode.hasFocus
                  ? themeProvider.primaryColor
                  : themeProvider.fontColor3,
            ),
            obscureText: _obscurepass,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurepass = !_obscurepass;
                    _passIcon =
                        _obscurepass ? Icons.visibility : Icons.visibility_off;
                  });
                },
                icon: Icon(
                  _passIcon,
                  color: themeProvider.primaryColor,
                )),
            onChanged: ((p0) {
              setState(() {});
            }),
            validator: (value) => passwordValidator(value, localeProvider))
      ],
    );
  }

  Positioned _languageAndTheme(LocaleProvider localeProvider,
      BuildContext context, ThemeProvider themeProvider) {
    return Positioned(
        top: 8,
        right: 8,
        left: 8,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: InkWell(
                  onTap: () => themeProvider.changeTheme(
                      context,
                      themeProvider.currentThemeMode == MyThemeMode.dark
                          ? MyThemeMode.light
                          : MyThemeMode.dark),
                  child: Icon(
                    themeProvider.currentThemeMode == MyThemeMode.dark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: themeProvider.yellowColor,
                    size: 20,
                  ),
                ),
              ),
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  localeProvider.changeLocale(
                      context,
                      localeProvider.currentLocaleMode == MyLocaleMode.en
                          ? MyLocaleMode.fa
                          : MyLocaleMode.en);
                  _formKey.currentState!.validate();
                },
                child: Text(
                  localeProvider.LaOrFa,
                  style: TextStyle(
                      color: themeProvider.blueColor,
                      fontFamily: localeProvider.regularFontFamily,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ));
  }
}
