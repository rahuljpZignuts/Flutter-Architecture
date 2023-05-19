import 'package:flutter/material.dart';
import 'package:flutter_architecture/Utils/Validations.dart';
import 'package:flutter_architecture/theme/navigation.dart';
import 'package:flutter_architecture/theme/strings.dart';

import '../theme/Images.dart';
import '../theme/colors.dart';
import '../theme/types.dart';
import '../widgets/components/button.dart';
import '../widgets/components/icon_button.dart';
import '../widgets/components/input_field.dart';
import '../widgets/fixed_viewRoot.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    errorMessage = null;
  }

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
            Strings.change_password,
            style: TextStyleTypes.heading1Medium
                .copyWith(color: ColorSystem.textHeading),
          ),
          const SizedBox(height: 73),
          GFTSInputField(
            controller: emailController,
            label: Strings.email,
            errorMessage: errorMessage,
          ),
          const SizedBox(
            height: 17,
          ),
          GFTSButton(
            text: Strings.email_me_link,
            onPressed: () {
              setState(() {
                errorMessage =
                    Validations.validateSingleField(emailController.value.text);
                Navigator.pushNamed(
                    context, Navigation.forgot_password_success);
              });
            },
          )
        ],
      ),
    ));
  }
}
