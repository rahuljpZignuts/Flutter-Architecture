import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/Images.dart';

import '../../theme/colors.dart';
import '../../theme/strings.dart';
import 'bottom_navigation_item.dart';

class GFTSBNV extends StatelessWidget {
  final List<Function> onPressed;
  final int currentSelected;

  const GFTSBNV(
      {Key? key, required this.onPressed, required this.currentSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorSystem.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                blurStyle: BlurStyle.solid,
                color: ColorSystem.shadow)
          ],
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GFTSBNVItem(
            icon: Images.explore,
            text: Strings.explore,
            onPressed: () => {onPressed[0]()},
            selected: currentSelected == 0,
          ),
          GFTSBNVItem(
            icon: Images.library,
            text: Strings.library,
            onPressed: () => {onPressed[1]()},
            selected: currentSelected == 1,
          ),
          GFTSBNVItem(
            icon: Images.messages,
            text: Strings.messages,
            onPressed: () => {onPressed[2]()},
            selected: currentSelected == 2,
          )
        ],
      ),
    );
  }
}
