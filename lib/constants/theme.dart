import 'package:flutter/cupertino.dart';
import 'colors.dart';

CupertinoThemeData get theme {
  return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryOrange,
      textTheme: CupertinoTextThemeData(
          primaryColor: AppColors.black,
          tabLabelTextStyle: TextStyle(
            fontFamily: "Fustat-Medium",
            fontSize: 12,
            color: AppColors.black,
            letterSpacing: -0.5,
          ),
          textStyle: TextStyle(
            fontFamily: "Fustat",
            fontSize: 24,
          )));
}
