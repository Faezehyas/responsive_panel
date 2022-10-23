import 'package:corebancking_backoffice/providers/locale_provider.dart';
import 'package:corebancking_backoffice/providers/theme_provider.dart';
import 'package:corebancking_backoffice/utils/const.dart';
import 'package:corebancking_backoffice/utils/responsive.dart';
import 'package:corebancking_backoffice/views/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  Widget? child;
  bool? isFullScreen;
  MainScreen({this.child, this.isFullScreen});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return SafeArea(
        child: SelectionArea(
          child: Responsive(
            mobile: _tabletAndMobile(themeProvider, context),
            tablet: _tabletAndMobile(themeProvider, context),
            desktop: _desktop(themeProvider, context),
          ),
        ),
      );
    });
  }

  Scaffold _tabletAndMobile(ThemeProvider themeProvider, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        leading: Builder(
          builder: (BuildContext context) {
            return SvgPicture.asset(
              iconAsset + 'ic_menu.svg',
              color: themeProvider.primaryColor,
              width: 24,
            );
          },
        ),
      ),
      drawer: SideMenu(),
      body: Container(
        height: Responsive.height(context),
        width: Responsive.width(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imageAsset + 'dashboard_bg.jpg'),
            opacity: 0.2,
          ),
        ),
        child: widget.child,
      ),
    );
  }

  Row _desktop(ThemeProvider themeProvider, BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: SideMenu()),
        Expanded(
          flex: 11,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: themeProvider.backgroundColor,
            ),
            body: Container(
              height: Responsive.height(context),
              width: Responsive.width(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageAsset + 'dashboard_bg.jpg'),
                  opacity: 0.2,
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
