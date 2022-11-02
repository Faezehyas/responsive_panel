import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/utils/const.dart';
import 'package:wallet_core_management/utils/my_navigator.dart';
import 'package:wallet_core_management/views/customers/insert_real_customers_screen.dart';
import 'package:wallet_core_management/views/dashboard/dashboard_screen.dart';
import 'package:wallet_core_management/views/side_menu/side_menu_title_widget.dart';
import 'package:wallet_core_management/views/side_menu/sub_menu_title_widget.dart';
import 'package:wallet_core_management/views/systems/branch_management_screen.dart';
import 'package:wallet_core_management/views/systems/commision_setting_screen.dart';
import 'package:wallet_core_management/views/systems/transaction_limitation_screen.dart';
import 'package:wallet_core_management/views/systems/wallet_types_screen.dart';
import 'package:wallet_core_management/views/wallets/customers_wallet_management_screen.dart';
import 'package:wallet_core_management/views/wallets/group_settlement_screen.dart';
import 'package:wallet_core_management/views/wallets/transfer_screen.dart';

import '../systems/accounting_topics_managment_screen.dart';
import '../systems/user_managment_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  ThemeProvider _themeProvider = ThemeProvider();
  LocaleProvider _localeProvider = LocaleProvider();
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      _themeProvider = themeProvider;
      _localeProvider = localeProvider;
      return Drawer(
        width: 280,
        backgroundColor: themeProvider.boxColor1,
        child: Column(
          children: [
            _drawerHeader(),
            const SizedBox(height: 30),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                _dashBoardBtn(context, localeProvider),
                _systemMenu,
                _customersMenu,
                _walletsMenu,
                _accountingMenu,
                _reportsMenu,
                _toolsMenu,
              ],
            ))
          ],
        ),
      );
    });
  }

  ExpansionTile _dashBoardBtn(
      BuildContext context, LocaleProvider localeProvider) {
    return ExpansionTile(
      trailing: const SizedBox(),
      collapsedIconColor: _themeProvider.fontColor3,
      iconColor: _themeProvider.secondryColor,
      title: InkWell(
        splashColor: Colors.white.withOpacity(0),
        highlightColor: Colors.white.withOpacity(0),
        hoverColor: Colors.white.withOpacity(0),
        onTap: () {
          MyNavigator.pushNamed(context, DashboardScreen.route);
        },
        child: SideMenuTitleWidget(
          icon: Icon(
            Icons.dashboard,
            color: _themeProvider.fontColor3,
          ),
          title: localeProvider.dashboard,
        ),
      ),
    );
  }

  Stack _drawerHeader() {
    return Stack(
      children: [
        Image.asset(
          '${imageAsset}banner.jpg',
          height: 100,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   _customerExpanded = true;
                    // });
                  },
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: _themeProvider.boxColor1,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('${imageAsset}avatar.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                  color: _themeProvider.fontColor3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              _localeProvider.financialManager,
                              style: TextStyle(
                                fontFamily: _localeProvider.regularFontFamily,
                                color: _themeProvider.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget get _toolsMenu => Builder(
        builder: (context) {
          var title = _localeProvider.tools;
          final subtitles = _toolsSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.settings,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: subtitles[index],
                routeTo: _toolsRoutes[index],
              ),
            ),
          );
        },
      );

  Widget get _reportsMenu => Builder(
        builder: (context) {
          var title = _localeProvider.reporting;
          final _subtitles = _reportingSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.list_alt_outlined,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              _subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: _subtitles[index],
                routeTo: _reportingRoutes[index],
              ),
            ),
          );
        },
      );

  Widget get _accountingMenu => Builder(
        builder: (context) {
          var title = _localeProvider.accounting;
          final subtitles = _accountingSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.account_balance_rounded,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: subtitles[index],
                routeTo: _accountingRoutes[index],
              ),
            ),
          );
        },
      );

  Widget get _walletsMenu => Builder(
        builder: (context) {
          var title = _localeProvider.wallet;
          final subtitles = _walletSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.account_balance_wallet,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: subtitles[index],
                routeTo: _walletRoutes[index],
              ),
            ),
          );
        },
      );

  Widget get _customersMenu => Builder(
        builder: (context) {
          var title = _localeProvider.customers;
          final subtitles = _customersSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            initiallyExpanded: false,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.people_alt_rounded,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: subtitles[index],
                routeTo: _customersRoutes[index],
              ),
            ),
          );
        },
      );

  Widget get _systemMenu => Builder(
        builder: (context) {
          var title = _localeProvider.system;
          final subtitles = _systemSubtitles;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.computer,
                color: _themeProvider.fontColor3,
              ),
              title: title,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                subtitle: subtitles[index],
                routeTo: _systemRoutes[index],
              ),
            ),
          );
        },
      );

  List<String> get _systemRoutes => [
        WalletTypesScreen.route,
        UserManagementScreen.route,
        AccountingTopicsManagementScreen.route,
        TransactionLimitationScreen.route,
        CommisionSettingScreen.route,
        BranchManagementScreen.route,
      ];

  List<String> get _systemSubtitles => [
        _localeProvider.walletTypes,
        _localeProvider.userManagement,
        _localeProvider.accountingTopicsManagement,
        _localeProvider.transactionLimitation,
        _localeProvider.commisionSetting,
        _localeProvider.branchManagement,
      ];

  List<String> get _customersRoutes => [
        InsertRealCustomersScreen.route,
        '',
        '',
        '',
      ];

  List<String> get _customersSubtitles => [
        _localeProvider.insertRealCustomers,
        _localeProvider.insertLegalCustomers,
        _localeProvider.customersManagement,
        _localeProvider.customersEvaluation,
      ];

  List<String> get _walletRoutes => [
        CustomersWalletManagement.route,
        TransferSceen.route,
        GroupSettlementScreen.route,
      ];

  List<String> get _walletSubtitles => [
        _localeProvider.customersWalletManagement,
        _localeProvider.transfer,
        _localeProvider.groupSettlement
      ];

  List<String> get _accountingRoutes => [
        '',
        '',
        '',
      ];

  List<String> get _accountingSubtitles => [
        _localeProvider.createAccount,
        _localeProvider.accountManagement,
        _localeProvider.writsManagement,
      ];

  List<String> get _reportingRoutes => [
        '',
        '',
        '',
        '',
        '',
        '',
      ];

  List<String> get _reportingSubtitles => [
        _localeProvider.ledgerBalance,
        _localeProvider.customersReport,
        _localeProvider.customersWalletsReport,
        _localeProvider.walletTurnoverReport,
        _localeProvider.blockingReport,
        _localeProvider.accountTurnoverReport,
      ];

  List<String> get _toolsRoutes => [
        '',
        '',
      ];

  List<String> get _toolsSubtitles => [
        _localeProvider.changePassword,
        _localeProvider.exit,
      ];
}
