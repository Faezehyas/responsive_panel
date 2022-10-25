import 'package:wallet_core_managment/main.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/utils/const.dart';
import 'package:wallet_core_managment/views/side_menu/side_menu_title_widget.dart';
import 'package:wallet_core_managment/views/side_menu/sub_menu_title_widget.dart';

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
        backgroundColor: themeProvider.backgroundColor,
        child: Column(
          children: [
            _drawerHeader(),
            const SizedBox(height: 30),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                _systemMenu,
                _customersMenu,
                _depoistsMenu,
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
          final routes = _toolsRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.settings,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _reportsMenu => Builder(
        builder: (context) {
          var title = _localeProvider.reporting;
          final subtitles = _reportingSubtitles;
          final routes = _reportingRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.list_alt_outlined,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _accountingMenu => Builder(
        builder: (context) {
          var title = _localeProvider.accounting;
          final subtitles = _accountingSubtitles;
          final routes = _accountingRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.account_balance_rounded,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _depoistsMenu => Builder(
        builder: (context) {
          var title = _localeProvider.wallet;
          final subtitles = _walletSubtitles;
          final routes = _walletRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.account_balance_wallet,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  // bool _customerExpanded = false;

  Widget get _customersMenu => Builder(
        builder: (context) {
          var title = _localeProvider.customers;
          final subtitles = _customersSubtitles;
          final routes = _customersRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            // initiallyExpanded: _customerExpanded,
            initiallyExpanded: false,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.people_alt_rounded,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _systemMenu => Builder(
        builder: (context) {
          var title = _localeProvider.system;
          final subtitles = _systemSubtitles;
          final routes = _systemRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.computer,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              localeProvider: _localeProvider,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                localeProvider: _localeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  List<Widget> get _systemRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _systemSubtitles => [
        _localeProvider.wallet,
        _localeProvider.userManagement,
        _localeProvider.specialTopicsManagment,
        _localeProvider.accountingTopicsManagment,
        _localeProvider.transactionLimitation,
        _localeProvider.commisionSetting,
        _localeProvider.branchManagment,
      ];

  List<Widget> get _customersRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _customersSubtitles => [
        _localeProvider.insertRealCustomers,
        _localeProvider.insertLegalCustomers,
        _localeProvider.customersManagment,
        _localeProvider.customersEvaluation,
      ];

  List<Widget> get _walletRoutes => [
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _walletSubtitles => [
        _localeProvider.customersWalletManagment,
        _localeProvider.transfer,
        _localeProvider.groupSettlement
      ];

  List<Widget> get _accountingRoutes => [
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _accountingSubtitles => [
        _localeProvider.createAccount,
        _localeProvider.accountManagment,
        _localeProvider.writsManagment,
      ];

  List<Widget> get _reportingRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _reportingSubtitles => [
        _localeProvider.ledgerBalance,
        _localeProvider.customersReport,
        _localeProvider.customersWalletsReport,
        _localeProvider.walletTurnoverReport,
        _localeProvider.blockingReport,
        _localeProvider.accountTurnoverReport,
      ];

  List<Widget> get _toolsRoutes => [
        Container(),
        Container(),
      ];

  List<String> get _toolsSubtitles => [
        _localeProvider.changePassword,
        _localeProvider.exit,
      ];
}
