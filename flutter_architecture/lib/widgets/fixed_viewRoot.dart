import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';

class FixedViewRoot extends StatelessWidget {
  final Widget child;

  const FixedViewRoot({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ColorSystem.white,
        child: child,
      ),
    );
  }
}
