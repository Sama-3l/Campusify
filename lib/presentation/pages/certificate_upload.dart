import 'package:campusify/constants/colors.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/presentation/widgets/uploader_element.dart';
import 'package:flutter/cupertino.dart';

class CertificateUpload extends StatelessWidget {
  const CertificateUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: AppColors.backgroundWhite,
          leading: NavbarChild(title: "Certificate Uploader"),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  UploaderElement(title: "Expo Certificate - III Year"),
                  UploaderElement(title: "3rd Year - Record Book"),
                  UploaderElement(title: "3rd Year - Notes"),
                  UploaderElement(title: "2nd Year - Notes"),
                  UploaderElement(title: "1st Year - Notes"),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.primaryOrange,
                  child: const Icon(
                    CupertinoIcons.add,
                    color: AppColors.backgroundWhite,
                    size: 24,
                  ),
                  onPressed: () {}),
            )
          ],
        )));
  }
}
