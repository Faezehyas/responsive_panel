import 'package:flutter/material.dart';

final MediaQueryData media =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window);

bool isPhoneNumber(String phoneNumber) {
  return RegExp(r'^(0)?\d{10}$').hasMatch(phoneNumber);
}