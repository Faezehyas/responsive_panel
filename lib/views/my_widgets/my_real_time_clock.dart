import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  RealTimeClockState createState() => RealTimeClockState();
}

class RealTimeClockState extends State<RealTimeClock> {
  String? _timeString;

  @override
  void initState() {
    if (mounted) {
      _timeString = _formatDateTime(DateTime.now());
      Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    }
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(_timeString ?? '');
  }
}
