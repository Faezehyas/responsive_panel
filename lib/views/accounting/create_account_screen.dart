import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/views/my_widgets/branch_selector.dart';
import 'package:wallet_core_management/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_management/views/my_widgets/topic_selector.dart';

import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/responsive.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const route = '/create-account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    _themeProvider = context.read<ThemeProvider>();
    _localeProvider = context.read<LocaleProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTitle(localeProvider.accounting, localeProvider.createAccount),
          if (Responsive.width(context) > 1050)
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: _form(),
                ),
              ],
            )
          else
            _form()
        ],
      );
    });
  }

  BoxContainer _form() {
    return BoxContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BranchSelector(),
          TopicSelector(),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MyTextFormField(
                labelText: _localeProvider.title,
              ),
              SizedBox(
                width: 270,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${_localeProvider.status}:',
                      style: TextStyle(
                          fontFamily: _localeProvider.boldFontFamily,
                          color: _themeProvider.fontColor3),
                    ),
                    SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: true,
                            activeColor: _themeProvider.primaryColor,
                            onChanged: (state) {},
                          ),
                          Text(
                            _localeProvider.active,
                            style: TextStyle(
                                fontFamily: _localeProvider.regularFontFamily,
                                color: _themeProvider.fontColor3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: false,
                            activeColor: _themeProvider.primaryColor,
                            onChanged: (state) {},
                          ),
                          Text(
                            _localeProvider.deactive,
                            style: TextStyle(
                                fontFamily: _localeProvider.regularFontFamily,
                                color: _themeProvider.fontColor3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          MyButton(
              onPressed: () {},
              title: _localeProvider.save,
              backgroundColor: _themeProvider.greenColor)
        ],
      ),
    );
  }
}
