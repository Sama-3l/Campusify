import 'package:campusify/assets/svg.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/presentation/widgets/gridviews/grid.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:flutter/cupertino.dart';

class PrintStation extends StatelessWidget {
  const PrintStation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundWhite,
        navigationBar: const CupertinoNavigationBar(backgroundColor: AppColors.backgroundWhite, leading: NavbarChild(title: "Print Station")),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: StaggeredGridExample(
            options: const [
              {
                "name": "CT",
                "icon": ct,
              },
              {
                "name": "Records",
                "icon": records,
              },
              {
                "name": "3rd",
                "icon": third,
              },
              {
                "name": "Upload",
                "icon": uploadIcon,
              },
            ],
          ),
        ));
  }
}
