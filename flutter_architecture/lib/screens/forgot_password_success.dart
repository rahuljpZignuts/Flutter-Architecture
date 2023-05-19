import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/types.dart';

import '../theme/Images.dart';
import '../theme/navigation.dart';
import '../theme/strings.dart';
import '../widgets/components/button.dart';
import '../widgets/components/icon_button.dart';
import '../widgets/fixed_viewRoot.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedViewRoot(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 44),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GFTSIconButton(
                iconData: Images.back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: Center(
                      child: Text(
                Strings.password_success,
                textAlign: TextAlign.center,
                style: TextStyleTypes.heading5Medium
                    .copyWith(color: ColorSystem.textHeading),
              ))),
              GFTSButton(
                text: Strings.done,
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigation.login));
                },
              )
            ])));
  }
}
