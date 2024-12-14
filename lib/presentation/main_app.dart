import 'package:campusify/presentation/screens/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/data/models/user.dart';
import 'package:campusify/presentation/screens/account.dart';
import 'package:campusify/presentation/screens/home.dart';

class MainApp extends StatelessWidget {
  MainApp({
    super.key,
    required this.currUser,
  });

  final UserModel currUser;

  final CupertinoTabController controller = CupertinoTabController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller,
      tabBar: CupertinoTabBar(activeColor: AppColors.primaryOrange, inactiveColor: AppColors.secondaryOrange, backgroundColor: AppColors.tabBarColor, height: 56, items: [
        CupertinoIcons.home.toNavBarItem(null),
        CupertinoIcons.person.toNavBarItem(null),
        CupertinoIcons.bell.toNavBarItem(null),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => HomeScreen(
                currUser: currUser,
              ),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => AccountScreen(
                currUser: currUser,
              ),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => NotificationScreen(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => HomeScreen(
                currUser: currUser,
              ),
            );
        }
      },
    );
  }
}
