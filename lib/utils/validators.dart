import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/utils/utils.dart';

String? nationalCodeValidator(String? value, LocaleProvider localeProvider) {
  if (value == null ||
      value.trim().isEmpty ||
      value.trim().length != 10 ||
      !value.trim().toEnglishDigit().isValidIranianNationalCode()) {
    return localeProvider.enterValidNationalCode;
  } else {
    return null;
  }
}

String? mobileNumberValidator(String? value, LocaleProvider localeProvider) {
  if (value == null ||
      value.trim().isEmpty ||
      !value.trim().toEnglishDigit().isValidIranianMobileNumber()) {
    return localeProvider.enterValidMobile;
  } else {
    return null;
  }
}

String? phoneNumberValidator(String? value, LocaleProvider localeProvider) {
  if (value == null ||
      value.trim().isEmpty ||
      value.trim().length != 11 ||
      !isPhoneNumber(value.trim().toEnglishDigit())) {
    return localeProvider.enterValidPhone;
  } else {
    return null;
  }
}

String? generalValidator(
    String? value, String title, LocaleProvider localeProvider) {
  if (value == null || value.trim().isEmpty) {
    return localeProvider.enterDynamicValue(title);
  }
  return null;
}

String? smsCodeValidator(String? value, LocaleProvider localeProvider) {
  if (value == null || value.trim().isEmpty || value.trim().length != 5) {
    return localeProvider.enterValidCode;
  } else {
    return null;
  }
}

String? dropdownValidator(
    String? value, String title, LocaleProvider localeProvider) {
  if (value == null || value.trim().isEmpty) {
    return localeProvider.selectDynamicValue(title);
  }
  return null;
}

String? passwordValidator(String? value, LocaleProvider localeProvider) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  if (value == null || value.trim().isEmpty || !regExp.hasMatch(value)) {
    return localeProvider.enterValidPassword;
  }
  return null;
}
