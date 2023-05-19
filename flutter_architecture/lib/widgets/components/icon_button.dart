import 'package:flutter/material.dart';

class GFTSIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData iconData;

  const GFTSIconButton({Key? key, this.onPressed, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      height: 0,
      minWidth: 0,
      onPressed: () {
        onPressed!();
      },
      child: Icon(iconData),
    );
  }
}
