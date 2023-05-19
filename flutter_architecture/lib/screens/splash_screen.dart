import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/Images.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/navigation.dart';
import 'package:flutter_architecture/theme/strings.dart';
import 'package:flutter_architecture/theme/types.dart';

import '../widgets/components/button.dart';
import '../widgets/components/link.dart';
import '../widgets/fixed_viewRoot.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedViewRoot(
        child: Padding(
      padding: const EdgeInsets.all(44),
      child: Column(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME TO",
                  style: TextStyleTypes.heading5Medium.copyWith(
                    color: ColorSystem.textHeading,
                  )),
              Images.logo
            ],
          ),
        ),
        Column(
          children: [
            GFTSButton(
              text: Strings.sign_in_with_email,
              onPressed: () {
                Navigator.of(context).pushNamed(Navigation.login);
              },
            ),
            GFTSLink(
              text: Strings.not_a_member,
              onPressed: () {},
            )
          ],
        )
      ]),
    ));
  }
}
