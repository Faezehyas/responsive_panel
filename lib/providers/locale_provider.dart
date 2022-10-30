import 'package:intl/intl.dart' as intl;
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:wallet_core_managment/utils/enums.dart';
import 'package:wallet_core_managment/utils/extension.dart';
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
    return currentLocaleMode.isEn
        ? intl.DateFormat().add_Hms().format(dateTime)
        : intl.DateFormat()
            .add_jms()
            .format(dateTime)
            .split(' ')
            .first
            .toPersianDigit();
  }

  String formatDate(DateTime dateTime) {
    return currentLocaleMode.isEn
        ? intl.DateFormat().add_yMMMEd().format(dateTime)
        : dateTime.toPersianDateStr(showDayStr: true);
  }

  //***********************************************************************************
  String get appName =>
      dotenv.env[currentLocaleMode.isEn ? 'appNameEn' : 'appNameFa'].toString();
  String get userName =>
      dotenv.env[currentLocaleMode.isEn ? 'userNameEn' : 'userNameFa']
          .toString();
  String get LaOrFa =>
      dotenv.env[currentLocaleMode.isEn ? 'En' : 'Fa'].toString();
  String get enterValidNationalCode => dotenv.env[currentLocaleMode.isEn
          ? 'enterValidNationalCodeEn'
          : 'enterValidNationalCodeFa']
      .toString();
  String get enterValidMobile => dotenv
      .env[currentLocaleMode.isEn ? 'enterValidMobileEn' : 'enterValidMobileFa']
      .toString();
  String get enterValidPhone => dotenv
      .env[currentLocaleMode.isEn ? 'enterValidPhoneEn' : 'enterValidPhoneFa']
      .toString();
  String enterDynamicValue(String value) {
    if (currentLocaleMode.isEn) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['enterValidValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['enterValidValueFa']}';
  }

  String get enterValidCode => dotenv
      .env[currentLocaleMode.isEn ? 'enterValidCodeEn' : 'enterValidCodeFa']
      .toString();
  String selectDynamicValue(String value) {
    if (currentLocaleMode.isEn) {
      return '${dotenv.env['pleaseEn']} ${dotenv.env['selectValueEn']} $value';
    }
    return '${dotenv.env['pleaseFa']} $value ${dotenv.env['selectValueEn']}';
  }

  String get password =>
      dotenv.env[currentLocaleMode.isEn ? 'passwordEn' : 'passwordFa']
          .toString();
  String get enterValidPassword => dotenv.env[currentLocaleMode.isEn
          ? 'enterValidPasswordEn'
          : 'enterValidPasswordFa']
      .toString();
  String get login =>
      dotenv.env[currentLocaleMode.isEn ? 'loginEn' : 'loginFa'].toString();
  String get system =>
      dotenv.env[currentLocaleMode.isEn ? 'systemEn' : 'systemFa'].toString();
  String get customers =>
      dotenv.env[currentLocaleMode.isEn ? 'customersEn' : 'customersFa']
          .toString();
  String get wallet =>
      dotenv.env[currentLocaleMode.isEn ? 'walletEn' : 'walletFa'].toString();
  String get accounting =>
      dotenv.env[currentLocaleMode.isEn ? 'accountingEn' : 'accountingFa']
          .toString();
  String get reporting =>
      dotenv.env[currentLocaleMode.isEn ? 'reportingEn' : 'reportingFa']
          .toString();
  String get tools =>
      dotenv.env[currentLocaleMode.isEn ? 'toolsEn' : 'toolsFa'].toString();
  String get walletTypes =>
      dotenv.env[currentLocaleMode.isEn ? 'walletTypesEn' : 'walletTypesFa']
          .toString();
  String get userManagement => dotenv
      .env[currentLocaleMode.isEn ? 'userManagementEn' : 'userManagementFa']
      .toString();
  String get specialTopicsManagment => dotenv.env[currentLocaleMode.isEn
          ? 'specialTopicsManagmentEn'
          : 'specialTopicsManagmentFa']
      .toString();
  String get accountingTopicsManagment => dotenv.env[currentLocaleMode.isEn
          ? 'accountingTopicsManagmentEn'
          : 'accountingTopicsManagmentFa']
      .toString();
  String get transactionLimitation => dotenv.env[currentLocaleMode.isEn
          ? 'transactionLimitationEn'
          : 'transactionLimitationFa']
      .toString();
  String get commisionSetting => dotenv
      .env[currentLocaleMode.isEn ? 'commisionSettingEn' : 'commisionSettingFa']
      .toString();
  String get branchManagment => dotenv
      .env[currentLocaleMode.isEn ? 'branchManagmentEn' : 'branchManagmentFa']
      .toString();
  String get insertRealCustomers => dotenv.env[currentLocaleMode.isEn
          ? 'insertRealCustomersEn'
          : 'insertRealCustomersFa']
      .toString();
  String get insertLegalCustomers => dotenv.env[currentLocaleMode.isEn
          ? 'insertLegalCustomersEn'
          : 'insertLegalCustomersFa']
      .toString();
  String get customersManagment => dotenv.env[currentLocaleMode.isEn
          ? 'customersManagmentEn'
          : 'customersManagmentFa']
      .toString();
  String get customersEvaluation => dotenv.env[currentLocaleMode.isEn
          ? 'customersEvaluationEn'
          : 'customersEvaluationFa']
      .toString();
  String get message =>
      dotenv.env[currentLocaleMode.isEn ? 'messageEn' : 'messageFa'].toString();
  String get customersWalletManagment => dotenv.env[currentLocaleMode.isEn
          ? 'customersWalletManagmentEn'
          : 'customersWalletManagmentFa']
      .toString();
  String get transfer =>
      dotenv.env[currentLocaleMode.isEn ? 'transferEn' : 'transferFa']
          .toString();
  String get groupSettlement => dotenv
      .env[currentLocaleMode.isEn ? 'groupSettlementEn' : 'groupSettlementFa']
      .toString();
  String get createAccount =>
      dotenv.env[currentLocaleMode.isEn ? 'createAccountEn' : 'createAccountFa']
          .toString();
  String get accountManagment => dotenv
      .env[currentLocaleMode.isEn ? 'accountManagmentEn' : 'accountManagmentFa']
      .toString();
  String get writsManagment => dotenv
      .env[currentLocaleMode.isEn ? 'writsManagmentEn' : 'writsManagmentFa']
      .toString();
  String get ledgerBalance =>
      dotenv.env[currentLocaleMode.isEn ? 'ledgerBalanceEn' : 'ledgerBalanceFa']
          .toString();
  String get customersReport => dotenv
      .env[currentLocaleMode.isEn ? 'customersReportEn' : 'customersReportFa']
      .toString();
  String get customersWalletsReport => dotenv.env[currentLocaleMode.isEn
          ? 'customersWalletsReportEn'
          : 'customersWalletsReportFa']
      .toString();
  String get walletTurnoverReport => dotenv.env[currentLocaleMode.isEn
          ? 'walletTurnoverReportEn'
          : 'walletTurnoverReportFa']
      .toString();
  String get blockingReport => dotenv
      .env[currentLocaleMode.isEn ? 'blockingReportEn' : 'blockingReportFa']
      .toString();
  String get accountTurnoverReport => dotenv.env[currentLocaleMode.isEn
          ? 'accountTurnoverReportEn'
          : 'accountTurnoverReportFa']
      .toString();
  String get changePassword => dotenv
      .env[currentLocaleMode.isEn ? 'changePasswordEn' : 'changePasswordFa']
      .toString();
  String get exit =>
      dotenv.env[currentLocaleMode.isEn ? 'exitEn' : 'exitFa'].toString();
  String get financialManager => dotenv
      .env[currentLocaleMode.isEn ? 'financialManagerEn' : 'financialManagerFa']
      .toString();
  String get dashboard =>
      dotenv.env[currentLocaleMode.isEn ? 'dashboardEn' : 'dashboardFa']
          .toString();
  String get listOfAvailableWalletTypes => dotenv.env[currentLocaleMode.isEn
          ? 'listOfAvailableWalletTypesEn'
          : 'listOfAvailableWalletTypesFa']
      .toString();
  String get neww =>
      dotenv.env[currentLocaleMode.isEn ? 'newEn' : 'newFa'].toString();
  String get showOrEdit =>
      dotenv.env[currentLocaleMode.isEn ? 'showOrEditEn' : 'showOrEditFa']
          .toString();
  String get delete =>
      dotenv.env[currentLocaleMode.isEn ? 'deleteEn' : 'deleteFa'].toString();
  String get returnn =>
      dotenv.env[currentLocaleMode.isEn ? 'returnEn' : 'returnFa'].toString();
  String get walletGroup =>
      dotenv.env[currentLocaleMode.isEn ? 'walletGroupEn' : 'walletGroupFa']
          .toString();
  String get walletName =>
      dotenv.env[currentLocaleMode.isEn ? 'walletNameEn' : 'walletNameFa']
          .toString();
  String get walletTitle =>
      dotenv.env[currentLocaleMode.isEn ? 'walletTitleEn' : 'walletTitleFa']
          .toString();
  String get mainTopicCode =>
      dotenv.env[currentLocaleMode.isEn ? 'mainTopicCodeEn' : 'mainTopicCodeFa']
          .toString();
  String get details =>
      dotenv.env[currentLocaleMode.isEn ? 'detailsEn' : 'detailsFa'].toString();
  String get mainTopicTitle => dotenv
      .env[currentLocaleMode.isEn ? 'mainTopicTitleEn' : 'mainTopicTitleFa']
      .toString();
  String get policeTopicCode => dotenv
      .env[currentLocaleMode.isEn ? 'policeTopicCodeEn' : 'policeTopicCodeFa']
      .toString();
  String get policeTopicTitle => dotenv
      .env[currentLocaleMode.isEn ? 'policeTopicTitleEn' : 'policeTopicTitleFa']
      .toString();
  String get lotteryTopicCode => dotenv
      .env[currentLocaleMode.isEn ? 'lotteryTopicCodeEn' : 'lotteryTopicCodeFa']
      .toString();
  String get lotteryTopicTitle => dotenv.env[currentLocaleMode.isEn
          ? 'lotteryTopicTitleEn'
          : 'lotteryTopicTitleFa']
      .toString();
  String get walletCreationStartDate => dotenv.env[currentLocaleMode.isEn
          ? 'walletCreationStartDateEn'
          : 'walletCreationStartDateFa']
      .toString();
  String get walletCreationEndDate => dotenv.env[currentLocaleMode.isEn
          ? 'walletCreationEndDateEn'
          : 'walletCreationEndDateFa']
      .toString();
  String get walletCreationMinAmount => dotenv.env[currentLocaleMode.isEn
          ? 'walletCreationMinAmountEn'
          : 'walletCreationMinAmountFa']
      .toString();
  String get walletMinBalance => dotenv
      .env[currentLocaleMode.isEn ? 'walletMinBalanceEn' : 'walletMinBalanceFa']
      .toString();
  String get creditPermission => dotenv
      .env[currentLocaleMode.isEn ? 'creditPermissionEn' : 'creditPermissionFa']
      .toString();
  String get withdrawPermission => dotenv.env[currentLocaleMode.isEn
          ? 'withdrawPermissionEn'
          : 'withdrawPermissionFa']
      .toString();
  String get moneySymbol =>
      dotenv.env[currentLocaleMode.isEn ? 'moneySymbolEn' : 'moneySymbolFa']
          .toString();
  String get withdrawWithCard => dotenv
      .env[currentLocaleMode.isEn ? 'withdrawWithCardEn' : 'withdrawWithCardFa']
      .toString();
  String get save =>
      dotenv.env[currentLocaleMode.isEn ? 'saveEn' : 'saveFa'].toString();
  String get cancel =>
      dotenv.env[currentLocaleMode.isEn ? 'cancelEn' : 'cancelFa'].toString();
  String get areYouSure =>
      dotenv.env[currentLocaleMode.isEn ? 'areYouSureEn' : 'areYouSureFa']
          .toString();
  String get yes =>
      dotenv.env[currentLocaleMode.isEn ? 'yesEn' : 'yesFa'].toString();
  String get no =>
      dotenv.env[currentLocaleMode.isEn ? 'noEn' : 'noFa'].toString();
  String get branchCode =>
      dotenv.env[currentLocaleMode.isEn ? 'branchCodeEn' : 'branchCodeFa']
          .toString();
  String get userCode =>
      dotenv.env[currentLocaleMode.isEn ? 'userCodeEn' : 'userCodeFa']
          .toString();
  String get customerCode =>
      dotenv.env[currentLocaleMode.isEn ? 'customerCodeEn' : 'customerCodeFa']
          .toString();
  String get customerName =>
      dotenv.env[currentLocaleMode.isEn ? 'customerNameEn' : 'customerNameFa']
          .toString();
  String get employeeCode =>
      dotenv.env[currentLocaleMode.isEn ? 'employeeCodeEn' : 'employeeCodeFa']
          .toString();
  String get employeeName =>
      dotenv.env[currentLocaleMode.isEn ? 'employeeNameEn' : 'employeeNameFa']
          .toString();
  String get branchName =>
      dotenv.env[currentLocaleMode.isEn ? 'branchNameEn' : 'branchNameFa']
          .toString();
  String get edit =>
      dotenv.env[currentLocaleMode.isEn ? 'editEn' : 'editFa'].toString();
  String get position =>
      dotenv.env[currentLocaleMode.isEn ? 'positionEn' : 'positionFa']
          .toString();
  String get employeeLastName => dotenv
      .env[currentLocaleMode.isEn ? 'employeeLastNameEn' : 'employeeLastNameFa']
      .toString();
  String get search =>
      dotenv.env[currentLocaleMode.isEn ? 'searchEn' : 'searchFa'].toString();
  String get clearSearch =>
      dotenv.env[currentLocaleMode.isEn ? 'clearSearchEn' : 'clearSearchFa']
          .toString();
  String get actions =>
      dotenv.env[currentLocaleMode.isEn ? 'actionsEn' : 'actionsFa'].toString();
  String get employee =>
      dotenv.env[currentLocaleMode.isEn ? 'employeeEn' : 'employeeFa']
          .toString();
  String get title =>
      dotenv.env[currentLocaleMode.isEn ? 'titleEn' : 'titleFa'].toString();
  String get description =>
      dotenv.env[currentLocaleMode.isEn ? 'descriptionEn' : 'descriptionFa']
          .toString();
  String get mainGroup =>
      dotenv.env[currentLocaleMode.isEn ? 'mainGroupEn' : 'mainGroupFa']
          .toString();
  String get essence =>
      dotenv.env[currentLocaleMode.isEn ? 'essenceEn' : 'essenceFa'].toString();
  String get debtor =>
      dotenv.env[currentLocaleMode.isEn ? 'debtorEn' : 'debtorFa'].toString();
  String get creditor =>
      dotenv.env[currentLocaleMode.isEn ? 'creditorEn' : 'creditorFa']
          .toString();
  String get dual =>
      dotenv.env[currentLocaleMode.isEn ? 'dualEn' : 'dualFa'].toString();
  String get topicCode =>
      dotenv.env[currentLocaleMode.isEn ? 'topicCodeEn' : 'topicCodeFa']
          .toString();
  String get deactive =>
      dotenv.env[currentLocaleMode.isEn ? 'deactiveEn' : 'deactiveFa']
          .toString();
  String get listOfAvailableTopics => dotenv.env[currentLocaleMode.isEn
          ? 'listOfAvailableTopicsEn'
          : 'listOfAvailableTopicsFa']
      .toString();
}
