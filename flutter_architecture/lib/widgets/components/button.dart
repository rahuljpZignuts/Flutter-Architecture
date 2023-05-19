import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

class GFTSButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const GFTSButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
          color: ColorSystem.primary,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        minWidth: 0,
        onPressed: () {
          onPressed!();
        },
        child: Center(
          child: Text(
            text,
            style: TextStyleTypes.heading5Medium.copyWith(
              color: ColorSystem.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
