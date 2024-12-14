import 'package:campusify/assets/svg.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/data/models/placement.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class PlacementCard extends StatelessWidget {
  const PlacementCard({
    super.key,
    required this.placement,
  });

  final Placement placement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.tabBarColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                placement.title,
                style: context.heading,
              ),
              const Spacer(),
              Text(
                placement.daysAgo,
                style: context.options,
              )
            ],
          ),
          kGap12,
          Row(
            children: [
              const Iconify(
                rupee,
                size: 14,
                color: AppColors.black,
              ),
              kGap8,
              Text(
                placement.range,
                style: context.options.copyWith(color: AppColors.black),
              )
            ],
          ),
          kGap12,
          Row(
            children: [
              const Iconify(
                suitcase,
                size: 14,
                color: AppColors.black,
              ),
              kGap8,
              Text(
                placement.experience,
                style: context.options.copyWith(color: AppColors.black),
              )
            ],
          ),
          kGap12,
          Container(
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.divider))),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.location,
                  size: 12,
                  color: AppColors.black,
                ),
                kGap12,
                Text(
                  placement.location,
                  style: context.options.copyWith(color: AppColors.black),
                ),
                const Spacer(),
                Text(
                  "Campusify",
                  style: context.button.copyWith(color: AppColors.black),
                ),
                kGap8,
                Image.asset(
                  "lib/assets/images/logo.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
