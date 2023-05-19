import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

class GFTSLink extends StatelessWidget {
  final Function? onPressed;
  final String text;

  const GFTSLink({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed!();
      },
      child: Text(
        text,
        style: TextStyleTypes.linkStandardSemiBold.copyWith(
          color: ColorSystem.primary,
        ),
      ),
    );
  }
}
