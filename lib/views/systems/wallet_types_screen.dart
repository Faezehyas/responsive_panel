import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/custom_grid_delegate.dart';
import 'package:wallet_core_managment/utils/extension.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_managment/views/my_widgets/my_button.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

import '../../models/tree_test_model.dart';
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
  TextEditingController _walletGroupController = TextEditingController();
  TextEditingController _walletNameController = TextEditingController();
  TextEditingController _walletTitleController = TextEditingController();

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
    return Row(children: [
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
            visible: _selectedTreeModel != null,
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
              visible: _selectedTreeModel != null,
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
                title: _localeProvider.details,
              ),
            ),
            ..._walletTitlesDetails,
            Row(
              children: [Text(_localeProvider.mainTopicCode)],
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
              onPressed: _selectedTreeModel != null ? () {} : null,
              width: 60,
              title: _localeProvider.neww),
          MyButton(
              onPressed: _selectedTreeModel != null ? () {} : null,
              title: _localeProvider.showOrEdit),
          MyButton(
              onPressed: _selectedTreeModel != null ? () {} : null,
              width: 60,
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
      if (_selectedTreeModel == null) {
        _selectedTreeModel = item;
      } else if (_selectedTreeModel != item) {
        _selectedTreeModel = item;
      } else {
        _selectedTreeModel = null;
      }
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
