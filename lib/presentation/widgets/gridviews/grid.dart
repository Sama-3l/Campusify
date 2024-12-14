import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class StaggeredGridExample extends StatelessWidget {
  StaggeredGridExample({super.key, required this.options});

  final List<Map<String, dynamic>> options;
  final Methods func = Methods();

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
      ),
      itemCount: options.length,
      mainAxisSpacing: 20,
      crossAxisSpacing: 22,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (options[index]["onTap"] != null) {
              Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => options[index]["onTap"]));
            } else {
              func.alert(context, "Alert", "This is not functional yet");
            }
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.backgroundWhite, boxShadow: [
              BoxShadow(blurRadius: 15, color: AppColors.black.withOpacity(0.26)),
            ]),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(options[index]["name"], style: context.homePageOptions),
                kGap25,
                Align(
                  alignment: Alignment.centerRight,
                  child: Iconify(
                    options[index]["icon"],
                    size: 60,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
