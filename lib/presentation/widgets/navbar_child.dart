import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class NavbarChild extends StatelessWidget {
  const NavbarChild({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            child: const Icon(
              CupertinoIcons.chevron_back,
              size: 24,
              color: AppColors.blackText,
            ),
            onTap: () => Navigator.of(context).pop()),
        kGap12,
        Text(
          title,
          style: context.navBar,
        ),
      ],
    );
  }
}
