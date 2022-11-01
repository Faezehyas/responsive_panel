import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/extension.dart';
import 'package:wallet_core_management/utils/responsive.dart';
import 'package:wallet_core_management/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';
import 'package:wallet_core_management/views/my_widgets/my_check_box_title.dart';
import 'package:wallet_core_management/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_management/views/my_widgets/my_text_form_field.dart';
import '../../models/tree_test_model.dart';
import '../my_widgets/custom_modal.dart';
import '../my_widgets/tree_view/tree_group_widget.dart';

class AccountingTopicsManagementScreen extends StatefulWidget {
  const AccountingTopicsManagementScreen({super.key});

  static const route = '/accounting-topics-management';

  @override
  State<AccountingTopicsManagementScreen> createState() =>
      _AccountingTopicsManagementScreenState();
}

class _AccountingTopicsManagementScreenState
    extends State<AccountingTopicsManagementScreen> {
  TreeTestModel? _selectedTreeModel;
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  bool _isShowMode = false, _isEditMode = false;

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
              localeProvider.system, localeProvider.accountingTopicsManagement),
          !Responsive.isMobile(context) ? _tabletAndDesktop() : _mobile()
        ],
      );
    });
  }

  Row _tabletAndDesktop() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 3,
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
          flex: 4,
          child: Visibility(
            visible: _selectedTreeModel != null && (_isEditMode || _isShowMode),
            child: BoxContainer(
              child: SizedBox(
                height: 100.h() - 130,
                child: _secondForm(),
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
            child: SizedBox(height: 70.h(), child: _firstForm()),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _selectedTreeModel != null && (_isEditMode || _isShowMode),
            child: BoxContainer(
              child: _secondForm(),
            ),
          )
        ],
      ),
    );
  }

  _secondForm() => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FormSubTitle(
                title: _localeProvider.details,
              ),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyDropDown(
                  labelText: _localeProvider.mainGroup,
                  width: 200,
                ),
                SizedBox(
                  width: 360,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '${_localeProvider.essence}:',
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
                              _localeProvider.debtor,
                              style: TextStyle(
                                  fontFamily: _localeProvider.regularFontFamily,
                                  color: _themeProvider.fontColor3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        child: Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: false,
                              activeColor: _themeProvider.primaryColor,
                              onChanged: (state) {},
                            ),
                            Text(
                              _localeProvider.creditor,
                              style: TextStyle(
                                  fontFamily: _localeProvider.regularFontFamily,
                                  color: _themeProvider.fontColor3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: false,
                              activeColor: _themeProvider.primaryColor,
                              onChanged: (state) {},
                            ),
                            Text(
                              _localeProvider.dual,
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
              height: 16,
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyTextFormField(
                  labelText: _localeProvider.topicCode,
                  controller: _topicController,
                  width: 110,
                  maxLength: 10,
                ),
                MyTextFormField(
                  controller: _titleController,
                  labelText: _localeProvider.title,
                ),
                MyCheckBoxTitle(
                  label: _localeProvider.deactive,
                  width: 140,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 24, 8, 4),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  MyButton(
                      onPressed: _selectedTreeModel != null
                          ? () {
                              setState(() {
                                _isShowMode = false;
                              });
                            }
                          : null,
                      backgroundColor: _themeProvider.greenColor,
                      title: _localeProvider.save),
                  MyButton(
                      onPressed: _selectedTreeModel != null
                          ? () {
                              setState(() {
                                _isShowMode = false;
                              });
                            }
                          : null,
                      backgroundColor: _themeProvider.yellowColor,
                      title: _localeProvider.cancel),
                ],
              ),
            )
          ],
        ),
      );

  Padding _firstForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                FormSubTitle(
                  title: _localeProvider.listOfAvailableTopics,
                ),
              ],
            ),
          ),
          _treeView(),
          _firstFormBtns()
        ],
      ),
    );
  }

  Padding _firstFormBtns() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          MyButton(
              onPressed: _selectedTreeModel != null
                  ? () {
                      setState(() {
                        _isShowMode = true;
                      });
                    }
                  : null,
              title: _localeProvider.neww),
          MyButton(
              onPressed: _selectedTreeModel != null
                  ? () {
                      setState(() {
                        _isShowMode = true;
                      });
                    }
                  : null,
              title: _localeProvider.showOrEdit),
          MyButton(
              onPressed: _selectedTreeModel != null
                  ? () => deleteDialog(context, desc: _selectedTreeModel!.title)
                  : null,
              backgroundColor: _themeProvider.orangeColor,
              title: _localeProvider.delete),
        ],
      ),
    );
  }

  Expanded _treeView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: TreeGroupWidget<TreeTestModel>(
            items: _testValues.toTreeItems,
            theme: _themeProvider,
            onItemClick: _onTreeItemClick,
          ),
        ),
      ),
    );
  }

  void _onTreeItemClick(TreeTestModel item) {
    setState(() {
      _selectedTreeModel = item;
      if (_selectedTreeModel != null) {
        _topicController.text = '100001001';
        _titleController.text = _selectedTreeModel!.title;
      }
    });
  }
}

const _testValues = [
  TreeTestModel(
    id: 1,
    title: '[100001001]Assets',
    children: [
      TreeTestModel(
        id: 6,
        title: '[100001001]Fund',
        children: [],
      ),
      TreeTestModel(
        id: 7,
        title: '[100001001]Order to cash',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 2,
    title: '[100001001]Debts',
    children: [
      TreeTestModel(
        id: 8,
        title: '[100001001]Received money for specualation',
        children: [],
      ),
      TreeTestModel(
        id: 9,
        title: '[100001001]Accounts payable of prize wheel',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 3,
    title: '[100001001]Costs',
    children: [
      TreeTestModel(
        id: 10,
        title: '[100001001]Offered rewards',
        children: [],
      ),
      TreeTestModel(
        id: 11,
        title: '[100001001]Other rewards',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 4,
    title: '[100001001]Income',
    children: [
      TreeTestModel(
        id: 12,
        title: '[100001001]Issuing income',
        children: [],
      ),
      TreeTestModel(
        id: 13,
        title: '[100001001]Prize wheel',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 5,
    title: '[100001001]Dual',
    children: [
      TreeTestModel(
        id: 14,
        title: '[100001001]Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 15,
        title: '[100001001]Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 16,
        title: '[100001001]Center account',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 6,
    title: '[100001001]Dual',
    children: [
      TreeTestModel(
        id: 17,
        title: '[100001001]Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 18,
        title: '[100001001]Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 19,
        title: '[100001001]Center account',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 7,
    title: '[100001001]Dual',
    children: [
      TreeTestModel(
        id: 20,
        title: '[100001001]Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 21,
        title: '[100001001]Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 22,
        title: '[100001001]Center account',
        children: [],
      ),
    ],
  )
];
