import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/utils/extension.dart';
import 'package:wallet_core_management/utils/responsive.dart';
import 'package:wallet_core_management/views/my_widgets/amount_widget.dart';
import 'package:wallet_core_management/views/my_widgets/branch_selector.dart';
import 'package:wallet_core_management/views/my_widgets/customer_selector.dart';
import 'package:wallet_core_management/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_management/views/my_widgets/my_drop_down.dart';
import 'package:wallet_core_management/views/my_widgets/wallet_number_selector.dart';

import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../my_widgets/my_button.dart';
import '../my_widgets/my_text_form_field.dart';
import '../my_widgets/table/my_table_widget.dart';
import '../my_widgets/table/table_item_widget.dart';

enum BlockType { Block, Unblock, None }

class CustomersWalletManagement extends StatefulWidget {
  const CustomersWalletManagement({super.key});

  static const route = '/customers-wallet-management';

  @override
  State<CustomersWalletManagement> createState() =>
      _CustomersWalletManagementState();
}

class _CustomersWalletManagementState extends State<CustomersWalletManagement> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();
  bool _isNew = false;
  ScrollController _scrollController = ScrollController();
  BlockType _blockType = BlockType.None;

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
              localeProvider.wallet, localeProvider.customersWalletManagement),
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          FormSubTitle(
                            title: _localeProvider.search,
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
          flex: 2,
          child: Visibility(
            visible: _isNew || _blockType != BlockType.None,
            child: BoxContainer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: _blockType != BlockType.None
                    ? _blockUnblockForm()
                    : _editNewForm(),
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
                        children: [
                          FormSubTitle(
                            title: _localeProvider.listOfBranchs,
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
            visible: _isNew || _blockType != BlockType.None,
            child: BoxContainer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: _blockType != BlockType.None
                    ? _blockUnblockForm()
                    : _editNewForm(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _blockUnblockForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              FormSubTitle(
                title: _blockType == BlockType.Block
                    ? _localeProvider.block
                    : _localeProvider.unblock,
              ),
            ],
          ),
        ),
        WalletNumberSelector(
            codeLabelText: _localeProvider.walletNumber,
            descLabelText: _localeProvider.walletName),
        const SizedBox(
          height: 4,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.start,
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
            ),
            AmountWidget(
              width: 200,
              withWord: true,
              labelText: _blockType == BlockType.Block
                  ? _localeProvider.blockAmount
                  : _localeProvider.unblockAmount,
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        MyTextFormField(
          labelText: _localeProvider.reason,
          maxLine: 2,
          width: double.maxFinite,
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
              onPressed: () => setState(() {
                _blockType = BlockType.None;
                if (Responsive.isMobile(context)) {
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                }
              }),
              title: _localeProvider.cancel,
              backgroundColor: _themeProvider.yellowColor,
            ),
          ],
        )
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
                title: _localeProvider.showOrEdit,
              ),
            ],
          ),
        ),
        WalletNumberSelector(
            codeLabelText: _localeProvider.walletNumber,
            descLabelText: _localeProvider.walletName),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MyTextFormField(
              width: 80,
              labelText: _localeProvider.userGroup,
            ),
            MyDropDown(
              labelText: _localeProvider.status,
              width: 100,
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
              onPressed: () => setState(() {
                _isNew = false;
                if (Responsive.isMobile(context)) {
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                }
              }),
              title: _localeProvider.cancel,
              backgroundColor: _themeProvider.yellowColor,
            ),
          ],
        )
      ],
    );
  }

  _searchForm() {
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
          height: 8,
        ),
        MyButton(onPressed: () {}, title: _localeProvider.search),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: MyTableWidget(
            headers: [
              MyTableItemWidget(
                  width: 40,
                  title: '#',
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 140,
                  title: _localeProvider.walletNumber,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 180,
                  title: _localeProvider.walletName,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 120,
                  title: _localeProvider.customerType,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 100,
                  title: _localeProvider.registerDate,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 90,
                  title: _localeProvider.userGroup,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                  width: 80,
                  title: _localeProvider.status,
                  fontFamily: _localeProvider.boldFontFamily),
              MyTableItemWidget(
                width: 100,
                title: _localeProvider.actions,
                fontFamily: _localeProvider.boldFontFamily,
              ),
            ],
            data: List.generate(
                20,
                (index) => [
                      MyTableItemWidget(
                          width: 40, title: (index + 1).toString()),
                      MyTableItemWidget(
                          width: 140, title: '6703005-01-9617305-01'),
                      MyTableItemWidget(
                          width: 180,
                          title: 'Normal wallet of keyvan akbarpour'),
                      MyTableItemWidget(width: 120, title: 'Normal'),
                      MyTableItemWidget(width: 100, title: '2022-06-24'),
                      MyTableItemWidget(width: 90, title: '2'),
                      MyTableItemWidget(width: 80, title: 'Active'),
                      MyTableItemWidget(
                          width: 100,
                          actions: Center(
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ActionWidgets(
                                  icon: Icons.edit,
                                  iconColor: _themeProvider.primaryColor,
                                  tooltipMessage: _localeProvider.showOrEdit,
                                  onTap: () => setState(() {
                                    _blockType = BlockType.None;
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
                                  icon: Icons.remove_circle_outline_rounded,
                                  iconColor: _themeProvider.orangeColor,
                                  tooltipMessage: _localeProvider.block,
                                  onTap: () => setState(() {
                                    _isNew = false;
                                    _blockType = BlockType.Block;
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
                                  icon: Icons.add_circle_outline_rounded,
                                  iconColor: _themeProvider.greenColor,
                                  tooltipMessage: _localeProvider.unblock,
                                  onTap: () => setState(() {
                                    _isNew = false;
                                    _blockType = BlockType.Unblock;
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
                              ],
                            ),
                          )),
                    ]).toList(),
          ),
        ),
      ],
    );
  }
}
