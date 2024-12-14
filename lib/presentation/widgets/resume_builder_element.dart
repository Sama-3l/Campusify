import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ResumeBuilderElement extends StatelessWidget {
  const ResumeBuilderElement({super.key, required this.icon, required this.title});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.tabBarColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: AppColors.black.withOpacity(0.2))
              ],
              border: Border.all(
                color: AppColors.divider.withOpacity(0.3),
              )),
          child: Row(
            children: [
              Iconify(
                icon,
                size: 24,
                color: AppColors.black,
              ),
              kGap12,
              Text(
                title,
                style: context.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
