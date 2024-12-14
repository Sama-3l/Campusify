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
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController email = TextEditingController();
  bool obscure1 = false;
  final Methods func = Methods();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundWhite,
        navigationBar: const CupertinoNavigationBar(leading: NavbarChild(title: "Forgot Password")),
        child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
            child: SafeArea(
              child: BlocBuilder<SwitchPasswordVisibilityCubit, SwitchPasswordVisibilityState>(
                builder: (context, state) {
                  return Column(children: [
                    FormTextfield(
                      controller: email,
                      placeholder: "",
                      style: context.body,
                      title: "Enter email",
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
                        final message = await func.forgotPassword(context, email.value.text);
                        func.alert(context, "Alert", message);
                      },
                    ),
                  ]);
                },
              ),
            )));
  }
}
