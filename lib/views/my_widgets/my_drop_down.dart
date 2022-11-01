import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_core_management/providers/locale_provider.dart';

class MyDropDown<Type> extends StatelessWidget {
  MyDropDown(
      {Key? key,
      this.errorText,
      this.labelText,
      this.focusColor,
      this.bgOnErrorColor,
      this.dropdownSelectedValue,
      this.dropdownItemList,
      this.onChanged,
      this.width,
      this.validator})
      : super(key: key);

  final String? errorText;
  final String? labelText;
  final Color? focusColor;
  final Color? bgOnErrorColor;
  final Type? dropdownSelectedValue;
  final List<DropdownMenuItem<Type>>? dropdownItemList;
  final ValueChanged? onChanged;
  String? Function(Type?)? validator;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onChanged == null,
      child: SizedBox(
        width: width ?? 300,
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          alignedDropdown: true,
          child: DropdownButtonFormField<Type>(
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 12,
                    fontFamily:
                        context.read<LocaleProvider>().regularFontFamily)),
            focusColor: focusColor,
            value: dropdownSelectedValue,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            items: dropdownItemList,
            onChanged: onChanged ?? (_) {},
            elevation: 2,
            isExpanded: true,
            validator: validator,
          ),
        )),
      ),
    );
  }
}
