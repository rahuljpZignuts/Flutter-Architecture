import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

class GFTSInputField extends StatelessWidget {
  final String? errorMessage;
  final TextEditingController controller;
  final String label;

  const GFTSInputField(
      {Key? key,
      this.errorMessage,
      required this.controller,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorSystem.primary,
      controller: controller,
      style: TextStyleTypes.bodyStandardRegular
          .copyWith(color: ColorSystem.textHeading),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: label,
          errorText: errorMessage,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.error)),
          errorStyle: TextStyleTypes.bodyStandardRegular
              .copyWith(color: ColorSystem.error),
          labelStyle: TextStyleTypes.bodyStandardRegular.copyWith(
              color: errorMessage != null
                  ? ColorSystem.error
                  : ColorSystem.subheading),
          filled: true,
          fillColor: errorMessage != null
              ? ColorSystem.error_bg
              : ColorSystem.inputField,
          border: InputBorder.none),
    );
  }
}
