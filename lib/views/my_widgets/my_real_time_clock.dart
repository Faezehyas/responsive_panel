import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/enums.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:wallet_core_managment/utils/responsive.dart';

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  RealTimeClockState createState() => RealTimeClockState();
}

class RealTimeClockState extends State<RealTimeClock> {
  String? _timeString;
  String? _dateString;

  LocaleProvider _localeProvider = LocaleProvider();

  @override
  void initState() {
    _localeProvider = context.read<LocaleProvider>();
    if (mounted) {
      _timeString = _localeProvider.formatTime(DateTime.now());
      _dateString = _localeProvider.formatDate(DateTime.now());
      Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    }
    super.initState();
  }

  void _getTime() {
    if (mounted) {
      final DateTime now = DateTime.now();
      final String formattedTime = _localeProvider.formatTime(now);
      final String formattedDate = _localeProvider.formatDate(now);
      setState(() {
        _timeString = formattedTime;
        _dateString = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      _localeProvider = localeProvider;
      return Row(
        children: [
          Text(
            _dateString ?? '',
            textAlign: localeProvider.textAlign,
            style: TextStyle(fontFamily: localeProvider.regularFontFamily,
            color: themeProvider.fontColor3),
          ),
          const SizedBox(
            width: 4,
          ),
          if(!Responsive.isMobile(context))
          SizedBox(
            width: 75,
            child: Text(
              ' ${_timeString ?? ''}',
              textAlign: localeProvider.textAlign,
              style: TextStyle(fontFamily: localeProvider.regularFontFamily,
              color: themeProvider.fontColor3),
            ),
          ),
        ],
      );
    });
  }
}
