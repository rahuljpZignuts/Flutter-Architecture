import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

import '../../theme/Images.dart';

class GFTSSearchBox extends StatelessWidget {
  final Function onPressed;

  const GFTSSearchBox({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          decoration: BoxDecoration(
              color: ColorSystem.search_bg,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Images.search,
                  color: ColorSystem.subheading,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Search Workout",
                      style: TextStyleTypes.bodyStandardRegular
                          .copyWith(color: ColorSystem.subheading),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
