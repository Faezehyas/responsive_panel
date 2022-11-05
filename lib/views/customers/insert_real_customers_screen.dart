import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_managment/providers/locale_provider.dart';
import 'package:wallet_core_managment/providers/theme_provider.dart';
import 'package:wallet_core_managment/utils/responsive.dart';
import 'package:wallet_core_managment/views/my_widgets/mini_widgets.dart';
import 'package:wallet_core_managment/views/my_widgets/my_text_form_field.dart';

class InsertRealCustomersScreen extends StatefulWidget {
  const InsertRealCustomersScreen({super.key});
  static const route = '/insert-real-customer';

  @override
  State<InsertRealCustomersScreen> createState() =>
      _InsertRealCustomersScreenState();
}

class _InsertRealCustomersScreenState extends State<InsertRealCustomersScreen> {
  LocaleProvider _localeProvider = LocaleProvider();
  ThemeProvider _themeProvider = ThemeProvider();

  late TextEditingController customerNameController;
  late TextEditingController customerlastController;
  late TextEditingController customerFatherNameController;
  late TextEditingController customerMobileNumberController;
  late TextEditingController customerNationalCodeController;
  late TextEditingController customerIbanNumberController;
  late TextEditingController customerDescriptionController;

  @override
  void initState() {
    customerNameController = TextEditingController();
    customerlastController = TextEditingController();
    customerFatherNameController = TextEditingController();
    customerMobileNumberController = TextEditingController();
    customerNationalCodeController = TextEditingController();
    customerIbanNumberController = TextEditingController();
    customerDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, _) {
      _themeProvider = themeProvider;
      _localeProvider = localeProvider;
      return Column(
        children: [
          FormTitle(
              localeProvider.customers, localeProvider.insertRealCustomers),
          // !Responsive.isMobile(context) ? _tabletAndDesktopView() : _mobileView()
          _form()
        ],
      );
    });
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: BoxContainer(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _mobileNumberField(),
                _nameField(),
                _lastNameField(),
                _fatherNameField(),
                _nationalCodeField(),
                _ibanNumberField(),
                _descriptionField(),
              ],
            ),
            Wrap()
          ],
        ),
      ),
    );
  }

  _nameField() => MyTextFormField(
        labelText: _localeProvider.name,
        controller: customerNameController,
      );
  _lastNameField() => MyTextFormField(
        labelText: _localeProvider.lastname,
        controller: customerlastController,
      );
  _fatherNameField() => MyTextFormField(
        labelText: _localeProvider.fatherName,
        controller: customerFatherNameController,
      );
  _nationalCodeField() => MyTextFormField(
        labelText: _localeProvider.nationalCode,
        controller: customerNationalCodeController,
      );
  _mobileNumberField() => MyTextFormField(
        labelText: _localeProvider.mobileNumber,
        controller: customerMobileNumberController,
      );
  _ibanNumberField() => MyTextFormField(
        labelText: _localeProvider.ibanNumber,
        controller: customerIbanNumberController,
      );
  _descriptionField() => MyTextFormField(
        labelText: _localeProvider.description,
        controller: customerDescriptionController,
      );

  Widget _mobileView() {
    return Container();
  }

  Widget _tabletAndDesktopView() {
    return Container();
  }
}
