import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/business_logic/cubits/SwitchPasswordVisibility/switch_password_visibility_cubit.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/presentation/widgets/textfields/form_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Password extends StatelessWidget {
  Password({super.key, required this.inputs});

  Map<String, dynamic> inputs;

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool obscure1 = false;
  bool obscure2 = false;
  final Methods func = Methods();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundWhite,
        navigationBar: const CupertinoNavigationBar(leading: NavbarChild(title: "Password")),
        child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
            child: SafeArea(
              child: BlocBuilder<SwitchPasswordVisibilityCubit, SwitchPasswordVisibilityState>(
                builder: (context, state) {
                  return Column(children: [
                    FormTextfield(
                      controller: password,
                      placeholder: "",
                      style: context.body,
                      title: "New Password",
                      obscure: obscure1,
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            obscure1 = !obscure1;
                            BlocProvider.of<SwitchPasswordVisibilityCubit>(context).onSwitch();
                          },
                          child: Icon(
                            obscure1 ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                            color: AppColors.buttonBlack,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    kGap25,
                    FormTextfield(
                      controller: confirmPassword,
                      placeholder: "",
                      style: context.body,
                      title: "Confirm Password",
                      obscure: obscure2,
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            obscure2 = !obscure2;
                            BlocProvider.of<SwitchPasswordVisibilityCubit>(context).onSwitch();
                          },
                          child: Icon(
                            obscure2 ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                            color: AppColors.buttonBlack,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    kGap40,
                    CupertinoButton(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      child: Text(
                        "Submit",
                        style: context.button,
                      ),
                      onPressed: () async {
                        if (password.value.text == confirmPassword.value.text) {
                          inputs["password"] = password.value.text;
                          await func.handleSignup(context, inputs);
                        } else {
                          func.alert(context, "Error", "Passwords don't match");
                        }
                      },
                    ),
                  ]);
                },
              ),
            )));
  }
}
