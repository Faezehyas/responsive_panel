import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/extension.dart';
import 'package:wallet_core_management/utils/responsive.dart';
import 'package:wallet_core_management/views/my_widgets/account_number_selector.dart';
import 'package:wallet_core_management/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';
import 'package:wallet_core_management/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_management/views/my_widgets/wallet_number_selector.dart';

import '../my_widgets/mini_widgets.dart';

class TransferSceen extends StatefulWidget {
  const TransferSceen({super.key});

  static const route = '/transfer-screen';

  @override
  State<TransferSceen> createState() => _TransferSceenState();
}

class _TransferSceenState extends State<TransferSceen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _themeProvider = context.read<ThemeProvider>();
    _localeProvider = context.read<LocaleProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Column(
        children: [
          FormTitle(localeProvider.wallet, localeProvider.transfer),
          if (Responsive.width(context) > 1200)
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 820),
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
      child: SizedBox(
        height: 100.h() - 130,
        child: Column(
          children: [
            _tabBar(),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                _transferForm(),
                _cashoutForm(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Column _cashoutForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: ListView(
        children: [
          AccountNumberSelector(),
          const SizedBox(
            height: 4,
          ),
          WalletNumberSelector(),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AmountWidget(
                width: 200,
                labelText: _localeProvider.cashoutAmount,
              ),
              MyTextFormField(
                labelText: _localeProvider.description,
                minLine: 2,
                maxLine: 2,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      )),
      Row(
        children: [
          MyButton(
            onPressed: () {},
            title: _localeProvider.transfer,
            backgroundColor: _themeProvider.greenColor,
          ),
        ],
      )
    ]);
  }

  Column _transferForm() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              GroupBoxContainer(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                title: _localeProvider.source,
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WalletNumberSelector(),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.balance,
                        ),
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.blocked,
                        ),
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.availableBalance,
                        )
                      ],
                    )
                  ],
                ),
              ),
              GroupBoxContainer(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                title: _localeProvider.target,
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WalletNumberSelector(),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.balance,
                        ),
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.blocked,
                        ),
                        AmountWidget(
                          width: 200,
                          labelText: _localeProvider.availableBalance,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AmountWidget(
                    labelText: _localeProvider.transferAmount,
                    width: 240,
                    withWord: true,
                  ),
                  MyDropDown(
                    width: 200,
                    labelText: _localeProvider.transactionType,
                  ),
                  MyTextFormField(
                    labelText: _localeProvider.description,
                    minLine: 2,
                    maxLine: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
        Row(
          children: [
            MyButton(
              onPressed: () {},
              title: _localeProvider.transfer,
              backgroundColor: _themeProvider.greenColor,
            ),
          ],
        )
      ],
    );
  }

  Row _tabBar() {
    return Row(
      children: [
        SizedBox(
          width: 220,
          child: TabBar(
            padding: EdgeInsets.zero,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: _themeProvider.fontColor3,
            unselectedLabelColor: Colors.grey,
            labelColor: _themeProvider.fontColor3,
            unselectedLabelStyle:
                TextStyle(fontFamily: _localeProvider.boldFontFamily),
            labelStyle: TextStyle(fontFamily: _localeProvider.boldFontFamily),
            onTap: (index) {
              setState(() {});
            },
            tabs: [
              Tab(
                text: _localeProvider.transfer,
              ),
              Tab(
                text: _localeProvider.cashout,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
