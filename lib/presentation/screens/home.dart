import 'package:campusify/assets/svg.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/data/models/user.dart';
import 'package:campusify/presentation/pages/certificate_upload.dart';
import 'package:campusify/presentation/pages/events.dart';
import 'package:campusify/presentation/pages/placement.dart';
import 'package:campusify/presentation/pages/print_station.dart';
import 'package:campusify/presentation/pages/resume_builder.dart';
import 'package:campusify/presentation/widgets/gridviews/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.currUser});

  final UserModel currUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.backgroundWhite,
          leading: GestureDetector(
            child: const Icon(
              CupertinoIcons.line_horizontal_3,
              size: 24,
              color: AppColors.blackText,
            ),
            onTap: () {},
          ),
          middle: Image.asset(
            "lib/assets/images/title.png",
            width: 196,
            height: 35,
          ),
          trailing: GestureDetector(
            child: const Iconify(
              notifications,
              size: 24,
              color: AppColors.black,
            ),
            onTap: () {},
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: StaggeredGridExample(
            options: const [
              {
                "name": "Chat Bot",
                "icon": chatBot,
              },
              {
                "name": "Previouse Paper",
                "icon": prevPaper,
              },
              {
                "name": "Events",
                "icon": events,
                "onTap": EventsPage(),
              },
              {
                "name": "Placement",
                "icon": placement,
                "onTap": PlacementPage(
                  options: [
                    "Internships",
                    "Jobs",
                    "Trending",
                    "Actively Hiring"
                  ],
                ),
              },
              {
                "name": "Print Station",
                "icon": print,
                "onTap": PrintStation()
              },
              {
                "name": "Resume Builder",
                "icon": resume,
                "onTap": ResumeBuilder()
              },
              {
                "name": "Certificate Upload",
                "icon": upload,
                "onTap": CertificateUpload()
              }
            ],
          ),
        ));
  }
}
