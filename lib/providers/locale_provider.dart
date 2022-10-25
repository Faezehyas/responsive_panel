import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/user_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utils/const.dart';

class LocaleProvider extends ChangeNotifier {
  late BuildContext context;
  bool isInit = false;
  MyLocaleMode currentLocaleMode = MyLocaleMode.en;

  void init(BuildContext ctx) {
    if (!isInit) {
      isInit = true;
      context = ctx;
      currentLocaleMode = UserInfos.getLocale(context);
    }
  }

  void changeLocale(BuildContext context, MyLocaleMode localeMode) {
    currentLocaleMode = localeMode;
    UserInfos.setLocale(context, currentLocaleMode);
    notifyListeners();
  }

  TextDirection get textDirection => currentLocaleMode == MyLocaleMode.fa
      ? TextDirection.rtl
      : TextDirection.ltr;

  String get regularFontFamily =>
      currentLocaleMode == MyLocaleMode.fa ? IYR : PR;

  String get boldFontFamily => currentLocaleMode == MyLocaleMode.fa ? IYB : PB;

  //***********************************************************************************
  String get appName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'appNameEn' : 'appNameFa']
      .toString();
  String get userName => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'userNameEn' : 'userNameFa']
      .toString();
  String get LaOrFa =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'En' : 'Fa'].toString();
  String get enterValidNationalCode =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'enterValidNationalCodeEn'
              : 'enterValidNationalCodeFa']
          .toString();
  String get enterValidMobile => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidMobileEn'
          : 'enterValidMobileFa']
      .toString();
  String get enterValidPhone => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidPhoneEn'
          : 'enterValidPhoneFa']
      .toString();
  String enterDynamicValue(String value) {
    if (currentLocaleMode == MyLocaleMode.en) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['enterValidValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['enterValidValueFa']}';
  }

  String get enterValidCode => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'enterValidCodeEn'
          : 'enterValidCodeFa']
      .toString();
  String selectDynamicValue(String value) {
    if (currentLocaleMode == MyLocaleMode.en) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['selectValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['selectValueEn']}';
  }

  String get password => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'passwordEn' : 'passwordFa']
      .toString();
  String get enterValidPassword =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'enterValidPasswordEn'
              : 'enterValidPasswordFa']
          .toString();
  String get login =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'loginEn' : 'loginFa']
          .toString();
  String get system =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'systemEn' : 'systemFa']
          .toString();
  String get customers => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'customersEn' : 'customersFa']
      .toString();
  String get wallet => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'walletEn' : 'walletFa']
      .toString();
  String get accounting => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'accountingEn'
          : 'accountingFa']
      .toString();
  String get reporting => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'reportingEn' : 'reportingFa']
      .toString();
  String get tools =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'toolsEn' : 'toolsFa']
          .toString();
  String get depositType => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'depositTypeEn'
          : 'depositTypeFa']
      .toString();
  String get userManagement => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'userManagementEn'
          : 'userManagementFa']
      .toString();
  String get specialTopicsManagment =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'specialTopicsManagmentEn'
              : 'specialTopicsManagmentFa']
          .toString();
  String get accountingTopicsManagment =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'accountingTopicsManagmentEn'
              : 'accountingTopicsManagmentFa']
          .toString();
  String get transactionLimitation =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'transactionLimitationEn'
              : 'transactionLimitationFa']
          .toString();
  String get commisionSetting => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'commisionSettingEn'
          : 'commisionSettingFa']
      .toString();
  String get branchManagment => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'branchManagmentEn'
          : 'branchManagmentFa']
      .toString();
  String get insertRealCustomers =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'insertRealCustomersEn'
              : 'insertRealCustomersFa']
          .toString();
  String get insertLegalCustomers =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'insertLegalCustomersEn'
              : 'insertLegalCustomersFa']
          .toString();
  String get customersManagment =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'customersManagmentEn'
              : 'customersManagmentFa']
          .toString();
  String get customersEvaluation =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'customersEvaluationEn'
              : 'customersEvaluationFa']
          .toString();
  String get message => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'messageEn' : 'messageFa']
      .toString();
  String get customersWalletManagment =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'customersWalletManagmentEn'
              : 'customersWalletManagmentFa']
          .toString();
  String get transfer => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'transferEn' : 'transferFa']
      .toString();
  String get groupSettlement => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'groupSettlementEn'
          : 'groupSettlementFa']
      .toString();
  String get createAccount => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'createAccountEn'
          : 'createAccountFa']
      .toString();
  String get accountManagment => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'accountManagmentEn'
          : 'accountManagmentFa']
      .toString();
  String get writsManagment => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'writsManagmentEn'
          : 'writsManagmentFa']
      .toString();
  String get ledgerBalance => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'ledgerBalanceEn'
          : 'ledgerBalanceFa']
      .toString();
  String get customersReport => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'customersReportEn'
          : 'customersReportFa']
      .toString();
  String get customersWalletsReport =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'customersWalletsReportEn'
              : 'customersWalletsReportFa']
          .toString();
  String get walletTurnoverReport =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'walletTurnoverReportEn'
              : 'walletTurnoverReportFa']
          .toString();
  String get blockingReport => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'blockingReportEn'
          : 'blockingReportFa']
      .toString();
  String get accountTurnoverReport =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'accountTurnoverReportEn'
              : 'accountTurnoverReportFa']
          .toString();
  String get changePassword => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'changePasswordEn'
          : 'changePasswordFa']
      .toString();
  String get exit =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'exitEn' : 'exitFa']
          .toString();
  String get financialManager =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'financialManagerEn' : 'financialManagerFa']
          .toString();
}
