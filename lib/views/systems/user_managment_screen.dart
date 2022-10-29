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
import 'package:wallet_core_managment/views/my_widgets/customer_selector.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

import '../../models/tree_test_model.dart';
import '../my_widgets/my_check_box_title.dart';
import '../my_widgets/topic_selector.dart';
import '../my_widgets/tree_view/tree_group_widget.dart';

class UserManagmentScreen extends StatefulWidget {
  const UserManagmentScreen({super.key});

  static const route = '/user-managment';

  @override
  State<UserManagmentScreen> createState() => _UserManagmentScreenState();
}

class _UserManagmentScreenState extends State<UserManagmentScreen> {
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
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 26,
                              ))
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
            visible: false,
            child: SizedBox(
              height: 100.h() - 130,
              child: SingleChildScrollView(
                child: BoxContainer(
                  child: SizedBox(
                    height: 100.h() - 130,
                  ),
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
              height: 60.h(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(visible: false, child: BoxContainer(child: Container()))
        ],
      ),
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
            MyButton(onPressed: () {}, title: _localeProvider.search)
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
            child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _themeProvider.boxColor1,
                    ),
                    child: Row(
                      children: [
                        
                        SizedBox(
                          width: 120,
                          child: Text(
                            _localeProvider.employeeCode,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _themeProvider.fontColor3,
                                fontFamily: _localeProvider.boldFontFamily),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            _localeProvider.employeeName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _themeProvider.fontColor3,
                                fontFamily: _localeProvider.boldFontFamily),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            _localeProvider.branchName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _themeProvider.fontColor3,
                                fontFamily: _localeProvider.boldFontFamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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
