import 'package:flutter/cupertino.dart';
import 'colors.dart';

extension FontWeightExtension on BuildContext {
  TextStyle get extraLight => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-ExtraLight");

  TextStyle get light => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-Light");

  TextStyle get regular => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-Regular");

  TextStyle get medium => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-Medium");

  TextStyle get semiBold => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-SemiBold");

  TextStyle get bold => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-Bold");

  TextStyle get extraBold => CupertinoTheme.of(this).textTheme.textStyle.copyWith(fontFamily: "Mulish-ExtraBold");
}

extension UIThemeExtension on BuildContext {
  TextStyle get title => semiBold.copyWith(
        fontSize: 20,
        color: AppColors.buttonBlack,
      );

  TextStyle get homePageOptions => semiBold.copyWith(
        fontSize: 22,
        color: AppColors.black,
      );

  TextStyle get subtitle => medium.copyWith(
        fontSize: 18,
        color: AppColors.buttonBlack,
      );

  TextStyle get heading => semiBold.copyWith(
        fontSize: 16,
        color: AppColors.black,
      );

  TextStyle get otp => extraBold.copyWith(
        fontSize: 16,
        color: AppColors.black,
      );

  TextStyle get button => bold.copyWith(
        fontSize: 16,
        color: AppColors.backgroundWhite,
      );

  TextStyle get body => medium.copyWith(
        fontSize: 14,
        color: AppColors.black,
      );

  TextStyle get bodyPlaceholder => regular.copyWith(
        fontSize: 14,
        color: AppColors.placeHolder,
      );

  TextStyle get options => regular.copyWith(
        fontSize: 12,
        color: AppColors.buttonBlack,
      );

  TextStyle get options2 => bold.copyWith(
        fontSize: 14,
        color: AppColors.buttonBlack,
      );

  TextStyle get navBar => bold.copyWith(
        fontSize: 18,
        color: AppColors.blackText,
        letterSpacing: -0.5,
      );

  // TextStyle get welcomeTitle => semiBold.copyWith(
  //       fontSize: 32,
  //       letterSpacing: -2.5,
  //       color: AppColors.surfaceWhite,
  //     );

  // TextStyle get title => extraBold.copyWith(
  //       fontSize: 24,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get subTitle => bold.copyWith(
  //       fontSize: 18,
  //       letterSpacing: -1,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get heading => medium.copyWith(
  //       fontSize: 16,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get button => semiBold.copyWith(
  //       fontSize: 16,
  //       letterSpacing: -0.7,
  //       height: 1,
  //       color: AppColors.secondarywhite,
  //     );

  // TextStyle get inputText => semiBold.copyWith(
  //       fontSize: 12,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get navBar => medium.copyWith(
  //       fontSize: 12,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get body => regular.copyWith(
  //       fontSize: 12,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get optionsBody => regular.copyWith(
  //       fontSize: 10,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get caption => light.copyWith(
  //       fontSize: 10,
  //       letterSpacing: -0.7,
  //       height: 1,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get tag => regular.copyWith(
  //       fontSize: 8,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get tag2 => regular.copyWith(
  //       fontSize: 10,
  //       letterSpacing: -0.5,
  //       height: 1,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get likes => extraBold.copyWith(
  //       fontSize: 8,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );

  // TextStyle get caption2 => light.copyWith(
  //       fontSize: 8,
  //       letterSpacing: -0.5,
  //       color: AppColors.primaryGreen,
  //     );
}

extension BottomNavItemExtension on IconData {
  BottomNavigationBarItem toNavBarItem(String? label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Icon(
          this, // "this" refers to the IconData instance
          size: 24,
        ),
      ),
      label: label,
    );
  }
}
