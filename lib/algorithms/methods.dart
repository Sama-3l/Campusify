// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:campusify/business_logic/cubits/LoadEvents/load_events_cubit.dart';
import 'package:campusify/data/models/college.dart';
import 'package:campusify/data/models/event.dart';
import 'package:campusify/data/models/user.dart';
import 'package:campusify/presentation/main_app.dart';
import 'package:campusify/presentation/screens/login.dart';
import 'package:campusify/presentation/screens/otp.dart';
import 'package:campusify/service/backend_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Methods {
  BackendRepo backendRepo = BackendRepo();

  void updateToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void alert(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                // Handle the OK button press
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> handleLogin(BuildContext context, String email, String password) async {
    try {
      final response = await backendRepo.callPostMethod('/auth/login', {
        "email": email,
        "password": password
      });
      String token = jsonDecode(response.body)["token"];
      updateToken(token);

      UserModel currUser = UserModel.fromJson(jsonDecode(response.body)["user"]);
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => MainApp(currUser: currUser)));
    } catch (error) {
      alert(context, 'Error', 'Sign up didn\'t work');
      debugPrint("Error signing in: $error");
    }
  }

  Future<String> forgotPassword(BuildContext context, String email) async {
    try {
      final response = await backendRepo.callPostMethod('/auth/reset-password', {
        "email": email,
      });

      String message = jsonDecode(response.body)["message"];
      return message;
    } catch (error) {
      alert(context, 'Error', 'Invalid email');
      debugPrint("Error signing in: $error");
      return '';
    }
  }

  Future<List<Event>> fetchAllEvents(BuildContext context) async {
    try {
      final response = await backendRepo.callGetMethod('/events');
      List<Event> events = (jsonDecode(response.body)["data"] as List).map((e) => Event.fromJson(e)).toList();
      BlocProvider.of<LoadEventsCubit>(context).onLoadingFinish();
      return events;
    } catch (error) {
      alert(context, 'Error', 'Invalid email');
      debugPrint("Error signing in: $error");
      return [];
    }
  }

  Future<List<College>> fetchAllColleges(BuildContext context) async {
    try {
      final response = await backendRepo.callGetMethod('/colleges');
      List<College> colleges = (jsonDecode(response.body) as List).map((e) => College.fromJson(e)).toList();
      return colleges;
    } catch (error) {
      alert(context, 'Error', 'Invalid email');
      debugPrint("Error signing in: $error");
      return [];
    }
  }

  Future<void> handleSignup(BuildContext context, Map<String, dynamic> input) async {
    try {
      await backendRepo.callPostMethod('/auth/signup', input);
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => OtpScreen(
                email: input["email"],
              )));
    } catch (error) {
      alert(context, 'Error', 'Sign up didn\'t work');
      debugPrint("Error signing in: $error");
    }
  }

  Future<void> handleOTP(BuildContext context, Map<String, dynamic> input) async {
    try {
      await backendRepo.callPostMethod('/auth/verify-otp', input);
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginPage()));
    } catch (error) {
      alert(context, 'Error', 'Sign up didn\'t work');
      debugPrint("Error signing in: $error");
    }
  }
}

class EnumPicker {}
