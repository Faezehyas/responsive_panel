import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/utils/const.dart';
import 'package:wallet_core_managment/views/my_widgets/side_menu_title_widget.dart';
import 'package:wallet_core_managment/views/my_widgets/sub_menu_title_widget.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  ThemeProvider _themeProvider = ThemeProvider();
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      _themeProvider = themeProvider;
      return Drawer(
        width: 280,
        backgroundColor: themeProvider.backgroundColor,
        child: Column(
          children: [
            _drawerHeader(themeProvider),
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

  Stack _drawerHeader(ThemeProvider themeProvider) {
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
                    backgroundColor: themeProvider.boxColor1,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('${imageAsset}avatar.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                            color: themeProvider.fontColor3,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Financial manager',
                        style: TextStyle(
                          color: themeProvider.primaryColor,
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
          const title = 'Tools';
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
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _reportsMenu => Builder(
        builder: (context) {
          const title = 'Reporting';
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
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _accountingMenu => Builder(
        builder: (context) {
          const title = 'Accounting';
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
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _depoistsMenu => Builder(
        builder: (context) {
          const title = 'Deposit';
          final subtitles = _depositSubtitles;
          final routes = _depositRoutes;
          return ExpansionTile(
            collapsedIconColor: _themeProvider.fontColor3,
            iconColor: _themeProvider.secondryColor,
            title: SideMenuTitleWidget(
              icon: Icon(
                Icons.account_balance_wallet,
                color: _themeProvider.fontColor3,
              ),
              title: title,
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  // bool _customerExpanded = false;

  Widget get _customersMenu => Builder(
        builder: (context) {
          const title = 'Customers';
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
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
                routeTo: routes[index],
              ),
            ),
          );
        },
      );

  Widget get _systemMenu => Builder(
        builder: (context) {
          const title = 'System';
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
              themeProvider: _themeProvider,
            ),
            children: List.generate(
              subtitles.length,
              (index) => SubMenuTitleWidget(
                title: title,
                subtitle: subtitles[index],
                themeProvider: _themeProvider,
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
        'Deposit types',
        'User managment',
        'Special topics managment',
        'Accounting topics managment',
        'Transaction linmition',
        'Commision setting',
        'Branch managment',
      ];

  List<Widget> get _customersRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _customersSubtitles => [
        'Insert real customers',
        'Insert legal customers',
        'Edit customers',
        'Customer search',
        'Customer evaluation',
        'Customer activation',
        'Message',
      ];

  List<Widget> get _depositRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _depositSubtitles => [
        'Create deposit',
        'Edit depoosit',
        'Closing deposit',
        'Deposit search',
        'Deposit activation',
        'Blocking deposit',
        'Unblocking deposit',
        'Unblocking deposit',
        'Settlement to deposit',
        'Withdrow from deposit',
        'Scheduled settlement',
        'Group settlement',
      ];

  List<Widget> get _accountingRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _accountingSubtitles => [
        'End of day',
        'Create account',
        'Edit account',
        'Delete account',
        'Search account',
        'Move to new year',
        'Profit and loss calculation',
        'Writ managment',
        'Fund managment',
        'Banks account managment',
        'Writ issuance',
        'Edit Writ',
        'Return writ',
      ];

  List<Widget> get _reportingRoutes => [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _reportingSubtitles => [
        'Ledger balance',
        'Customers report',
        'Customer blacklist report',
        'Deposit reoprt',
        'Deposit turnover report',
        'Stockade report',
        'Scheduled report',
        'Writ detail report',
      ];

  List<Widget> get _toolsRoutes => [
        Container(),
        Container(),
        Container(),
      ];

  List<String> get _toolsSubtitles => [
        'Start working day',
        'Change password',
        'Exis from app',
      ];
}
