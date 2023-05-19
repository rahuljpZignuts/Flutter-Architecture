import 'package:flutter/material.dart';
import 'package:flutter_architecture/Utils/Validations.dart';
import 'package:flutter_architecture/theme/Images.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/navigation.dart';
import 'package:flutter_architecture/theme/strings.dart';
import 'package:flutter_architecture/theme/types.dart';

import '../widgets/components/button.dart';
import '../widgets/components/icon_button.dart';
import '../widgets/components/input_field.dart';
import '../widgets/components/link.dart';
import '../widgets/components/link2.dart';
import '../widgets/fixed_viewRoot.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return FixedViewRoot(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GFTSIconButton(
            iconData: Images.back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            Strings.sign_in,
            style: TextStyleTypes.heading1Medium
                .copyWith(color: ColorSystem.textHeading),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 72,
                ),
                GFTSInputField(
                  controller: email,
                  label: Strings.email,
                  errorMessage: emailError,
                ),
                const SizedBox(height: 12),
                GFTSInputField(
                  controller: password,
                  label: Strings.password,
                  errorMessage: passwordError,
                ),
                GFTSLink2(
                  text: Strings.forgot_password,
                  onPressed: () {
                    Navigator.pushNamed(context, Navigation.forgot_password);
                  },
                )
              ],
            ),
          ),
          GFTSButton(
            text: Strings.sign_in,
            onPressed: () {
              validateFields();
              Navigator.pushNamedAndRemoveUntil(
                  context, Navigation.user_dashboard, (route) => false);
            },
          ),
          const Center(
              child: GFTSLink(
            text: Strings.not_a_member,
          ))
        ],
      ),
    ));
  }

  void validateFields() {
    setState(() {
      emailError = Validations.validateSingleField(email.value.text);
      passwordError = Validations.validateSingleField(password.value.text);
    });
  }
}
