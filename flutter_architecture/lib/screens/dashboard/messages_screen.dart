import 'package:flutter/material.dart';
import 'package:flutter_architecture/theme/colors.dart';

import '../../widgets/scrollable_viewRoot.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableViewRoot(
        child: Container(
      color: ColorSystem.primaryVarient,
    ));
  }
}
