import 'package:intl/intl.dart' as intl;
import 'package:persian_number_utility/persian_number_utility.dart';
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

  TextAlign get textAlign =>
      currentLocaleMode == MyLocaleMode.fa ? TextAlign.end : TextAlign.start;

  String get regularFontFamily =>
      currentLocaleMode == MyLocaleMode.fa ? IYR : PR;

  String get boldFontFamily => currentLocaleMode == MyLocaleMode.fa ? IYB : PB;

  String formatTime(DateTime dateTime) {
    return currentLocaleMode == MyLocaleMode.en
        ? intl.DateFormat().add_Hms().format(dateTime)
        : intl.DateFormat()
            .add_Hms()
            .format(dateTime)
            .split(' ')
            .first
            .toPersianDigit();
  }

  String formatDate(DateTime dateTime) {
    return currentLocaleMode == MyLocaleMode.en
        ? intl.DateFormat().add_yMMMEd().format(dateTime)
        : dateTime.toPersianDateStr(showDayStr: true);
  }

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
  String get wallet =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'walletEn' : 'walletFa']
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
  String get walletTypes => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'walletTypesEn'
          : 'walletTypesFa']
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
  String get financialManager => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'financialManagerEn'
          : 'financialManagerFa']
      .toString();
  String get dashboard => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'dashboardEn' : 'dashboardFa']
      .toString();
  String get listOfAvailableWalletTypes =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'listOfAvailableWalletTypesEn'
              : 'listOfAvailableWalletTypesFa']
          .toString();
  String get neww =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'newEn' : 'newFa']
          .toString();
  String get showOrEdit => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'showOrEditEn'
          : 'showOrEditFa']
      .toString();
  String get delete =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'deleteEn' : 'deleteFa']
          .toString();
  String get returnn =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'returnEn' : 'returnFa']
          .toString();
  String get walletGroup => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'walletGroupEn'
          : 'walletGroupFa']
      .toString();
  String get walletName => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'walletNameEn'
          : 'walletNameFa']
      .toString();
  String get walletTitle => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'walletTitleEn'
          : 'walletTitleFa']
      .toString();
  String get mainTopicCode => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'mainTopicCodeEn'
          : 'mainTopicCodeFa']
      .toString();
  String get details => dotenv
      .env[currentLocaleMode == MyLocaleMode.en ? 'detailsEn' : 'detailsFa']
      .toString();
  String get mainTopicTitle => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'mainTopicTitleEn'
          : 'mainTopicTitleFa']
      .toString();
  String get policeTopicCode => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'policeTopicCodeEn'
          : 'policeTopicCodeFa']
      .toString();
  String get policeTopicTitle => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'policeTopicTitleEn'
          : 'policeTopicTitleFa']
      .toString();
  String get lotteryTopicCode => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'lotteryTopicCodeEn'
          : 'lotteryTopicCodeFa']
      .toString();
  String get lotteryTopicTitle =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'lotteryTopicTitleEn'
              : 'lotteryTopicTitleFa']
          .toString();
  String get walletCreationStartDate =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'walletCreationStartDateEn'
              : 'walletCreationStartDateFa']
          .toString();
  String get walletCreationEndDate =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'walletCreationEndDateEn'
              : 'walletCreationEndDateFa']
          .toString();
  String get walletCreationMinAmount =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'walletCreationMinAmountEn'
              : 'walletCreationMinAmountFa']
          .toString();
  String get walletMinBalance => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'walletMinBalanceEn'
          : 'walletMinBalanceFa']
      .toString();
  String get creditPermission => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'creditPermissionEn'
          : 'creditPermissionFa']
      .toString();
  String get withdrawPermission =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en
              ? 'withdrawPermissionEn'
              : 'withdrawPermissionFa']
          .toString();
  String get moneySymbol => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'moneySymbolEn'
          : 'moneySymbolFa']
      .toString();
  String get withdrawWithCard => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'withdrawWithCardEn'
          : 'withdrawWithCardFa']
      .toString();
  String get save =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'saveEn' : 'saveFa']
          .toString();
  String get cancel =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'cancelEn' : 'cancelFa']
          .toString();
  String get areYouSure => dotenv.env[currentLocaleMode == MyLocaleMode.en
          ? 'areYouSureEn'
          : 'areYouSureFa']
      .toString();
  String get yes =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'yesEn' : 'yesFa']
          .toString();
  String get no =>
      dotenv.env[currentLocaleMode == MyLocaleMode.en ? 'noEn' : 'noFa']
          .toString();
}
