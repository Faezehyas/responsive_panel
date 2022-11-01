import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';
import 'package:wallet_core_management/providers/theme_provider.dart';
import 'package:wallet_core_management/utils/my_navigator.dart';
import 'package:wallet_core_management/views/my_widgets/my_button.dart';

class ActionWidgets extends StatelessWidget {
  bool enable;
  IconData icon;
  EdgeInsetsGeometry? padding;
  String? tooltipMessage;
  Color iconColor;
  double? iconSize;
  Function()? onTap;
  ActionWidgets({
    this.enable = true,
    this.padding,
    this.tooltipMessage,
    required this.icon,
    this.iconColor = Colors.grey,
    this.iconSize,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(2),
      child: Tooltip(
        message: tooltipMessage,
        decoration: BoxDecoration(
            color: context.read<ThemeProvider>().fontColor3,
            borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
            fontFamily: context.read<LocaleProvider>().regularFontFamily,
            color: context.read<ThemeProvider>().boxColor3),
        child: InkWell(
          onTap: enable ? onTap : null,
          mouseCursor: SystemMouseCursors.click,
          child: Icon(
            icon,
            color: enable ? iconColor : Colors.grey,
            size: iconSize ?? 20,
          ),
        ),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? margin;
  BoxContainer({
    required this.child,
    this.margin,
    Key? key,
    height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        margin: margin,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: themeProvider.boxColor3,
            borderRadius: BorderRadius.circular(8)),
        child: child,
      );
    });
  }
}

class GroupBoxContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  String title;
  GroupBoxContainer({
    required this.title,
    required this.child,
    this.margin,
    this.padding,
    Key? key,
    height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Stack(
        children: [
          Container(
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
                border: Border.all(color: themeProvider.primaryColor),
                borderRadius: BorderRadius.circular(8)),
            child: child,
          ),
          Positioned.directional(
            top: 6,
            start: 8,
            textDirection: localeProvider.textDirection,
            child: Container(
            color: themeProvider.boxColor3,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                    color: themeProvider.fontColor3,
                    fontFamily: localeProvider.boldFontFamily,
                    fontSize: 12),
              ),
            ),
          )
        ],
      );
    });
  }
}

class FormSubTitle extends StatelessWidget {
  const FormSubTitle({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Text(
        _title,
        style: TextStyle(
            fontFamily: localeProvider.boldFontFamily,
            color: themeProvider.fontColor3),
      );
    });
  }
}

class FormTitle extends StatelessWidget {
  FormTitle(
    this.title,
    this.subTitle, {
    Key? key,
  }) : super(key: key);

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: localeProvider.boldFontFamily,
                  color: themeProvider.primaryColor,
                  height: 1,
                  fontSize: 18),
            ),
            if (subTitle.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: themeProvider.fontColor3,
                  size: 16,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontFamily: localeProvider.regularFontFamily,
                    color: themeProvider.fontColor3),
              ),
            ]
          ],
        ),
      );
    });
  }
}

class NewCircleBtn extends StatelessWidget {
  void Function()? onTap;
  NewCircleBtn({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            color: context.read<ThemeProvider>().secondryColor,
            shape: BoxShape.circle),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
