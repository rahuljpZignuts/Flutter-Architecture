import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/Images.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

class HighLightView extends StatelessWidget {
  final String title;

  const HighLightView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      decoration: BoxDecoration(
        color: ColorSystem.white,
        border: Border.all(
          color: ColorSystem.highlight_bg,
        ),
        boxShadow: const [BoxShadow(color: ColorSystem.shadow, blurRadius: 10)],
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(width: 40, height: 40, child: Images.logo),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "Category",
                  style: TextStyleTypes.bodySmallRegular
                      .copyWith(color: ColorSystem.highlight_text),
                )),
            Text(
              title,
              style: TextStyleTypes.bodyLargeMedium
                  .copyWith(color: ColorSystem.textHeading),
            )
          ],
        ),
      ),
    );
  }
}
