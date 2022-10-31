import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/views/my_widgets/account_number_selector.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';

import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/responsive.dart';
import '../my_widgets/amount_widget.dart';
import '../my_widgets/branch_selector.dart';
import '../my_widgets/mini_widgets.dart';
import '../my_widgets/my_check_box_title.dart';
import '../my_widgets/my_drop_down.dart';
import '../my_widgets/my_text_form_field.dart';
import '../my_widgets/table/my_table_widget.dart';
import '../my_widgets/table/table_item_widget.dart';

class CommisionSettingScreen extends StatefulWidget {
  const CommisionSettingScreen({super.key});

  static const route = '/commission-setting';

  @override
  State<CommisionSettingScreen> createState() => _CommisionSettingScreenState();
}

class _CommisionSettingScreenState extends State<CommisionSettingScreen> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  bool _editOrNew = false;
  ScrollController _scrollController = ScrollController();

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
        children: [
          FormTitle(
              localeProvider.system, localeProvider.commisionSetting),
          Responsive.isDesktop(context) ? _desktop() : _mobileAndTablet()
        ],
      );
    });
  }

  Row _desktop() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 4,
          child: BoxContainer(
            child: SizedBox(
              height: 100.h() - 130,
              child: _firstForm(),
            ),
          )),
      const SizedBox(
        width: 16,
      ),
      Expanded(
          flex: 2,
          child: Visibility(
              visible: _editOrNew,
              child: BoxContainer(
                  child: SizedBox(
                height: 100.h() - 130,
                child: _secondForm(),
              ))))
    ]);
  }

  _mobileAndTablet() {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        children: [
          BoxContainer(
            child: SizedBox(
              height: Responsive.isMobile(context) ? 130.h() : 70.h(),
              child: _firstForm(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
              visible: _editOrNew,
              child: Visibility(
                  visible: _editOrNew,
                  child: BoxContainer(
                    child: SizedBox(
                      height: 60.h(),
                      child: _secondForm(),
                    ),
                  )))
        ],
      ),
    );
  }

  _secondForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FormSubTitle(
              title: _localeProvider.newOrEdit,
            ),
          ),
          _secondFormItems(),
          const SizedBox(
            height: 16,
          ),
          _secondFromBtns()
        ],
      ),
    );
  }

  Wrap _secondFromBtns() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        MyButton(
            onPressed: () {},
            title: _localeProvider.save,
            backgroundColor: _themeProvider.greenColor),
        MyButton(
            onPressed: () => setState(() {
                  _editOrNew = false;
                  if (!Responsive.isDesktop(context)) {
                    _scrollController.animateTo(
                      _scrollController.position.minScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                }),
            title: _localeProvider.cancel,
            backgroundColor: _themeProvider.yellowColor)
      ],
    );
  }

  Expanded _secondFormItems() {
    return Expanded(
      child: ListView(
        children: [
          BranchSelector(
              codeLabelText: _localeProvider.sourceBranch,
              descLabelText: _localeProvider.branchName),
          AccountNumberSelector(
              codeLabelText: _localeProvider.targetAccountNumber,
              descLabelText: _localeProvider.targetAccountName),
          const SizedBox(
            height: 4,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MyDropDown(
                labelText: _localeProvider.userType,
                width: 120,
              ),
              MyDropDown(
                labelText: _localeProvider.transactionType,
                width: 240,
              ),
              MyDropDown(
                labelText: _localeProvider.walletType,
                width: 170,
              ),
              MyDropDown(
                labelText: _localeProvider.status,
                width: 100,
              ),
              MyDropDown(
                labelText: _localeProvider.commisionType,
                width: 160,
              ),
              MyDropDown(
                labelText: _localeProvider.targetAccountType,
                width: 160,
              ),
              MyTextFormField(
                labelText: _localeProvider.commisionValue,
                width: 200,
              ),
              AmountWidget(
                labelText: _localeProvider.minimumAmount,
                width: 200,
              ),
              AmountWidget(
                labelText: _localeProvider.maximumAmount,
                width: 200,
              ),
              MyTextFormField(
                labelText: _localeProvider.channel,
                width: 100,
              ),
              MyTextFormField(
                labelText: _localeProvider.media,
                width: 100,
              ),
              MyTextFormField(
                labelText: _localeProvider.userGroup,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _firstForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormSubTitle(
                  title: _localeProvider.search,
                ),
                NewCircleBtn(
                  onTap: () => setState(() {
                    _editOrNew = true;
                    if (!Responsive.isDesktop(context)) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    }
                  }),
                )
              ],
            ),
          ),
          _searchItems(),
          const SizedBox(
            height: 12,
          ),
          _table()
        ],
      ),
    );
  }

  Expanded _table() {
    return Expanded(
      child: MyTableWidget(
        headers: [
          MyTableItemWidget(
              width: 40,
              title: '#',
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.transactionType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 116,
              title: _localeProvider.branchCode,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 140,
              title: _localeProvider.targetAccountNumber,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.userType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.walletType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 70,
              title: _localeProvider.userGroup,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.commisionType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.commisionValue,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 90,
              title: _localeProvider.minimumAmount,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.maximumAmount,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.date,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.channel,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.media,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.status,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.insertedUserCode,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.actions,
              fontFamily: _localeProvider.boldFontFamily),
        ],
        data: List.generate(
            20,
            (index) => [
                  MyTableItemWidget(
                    width: 40,
                    title: (index + 1).toString(),
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Transfer',
                  ),
                  MyTableItemWidget(
                    width: 116,
                    title: '6703010',
                  ),
                  MyTableItemWidget(
                    width: 140,
                    title: '6703005-1000020002-1',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Customer',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Normal',
                  ),
                  MyTableItemWidget(
                    width: 70,
                    title: '1',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Count base',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '8',
                  ),
                  MyTableItemWidget(
                    width: 90,
                    title: '100',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '9,000,000,000',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '2022-08-12',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    title: 'Austria',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    title: 'Web',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    title: 'Active',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '9617305',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    actions: ActionWidgets(
                      icon: Icons.edit,
                      iconColor: _themeProvider.primaryColor,
                      tooltipMessage: _localeProvider.edit,
                      onTap: () => setState(() {
                        _editOrNew = true;
                        if (!Responsive.isDesktop(context)) {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                      }),
                    ),
                  )
                ]),
      ),
    );
  }

  Column _searchItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BranchSelector(
            codeLabelText: _localeProvider.branchCode,
            descLabelText: _localeProvider.branchName),
        AccountNumberSelector(
            codeLabelText: _localeProvider.targetAccountNumber,
            descLabelText: _localeProvider.targetAccountName),
        const SizedBox(
          height: 4,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 12,
          children: [
            MyDropDown(
              labelText: _localeProvider.userType,
              width: 120,
            ),
            MyDropDown(
              labelText: _localeProvider.transactionType,
              width: 240,
            ),
            MyDropDown(
              labelText: _localeProvider.walletType,
              width: 170,
            ),
            MyDropDown(
              labelText: _localeProvider.status,
              width: 80,
            ),
            MyTextFormField(
              labelText: _localeProvider.userGroup,
              width: 80,
            ),
            MyDropDown(
              labelText: _localeProvider.commisionType,
              width: 140,
            ),
            MyTextFormField(
              labelText: _localeProvider.commisionValueFrom,
              width: 200,
            ),
            MyTextFormField(
              labelText: _localeProvider.commisionValueTo,
              width: 200,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyButton(onPressed: () {}, title: _localeProvider.search),
            MyButton(
              onPressed: () {},
              title: _localeProvider.clearSearch,
              backgroundColor: _themeProvider.yellowColor,
            ),
          ],
        ),
      ],
    );
  }
}
