import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/system.dart';

class TextStyleTypes {
  static TextStyle heading1Medium =
      TextSystem.heading1.copyWith(fontWeight: FontWeight.w500);
  static TextStyle heading5Medium =
      TextSystem.heading5.copyWith(fontWeight: FontWeight.w500);
  static TextStyle heading3Medium =
      TextSystem.heading3.copyWith(fontWeight: FontWeight.w500);
  static TextStyle bodyStandardSemiBold =
      TextSystem.bodyStandard.copyWith(fontWeight: FontWeight.w600);
  static TextStyle bodyStandardMedium =
      TextSystem.bodyStandard.copyWith(fontWeight: FontWeight.w500);
  static TextStyle bodyStandardRegular =
      TextSystem.bodyStandard.copyWith(fontWeight: FontWeight.w400);
  static TextStyle bodyLargeRegular =
      TextSystem.bodyLarge.copyWith(fontWeight: FontWeight.w400);
  static TextStyle bodyLargeMedium =
      TextSystem.bodyLarge.copyWith(fontWeight: FontWeight.w500);
  static TextStyle bodyExtraSmallRegular =
      TextSystem.bodyExtraSmall.copyWith(fontWeight: FontWeight.w400);
  static TextStyle bodySmallRegular =
      TextSystem.bodySmall.copyWith(fontWeight: FontWeight.w400);

  static TextStyle linkStandardSemiBold = TextSystem.bodyStandard.copyWith(
      fontWeight: FontWeight.w600, decoration: TextDecoration.underline);
}
