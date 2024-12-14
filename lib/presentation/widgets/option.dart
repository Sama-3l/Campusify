import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:flutter/material.dart';

class OptionElement extends StatelessWidget {
  const OptionElement({super.key, required this.selected, required this.option, required this.onTap});

  final bool selected;
  final String option;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryOrange : AppColors.backgroundWhite,
          border: Border.all(color: selected ? AppColors.transparent : AppColors.primaryOrange),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          option,
          style: context.options2.copyWith(
            color: selected ? AppColors.backgroundWhite : AppColors.primaryOrange,
          ),
        ),
      ),
    );
  }
}
