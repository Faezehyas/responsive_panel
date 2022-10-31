import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/custom_grid_delegate.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

import '../../models/tree_test_model.dart';
import '../my_widgets/custom_modal.dart';
import '../my_widgets/my_check_box_title.dart';
import '../my_widgets/topic_selector.dart';
import '../my_widgets/tree_view/tree_group_widget.dart';

class WalletTypesScreen extends StatefulWidget {
  const WalletTypesScreen({super.key});

  static const route = '/wallet-types';

  @override
  State<WalletTypesScreen> createState() => _WalletTypesScreenState();
}

class _WalletTypesScreenState extends State<WalletTypesScreen> {
  TreeTestModel? _selectedTreeModel;
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  final TextEditingController _walletGroupController = TextEditingController();
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _walletTitleController = TextEditingController();
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
          FormTitle(localeProvider.system, localeProvider.walletTypes),
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
            child: SizedBox(
              height: 100.h() - 130,
              child: SingleChildScrollView(
                child: BoxContainer(
                  child: _secondForm(),
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
              child: _firstForm(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
              visible:
                  _selectedTreeModel != null && (_isEditMode || _isShowMode),
              child: BoxContainer(child: _secondForm()))
        ],
      ),
    );
  }

  Column _firstForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FormSubTitle(
              title: _localeProvider.listOfAvailableWalletTypes,
            ),
          ],
        ),
        _treeView(_themeProvider),
        _firstFormBtns()
      ],
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
                title: _localeProvider.showOrEdit,
              ),
            ),
            ..._walletTitlesDetails,
            const SizedBox(
              height: 12,
            ),
            TopicSelector(
              codeLabelText: _localeProvider.mainTopicCode,
              descLabelText: _localeProvider.mainTopicTitle,
            ),
            TopicSelector(
              codeLabelText: _localeProvider.policeTopicCode,
              descLabelText: _localeProvider.policeTopicTitle,
            ),
            TopicSelector(
              codeLabelText: _localeProvider.lotteryTopicCode,
              descLabelText: _localeProvider.lotteryTopicTitle,
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: 180,
                  child: MyTextFormField(
                    labelText: _localeProvider.walletCreationStartDate,
                    textDirection: _localeProvider.textDirection,
                    suffixIcon: IconTheme(
                      data: IconThemeData(color: _themeProvider.primaryColor),
                      child: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: MyTextFormField(
                    labelText: _localeProvider.walletCreationEndDate,
                    textDirection: _localeProvider.textDirection,
                    suffixIcon: IconTheme(
                      data: IconThemeData(color: _themeProvider.primaryColor),
                      child: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: AmountWidget(
                    labelText: _localeProvider.walletCreationMinAmount,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: AmountWidget(
                    labelText: _localeProvider.walletMinBalance,
                  ),
                ),
                MyCheckBoxTitle(
                  label: _localeProvider.withdrawWithCard,
                  width: _localeProvider.currentLocaleMode.isEn ? 250 : 170,
                ),
                MyCheckBoxTitle(
                  label: _localeProvider.creditPermission,
                  width: _localeProvider.currentLocaleMode.isEn ? 200 : 140,
                ),
                MyCheckBoxTitle(
                  label: _localeProvider.withdrawPermission,
                  width: _localeProvider.currentLocaleMode.isEn ? 220 : 150,
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

  List<Widget> get _walletTitlesDetails {
    return [
      GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            mainAxisSpacing: Responsive.isMobile(context) ? 16 : 0,
            crossAxisSpacing: Responsive.isMobile(context) ? 0 : 16,
            crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
            height: 40),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          MyTextFormField(
            labelText: _localeProvider.walletGroup,
            readOnly: true,
            controller: _walletGroupController,
          ),
          MyTextFormField(
            labelText: _localeProvider.walletName,
            controller: _walletNameController,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: MyTextFormField(
          labelText: _localeProvider.walletTitle,
          readOnly: true,
          width: double.infinity,
          controller: _walletTitleController,
        ),
      )
    ];
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

  Expanded _treeView(ThemeProvider themeProvider) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: TreeGroupWidget<TreeTestModel>(
            items: _testValues.toTreeItems,
            theme: themeProvider,
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
        _walletGroupController.text = _selectedTreeModel!.title;
        _walletTitleController.text = _selectedTreeModel!.title;
      }
    });
  }
}

const _testValues = [
  TreeTestModel(
    id: 1,
    title: 'Assets',
    children: [
      TreeTestModel(
        id: 6,
        title: 'Fund',
        children: [],
      ),
      TreeTestModel(
        id: 7,
        title: 'Order to cash',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 2,
    title: 'Debts',
    children: [
      TreeTestModel(
        id: 8,
        title: 'Received money for specualation',
        children: [],
      ),
      TreeTestModel(
        id: 9,
        title: 'Accounts payable of prize wheel',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 3,
    title: 'Costs',
    children: [
      TreeTestModel(
        id: 10,
        title: 'Offered rewards',
        children: [],
      ),
      TreeTestModel(
        id: 11,
        title: 'Other rewards',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 4,
    title: 'Income',
    children: [
      TreeTestModel(
        id: 12,
        title: 'Issuing income',
        children: [],
      ),
      TreeTestModel(
        id: 13,
        title: 'Prize wheel',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 5,
    title: 'Dual',
    children: [
      TreeTestModel(
        id: 14,
        title: 'Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 15,
        title: 'Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 16,
        title: 'Center account',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 6,
    title: 'Dual',
    children: [
      TreeTestModel(
        id: 17,
        title: 'Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 18,
        title: 'Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 19,
        title: 'Center account',
        children: [],
      ),
    ],
  ),
  TreeTestModel(
    id: 7,
    title: 'Dual',
    children: [
      TreeTestModel(
        id: 20,
        title: 'Opening balance',
        children: [],
      ),
      TreeTestModel(
        id: 21,
        title: 'Closing balance',
        children: [],
      ),
      TreeTestModel(
        id: 22,
        title: 'Center account',
        children: [],
      ),
    ],
  )
];
