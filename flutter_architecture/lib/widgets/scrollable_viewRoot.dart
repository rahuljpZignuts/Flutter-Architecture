import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';

class ScrollableViewRoot extends StatelessWidget {
  final Widget child;

  const ScrollableViewRoot({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            color: ColorSystem.background,
            child: child,
          ),
        ),
      ),
    );
  }
}
