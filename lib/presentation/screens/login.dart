import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/business_logic/cubits/SwitchPasswordVisibility/switch_password_visibility_cubit.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/presentation/pages/forgot_password.dart';
import 'package:campusify/presentation/screens/sign_up.dart';
import 'package:campusify/presentation/widgets/textfields/form_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Methods func = Methods();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 40),
      child: ListView(
        children: [
          Image.asset(
            "lib/assets/images/logo.png",
            width: 144,
            height: 144,
          ),
          kGap25,
          FormTextfield(
            controller: email,
            placeholder: "Enter your college email",
            style: context.body,
            title: "Email",
          ),
          kGap25,
          BlocBuilder<SwitchPasswordVisibilityCubit, SwitchPasswordVisibilityState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FormTextfield(
                    controller: password,
                    placeholder: "Enter password",
                    style: context.body,
                    title: "Password",
                    obscure: obscure,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          obscure = !obscure;
                          BlocProvider.of<SwitchPasswordVisibilityCubit>(context).onSwitch();
                        },
                        child: Icon(
                          obscure ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                          color: AppColors.buttonBlack,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  kGap12,
                  GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        style: context.body.copyWith(color: AppColors.red),
                      ),
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ForgotPassword())))
                ],
              );
            },
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
                    "Login",
                    style: context.button,
                  ),
                  onPressed: () async {
                    // await func.handleLogin(context, email.value.text, password.value.text);
                    await func.handleLogin(context, "johndoe@symfor.com", "Password123");
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
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SignupPage())),
                      child: Text(
                        "Sign Up",
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
      ),
    ));
  }
}
