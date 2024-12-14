import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:flutter/cupertino.dart';

class OptionsPicker extends StatelessWidget {
  final List<String> options;
  final void Function(String selectedOption) onCategoryselected;

  const OptionsPicker({
    Key? key,
    required this.onCategoryselected,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: AppColors.backgroundWhite,
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: context.body,
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Done",
                    style: context.body,
                  ),
                ),
              ],
            ),
          ),
          // Picker
          Expanded(
            child: CupertinoPicker(
              itemExtent: 32.0,
              scrollController: FixedExtentScrollController(),
              onSelectedItemChanged: (index) {
                onCategoryselected(options[index]);
              },
              children: options
                  .map((label) => Center(
                          child: Text(
                        label,
                        style: context.body,
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
