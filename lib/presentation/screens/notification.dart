import 'package:campusify/constants/extensions.dart';
import 'package:flutter/cupertino.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Text(
        "Notifications Page",
        style: context.title,
      ),
    ));
  }
}
