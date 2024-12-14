import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/service/backend_queries.dart';
import 'package:flutter/cupertino.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final Methods func = Methods();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundWhite,
        navigationBar: const CupertinoNavigationBar(leading: NavbarChild(title: "Events")),
        child: FutureBuilder(
          future: func.fetchAllEvents(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No Events Scheduled",
                  style: context.subtitle,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Image.network(domain.substring(0, domain.length - 3) + snapshot.data![index].thumbnail),
                    );
                  }),
            );
          },
        ));
  }
}
