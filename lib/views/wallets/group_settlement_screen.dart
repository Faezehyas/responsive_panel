import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/extension.dart';
import 'package:wallet_core_management/views/my_widgets/account_number_selector.dart';
import 'package:wallet_core_management/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';
import 'package:wallet_core_management/views/my_widgets/my_check_box_title.dart';
import 'package:wallet_core_management/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_management/views/my_widgets/table/table_item_widget.dart';

import '../../utils/responsive.dart';
import '../my_widgets/mini_widgets.dart';
import '../my_widgets/table/my_table_widget.dart';

class GroupSettlementScreen extends StatefulWidget {
  const GroupSettlementScreen({super.key});

  static const route = '/group-settlement';

  @override
  State<GroupSettlementScreen> createState() => _GroupSettlementScreenState();
}

class _GroupSettlementScreenState extends State<GroupSettlementScreen> {
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
          FormTitle(localeProvider.wallet, localeProvider.groupSettlement),
          if (Responsive.width(context) > 1030)
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 710),
                  child: _desktopForm(),
                ),
              ],
            )
          else
            Responsive.isDesktop(context)
                ? _desktopForm()
                : _mobileAndTabletForm()
        ],
      );
    });
  }

  BoxContainer _desktopForm() {
    return BoxContainer(
      child: SizedBox(
        height: 100.h() - 130,
        width: double.infinity,
        child: Column(
          children: [
            _insertBox(),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: _table(),
            ),
          ],
        ),
      ),
    );
  }

  BoxContainer _mobileAndTabletForm() {
    return BoxContainer(
      child: SizedBox(
        height: 100.h() - 130,
        width: double.infinity,
        child: ListView(
          children: [
            _insertBox(),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? 400 : 600,
              child: _table(),
            ),
          ],
        ),
      ),
    );
  }

  Column _insertBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountNumberSelector(),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            MyTextFormField(
              labelText: _localeProvider.fileAddress,
              suffixIcon: Icon(Icons.attach_file_sharp),
              width: 686,
            ),
            MyDropDown(
              labelText: _localeProvider.transactionType,
              width: 240,
            ),
            MyCheckBoxTitle(
              label: _localeProvider.settlementToBankAccount,
              width: 240,
            ),
            AmountWidget(
              labelText: _localeProvider.totalAmount,
              withWord: true,
              width: 240,
            ),
            MyButton(
              onPressed: () {},
              title: _localeProvider.send,
              backgroundColor: _themeProvider.greenColor,
            ),
            MyButton(onPressed: () {}, title: _localeProvider.outputList)
          ],
        ),
      ],
    );
  }

  MyTableWidget _table() {
    return MyTableWidget(
      headers: [
        MyTableItemWidget(
            width: 40, title: '#', fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 110,
            title: _localeProvider.mobileNumber,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 120,
            title: _localeProvider.debtor,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 120,
            title: _localeProvider.creditor,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 160,
            title: _localeProvider.description,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 140,
            title: _localeProvider.ibanNumber,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 110,
            title: _localeProvider.serialNumber,
            fontFamily: _localeProvider.boldFontFamily),
        MyTableItemWidget(
            width: 200,
            title: _localeProvider.errorDescription,
            fontFamily: _localeProvider.boldFontFamily),
      ],
      data: List.generate(
          20,
          (index) => [
                MyTableItemWidget(width: 40, title: (index + 1).toString()),
                MyTableItemWidget(width: 110, title: '09378148952'),
                MyTableItemWidget(
                    width: 120, title: '0'),
                MyTableItemWidget(width: 120, title: '100,000'),
                MyTableItemWidget(width: 160, title: 'The following defines the version and build number'),
                MyTableItemWidget(width: 140, title: 'IR365478954697821456987452'),
                MyTableItemWidget(width: 110, title: '77865458'),
                MyTableItemWidget(width: 200, title: 'The following defines the version and build number'),
              ]).toList(),
    );
  }
}
