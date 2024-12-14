import 'package:campusify/constants/extensions.dart';
import 'package:campusify/data/models/user.dart';
import 'package:flutter/cupertino.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.currUser});

  final UserModel currUser;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Text(
        "Accounts Page",
        style: context.title,
      ),
    ));
  }
}
