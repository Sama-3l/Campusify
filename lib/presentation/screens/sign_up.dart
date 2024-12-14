import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/presentation/pages/password.dart';
import 'package:campusify/presentation/screens/login.dart';
import 'package:campusify/presentation/widgets/textfields/form_textfield.dart';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController rollNumber = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController college = TextEditingController();
  final TextEditingController program = TextEditingController();
  final TextEditingController specialization = TextEditingController();
  final TextEditingController regulation = TextEditingController();
  final TextEditingController yearOfJoining = TextEditingController();
  Methods func = Methods();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 40),
      child: FutureBuilder(
          future: func.fetchAllColleges(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Image.asset(
                    "lib/assets/images/logo.png",
                    width: 144,
                    height: 144,
                  ),
                  kGap25,
                  FormTextfield(
                    controller: name,
                    placeholder: "Enter your name",
                    style: context.body,
                    title: "Name",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: rollNumber,
                    placeholder: "Enter your roll number",
                    style: context.body,
                    title: "Roll number",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: college,
                    placeholder: "Enter your college name",
                    style: context.body,
                    title: "College",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: email,
                    placeholder: "Enter your email",
                    style: context.body,
                    title: "Email",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: program,
                    placeholder: "Program",
                    style: context.body,
                    title: "Program",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: specialization,
                    placeholder: "Specialization",
                    style: context.body,
                    title: "Specialization",
                  ),
                  kGap25,
                  FormTextfield(
                    controller: yearOfJoining,
                    placeholder: "Year of Joining",
                    style: context.body,
                    title: "Year of Joining",
                  ),
                  kGap25,
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryOrange,
                          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                          child: Text(
                            "Sign up",
                            style: context.button,
                          ),
                          onPressed: () async {
                            Map<String, dynamic> inputs = {
                              "username": name.value.text,
                              "email": email.value.text,
                              "role": "Student",
                              "collegeName": college.value.text,
                              "program": program.value.text,
                              "specialization": specialization.value.text,
                              "regulation": regulation.value.text,
                              "yearOfJoining": int.parse(yearOfJoining.value.text),
                            };
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => Password(
                                      inputs: inputs,
                                    )));
                          },
                        ),
                        kGap12,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Already have an account?",
                              style: context.body,
                            ),
                            kGap4,
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => const LoginPage(),
                              )),
                              child: Text(
                                "Log in",
                                style: context.body.copyWith(
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }),
    ));
  }
}
