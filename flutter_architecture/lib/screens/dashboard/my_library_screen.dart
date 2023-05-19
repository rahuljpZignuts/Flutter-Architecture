import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../widgets/scrollable_viewRoot.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableViewRoot(
        child: Container(
      color: ColorSystem.error,
    ));
  }
}
