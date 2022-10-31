import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/branch_selector.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';
import 'package:wallet_core_managment/views/my_widgets/my_check_box_title.dart';
import 'package:wallet_core_managment/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_managment/views/my_widgets/table/my_table_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/table/table_item_widget.dart';

import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/responsive.dart';
import '../my_widgets/mini_widgets.dart';

class TransactionLimitationScreen extends StatefulWidget {
  const TransactionLimitationScreen({super.key});

  static const route = '/transaction-limitation';

  @override
  State<TransactionLimitationScreen> createState() =>
      _TransactionLimitationScreenState();
}

class _TransactionLimitationScreenState
    extends State<TransactionLimitationScreen> {
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
              localeProvider.system, localeProvider.transactionLimitation),
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
              height: Responsive.isMobile(context) ? 120.h() : 70.h(),
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
              title: _localeProvider.showOrEdit,
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
              codeLabelText: _localeProvider.sourceBranch, descLabelText: ''),
          BranchSelector(
              codeLabelText: _localeProvider.targetBranch, descLabelText: ''),
          const SizedBox(
            height: 16,
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
                labelText: _localeProvider.limitationType,
                width: 170,
              ),
              MyDropDown(
                labelText: _localeProvider.status,
                width: 100,
              ),
              MyDropDown(
                labelText: _localeProvider.sourceAccountType,
                width: 160,
              ),
              MyDropDown(
                labelText: _localeProvider.targetAccountType,
                width: 160,
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
                labelText: _localeProvider.transactionCountAllowed,
                width: 100,
              ),
              MyDropDown(
                labelText: _localeProvider.status,
                width: 100,
              ),
              MyCheckBoxTitle(
                label: _localeProvider.needToValidation,
                width: 200,
              ),
              AmountWidget(
                labelText: _localeProvider.minimumAmountValidation,
                width: 200,
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
              title: _localeProvider.sourceBranch,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.targetBranch,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.transactionType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.limitationType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.userType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.sourceAccountType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 120,
              title: _localeProvider.targetAccountType,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 160,
              title: _localeProvider.minimumAmountAllowed,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 160,
              title: _localeProvider.maximumAmountAllowed,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 160,
              title: _localeProvider.transactionCountAllowed,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 100,
              title: _localeProvider.userGroup,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.status,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 100,
              title: _localeProvider.needToValidation,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 160,
              title: _localeProvider.minimumAmountValidation,
              fontFamily: _localeProvider.boldFontFamily),
          MyTableItemWidget(
              width: 80,
              title: _localeProvider.actions,
              fontFamily: _localeProvider.boldFontFamily)
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
                    title: '6703005',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '6703010',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Transfer',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: 'Normal',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    title: 'Customer',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '1',
                  ),
                  MyTableItemWidget(
                    width: 120,
                    title: '2',
                  ),
                  MyTableItemWidget(
                    width: 160,
                    title: '0',
                  ),
                  MyTableItemWidget(
                    width: 160,
                    title: '9,000,000,000',
                  ),
                  MyTableItemWidget(
                    width: 160,
                    title: '100',
                  ),
                  MyTableItemWidget(
                    width: 100,
                    title: '2',
                  ),
                  MyTableItemWidget(
                    width: 80,
                    title: 'Active',
                  ),
                  MyTableItemWidget(
                    width: 100,
                    title: 'Yes',
                  ),
                  MyTableItemWidget(
                    width: 160,
                    title: '100,000',
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
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 12,
          children: [
            BranchSelector(
                width: 400,
                codeLabelText: _localeProvider.sourceBranch,
                descLabelText: ''),
            BranchSelector(
                width: 400,
                codeLabelText: _localeProvider.targetBranch,
                descLabelText: ''),
            MyDropDown(
              labelText: _localeProvider.userType,
              width: 120,
            ),
            MyDropDown(
              labelText: _localeProvider.transactionType,
              width: 240,
            ),
            MyDropDown(
              labelText: _localeProvider.limitationType,
              width: 170,
            ),
            MyDropDown(
              labelText: _localeProvider.status,
              width: 80,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyTextFormField(
              labelText: _localeProvider.userGroup,
              width: 80,
            ),
            MyCheckBoxTitle(
              label: _localeProvider.needToValidation,
              width: 200,
            ),
            AmountWidget(
              labelText: _localeProvider.minimumAmountValidation,
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
            MyButton(onPressed: () {}, title: _localeProvider.excelReport),
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
