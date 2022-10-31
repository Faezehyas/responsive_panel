import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/models/employee_item.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/custom_grid_delegate.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/branch_selector.dart';
import 'package:wallet_core_managment/views/my_widgets/custom_modal.dart';
import 'package:wallet_core_managment/views/my_widgets/customer_selector.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';
import 'package:wallet_core_managment/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';
import 'package:wallet_core_managment/views/my_widgets/table/my_table_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/table/table_item_widget.dart';

class UserManagmentScreen extends StatefulWidget {
  const UserManagmentScreen({super.key});

  static const route = '/user-managment';

  @override
  State<UserManagmentScreen> createState() => _UserManagmentScreenState();
}

class _UserManagmentScreenState extends State<UserManagmentScreen> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  bool _isNew = false;
  bool _isPosition = false;
  EmployeeItem? _selectedEmployee;
  TextEditingController _employeeFullNameController = TextEditingController();
  TextEditingController _employeeCodeController = TextEditingController();

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
          FormTitle(localeProvider.system, localeProvider.userManagement),
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
            visible: _isPosition || _isNew || _selectedEmployee != null,
            child: BoxContainer(
              child: SizedBox(
                height: 100.h() - 130,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: _isPosition ? _positionForm() : _editNewForm(),
                ),
              ),
            ),
          ))
    ]);
  }

  _mobile() {
    return Expanded(
      child: ListView(
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
                            onTap: () => setState(() => _isNew = true),
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
                    Expanded(
                        child: _isPosition ? _positionForm() : _searchForm())
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _isPosition || _isNew || _selectedEmployee != null,
            child: BoxContainer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: _isPosition
                    ? SizedBox(
                        height: 80.h(),
                        child: _positionForm(),
                      )
                    : _editNewForm(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _positionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              FormSubTitle(
                title: _localeProvider.position,
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            MyTextFormField(
              controller: _employeeFullNameController,
              labelText: _localeProvider.employee,
            ),
            MyTextFormField(
              controller: _employeeCodeController,
              labelText: _localeProvider.employeeCode,
              width: 110,
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyDropDown(
              labelText: _localeProvider.position,
              onChanged: ((value) {}),
            ),
            MyButton(
              onPressed: () {},
              title: _localeProvider.save,
              backgroundColor: _themeProvider.greenColor,
            ),
            MyButton(
              onPressed: () {
                setState(() {
                  _employeeCodeController.clear();
                  _employeeFullNameController.clear();
                  _isPosition = false;
                });
              },
              title: _localeProvider.cancel,
              backgroundColor: _themeProvider.yellowColor,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
            child: MyTableWidget(
          headerBackgroundColor: _themeProvider.currentThemeMode.isDark
              ? _themeProvider.fontColor1
              : _themeProvider.boxColor2,
          oddBackgrounColor: _themeProvider.currentThemeMode.isDark
              ? _themeProvider.boxColor1
              : _themeProvider.backgroundColor,
          headers: [
            MyTableItemWidget(
                width: 40,
                title: '#',
                fontColor: _themeProvider.fontColor3,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 110,
                title: _localeProvider.title,
                fontColor: _themeProvider.fontColor3,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 160,
                title: _localeProvider.description,
                fontColor: _themeProvider.fontColor3,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 60,
                title: _localeProvider.actions,
                fontColor: _themeProvider.fontColor3,
                fontFamily: _localeProvider.boldFontFamily)
          ],
          data: _positionList
              .map((e) => [
                    MyTableItemWidget(
                        width: 40, title: (e.count! + 1).toString()),
                    MyTableItemWidget(width: 110, title: e.branchName),
                    MyTableItemWidget(width: 160, title: e.employeeName),
                    MyTableItemWidget(
                        width: 60,
                        actions: ActionWidgets(
                          onTap: () =>
                              deleteDialog(context, desc: e.branchName ?? ''),
                          icon: Icons.delete,
                          iconColor: _themeProvider.orangeColor,
                          tooltipMessage: _localeProvider.delete,
                        )),
                  ])
              .toList(),
        ))
      ],
    );
  }

  Column _editNewForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              FormSubTitle(
                title: _selectedEmployee != null
                    ? _localeProvider.edit
                    : _localeProvider.neww,
              ),
            ],
          ),
        ),
        CustomerSelector(
            codeLabelText: _localeProvider.customerCode,
            descLabelText: _localeProvider.customerName),
        BranchSelector(
            codeLabelText: _localeProvider.branchCode,
            descLabelText: _localeProvider.branchName),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            MyTextFormField(
              labelText: _localeProvider.employeeName,
              width: 200,
            ),
            MyTextFormField(
              labelText: _localeProvider.employeeLastName,
              width: 200,
            ),
            MyTextFormField(
              labelText: _localeProvider.userCode,
              width: 110,
              maxLength: 8,
            ),
            MyTextFormField(
              labelText: _localeProvider.password,
              width: 160,
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            MyButton(
              onPressed: () {},
              title: _localeProvider.save,
              backgroundColor: _themeProvider.greenColor,
            ),
            MyButton(
              onPressed: () {
                setState(() {
                  _isNew = false;
                  _selectedEmployee = null;
                });
              },
              title: _localeProvider.cancel,
              backgroundColor: _themeProvider.yellowColor,
            ),
          ],
        )
      ],
    );
  }

  Column _searchForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BranchSelector(
            codeLabelText: _localeProvider.branchCode,
            descLabelText: _localeProvider.branchName),
        CustomerSelector(
            codeLabelText: _localeProvider.customerCode,
            descLabelText: _localeProvider.customerName),
        const SizedBox(
          height: 4,
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyTextFormField(
              width: 180,
              labelText: _localeProvider.userCode,
              textDirection: _localeProvider.textDirection,
            ),
            MyButton(onPressed: () {}, title: _localeProvider.search),
            MyButton(
              onPressed: () {},
              width: !_localeProvider.currentLocaleMode.isEn ? 120 : null,
              title: _localeProvider.clearSearch,
              backgroundColor: _themeProvider.yellowColor,
            )
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
                width: 110,
                title: _localeProvider.employeeCode,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 160,
                title: _localeProvider.employeeName,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 160,
                title: _localeProvider.branchName,
                fontFamily: _localeProvider.boldFontFamily),
            MyTableItemWidget(
                width: 100,
                title: _localeProvider.actions,
                fontFamily: _localeProvider.boldFontFamily)
          ],
          data: _emplyeeList
              .map((e) => [
                    MyTableItemWidget(
                        width: 40, title: (e.count! + 1).toString()),
                    MyTableItemWidget(width: 110, title: e.employeeCode),
                    MyTableItemWidget(width: 160, title: e.employeeName),
                    MyTableItemWidget(width: 160, title: e.branchName),
                    MyTableItemWidget(
                        width: 100,
                        actions: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ActionWidgets(
                              icon: Icons.edit,
                              iconColor: _themeProvider.primaryColor,
                              tooltipMessage: _localeProvider.edit,
                              onTap: () =>
                                  setState(() => _selectedEmployee = e),
                            ),
                            ActionWidgets(
                              onTap: () => deleteDialog(context,
                                  desc: e.employeeName ?? ''),
                              icon: Icons.delete,
                              iconColor: _themeProvider.orangeColor,
                              tooltipMessage: _localeProvider.delete,
                            ),
                            ActionWidgets(
                              onTap: () {
                                setState(() {
                                  _isPosition = true;
                                  _employeeFullNameController.text =
                                      e.employeeName ?? '';
                                  _employeeCodeController.text =
                                      e.employeeCode ?? '';
                                });
                              },
                              icon: Icons.admin_panel_settings_sharp,
                              iconColor: _themeProvider.primaryColor,
                              tooltipMessage: _localeProvider.position,
                            )
                          ],
                        )),
                  ])
              .toList(),
        ))
      ],
    );
  }
}

List<EmployeeItem> _emplyeeList = List.generate(
    50,
    (index) => EmployeeItem(
        count: index,
        branchName: 'Sep',
        employeeName: 'keyvan akbarpour',
        employeeCode: '25611289'));

List<EmployeeItem> _positionList = List.generate(
    20,
    (index) => EmployeeItem(
          count: index,
          branchName: 'Admin',
          employeeName: 'Full controll access',
        ));
