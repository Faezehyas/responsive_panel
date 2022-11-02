import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/utils/extension.dart';
import 'package:wallet_core_management/views/my_widgets/branch_selector.dart';
import 'package:wallet_core_management/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_management/views/my_widgets/topic_selector.dart';

import '../../models/employee_item.dart';
import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/responsive.dart';
import '../my_widgets/custom_modal.dart';
import '../my_widgets/table/my_table_widget.dart';
import '../my_widgets/table/table_item_widget.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key});

  static const route = '/account-management';

  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  bool _isNew = false;
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
              localeProvider.accounting, localeProvider.accountManagement),
          !Responsive.isMobile(context) ? _tabletAndDesktop() : _mobile()
        ],
      );
    });
  }

  Row _tabletAndDesktop() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 1,
          child: BoxContainer(
            child: SizedBox(
              height: 100.h() - 130,
              child: Padding(
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
                            onTap: () => setState(() => _isNew = true),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: _searchForm())
                  ],
                ),
              ),
            ),
          )),
      const SizedBox(
        width: 16,
      ),
      Expanded(
          flex: 1,
          child: Visibility(
            visible: _isNew,
            child: BoxContainer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Column(
                  children: [
                    _editNewForm(),
                  ],
                ),
              ),
            ),
          ))
    ]);
  }

  _mobile() {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        children: [
          BoxContainer(
            child: SizedBox(
              height: 80.h(),
              child: Padding(
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
                          InkWell(
                            onTap: () => setState(() {
                              _isNew = true;
                              if (Responsive.isMobile(context)) {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                              }
                            }),
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: _themeProvider.secondryColor,
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: _searchForm())
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _isNew,
            child: BoxContainer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: _editNewForm(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _editNewForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormSubTitle(
          title: _localeProvider.newOrEdit,
        ),
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
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            MyButton(
                onPressed: () {},
                title: _localeProvider.save,
                backgroundColor: _themeProvider.greenColor),
            MyButton(
                onPressed: () {
                  setState(() {
                    _isNew = false;
                  });
                },
                title: _localeProvider.cancel,
                backgroundColor: _themeProvider.yellowColor)
          ],
        ),
      ],
    );
  }

  _searchForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BranchSelector(),
        TopicSelector(),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyTextFormField(
              labelText: _localeProvider.accountName,
            ),
            MyButton(onPressed: () {}, title: _localeProvider.search)
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: MyTableWidget(
            headers: [
              MyTableItemWidget(
                  width: 40,
                  title: '#',
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 100,
                  title: _localeProvider.branchName,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 120,
                  title: _localeProvider.topicName,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 120,
                  title: _localeProvider.accountNumber,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 120,
                  title: _localeProvider.accountName,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 80,
                  title: _localeProvider.actions,
                  fontFamily: _localeProvider.boldFontFamily),
            ],
            data: _emplyeeList
                .map((e) => [
                      MyTableItemWidget(
                          width: 40, title: (e.count! + 1).toString()),
                      MyTableItemWidget(width: 100, title: e.branchName),
                      MyTableItemWidget(width: 120, title: e.employeeName),
                      MyTableItemWidget(width: 120, title: e.employeeCode),
                      MyTableItemWidget(
                          width: 120, title: 'Account title lorem lorem'),
                      MyTableItemWidget(
                          width: 80,
                          actions: Center(
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ActionWidgets(
                                  icon: Icons.edit,
                                  iconColor: _themeProvider.primaryColor,
                                  tooltipMessage: _localeProvider.edit,
                                  onTap: () => setState(() {
                                    _isNew = true;
                                    if (Responsive.isMobile(context)) {
                                      _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        curve: Curves.easeOut,
                                        duration:
                                            const Duration(milliseconds: 300),
                                      );
                                    }
                                  }),
                                ),
                                ActionWidgets(
                                  onTap: () => deleteDialog(context,
                                      desc: e.employeeName ?? ''),
                                  icon: Icons.delete,
                                  iconColor: _themeProvider.orangeColor,
                                  tooltipMessage: _localeProvider.delete,
                                ),
                              ],
                            ),
                          )),
                    ])
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<EmployeeItem> _emplyeeList = List.generate(
    10,
    (index) => EmployeeItem(
        count: index,
        branchName: 'Austria',
        employeeName: 'Costs',
        employeeCode: '6703005-100002000-01'));
