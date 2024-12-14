import 'package:campusify/assets/svg.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class UploaderElement extends StatelessWidget {
  const UploaderElement({super.key, required this.title});

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
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: AppColors.black.withOpacity(0.1))
              ],
              border: Border.all(
                color: AppColors.divider.withOpacity(0.3),
              )),
          child: Row(
            children: [
              const Iconify(
                folder,
                size: 40,
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
