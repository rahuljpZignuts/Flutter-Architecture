import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/types.dart';

class GFTSBNVItem extends StatelessWidget {
  final Function onPressed;
  final bool selected;
  final String text;
  final IconData icon;

  const GFTSBNVItem(
      {Key? key,
      required this.onPressed,
      required this.selected,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Column(
          children: [
            Icon(
              icon,
              color:
                  !selected ? ColorSystem.bnv_item : ColorSystem.primaryVarient,
              size: 30,
            ),
            Text(
              text,
              style: TextStyleTypes.bodyExtraSmallRegular
                  .copyWith(color: ColorSystem.subheading),
            )
          ],
        ),
      ),
    );
  }
}
