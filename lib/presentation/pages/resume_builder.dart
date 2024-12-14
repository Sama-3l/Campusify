import 'package:campusify/assets/svg.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/presentation/widgets/resume_builder_element.dart';
import 'package:flutter/cupertino.dart';

class ResumeBuilder extends StatelessWidget {
  const ResumeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: AppColors.backgroundWhite,
          leading: NavbarChild(title: "Resume Builder"),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                children: [
                  ResumeBuilderElement(icon: personal, title: "PERSONAL DETAILS"),
                  ResumeBuilderElement(icon: education, title: "EDUCATION"),
                  ResumeBuilderElement(icon: experience, title: "EXPERIENCE"),
                  ResumeBuilderElement(icon: skills, title: "SKILLS"),
                  ResumeBuilderElement(icon: objective, title: "OBJECTIVE"),
                  ResumeBuilderElement(icon: projects, title: "PROJECTS"),
                  ResumeBuilderElement(icon: language, title: "LANGUAGES"),
                  ResumeBuilderElement(icon: coverLetter, title: "Cover Letter"),
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
