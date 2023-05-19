import 'package:flutter/material.dart';

import '../widgets/components/bottom_navigation.dart';
import '../widgets/fixed_viewRoot.dart';
import 'dashboard/explore_screen.dart';
import 'dashboard/messages_screen.dart';
import 'dashboard/my_library_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({Key? key}) : super(key: key);

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  late int currentSelected;
  late Widget screen;

  @override
  void initState() {
    super.initState();
    currentSelected = 0;
    screen = const ExploreScreen();
  }

  void setCurrent(int current) {
    setState(() {
      currentSelected = current;
      switch (currentSelected) {
        case 0:
          {
            screen = const ExploreScreen();
            break;
          }
        case 1:
          {
            screen = const MyLibraryScreen();
            break;
          }
        case 2:
          {
            screen = const MessagesScreen();
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FixedViewRoot(
      child: Column(
        children: [
          Expanded(child: screen),
          GFTSBNV(
            onPressed: [
              () => {setCurrent(0)},
              () => {setCurrent(1)},
              () => {setCurrent(2)},
            ],
            currentSelected: currentSelected,
          )
        ],
      ),
    );
  }
}
