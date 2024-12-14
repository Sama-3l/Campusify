import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/assets/svg.dart';
import 'package:campusify/business_logic/cubits/Timer/timer_cubit.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/presentation/widgets/timer_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> otpController = List.generate(4, (index) => TextEditingController());
  final Methods func = Methods();

  @override
  Widget build(BuildContext context) {
    context.read<TimerCubit>().startTimer();
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundWhite,
        navigationBar: const CupertinoNavigationBar(leading: NavbarChild(title: "OTP Verification")),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25, top: 40),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Iconify(
                        otp,
                        size: 200,
                      ),
                      kGap40,
                      Text(
                        "Verification code sent to",
                        style: context.subtitle,
                      ),
                      kGap25,
                      Text(
                        widget.email,
                        style: context.title,
                      ),
                      kGap40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < otpController.length; i++) ...[
                            Container(
                              height: 43,
                              width: 43,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(color: AppColors.black.withOpacity(0.2), blurRadius: 10),
                              ]),
                              child: CupertinoTextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                controller: otpController[i],
                                padding: const EdgeInsets.all(10),
                                maxLength: 1,
                                style: context.otp,
                              ),
                            ),
                            if (i < otpController.length - 1) kGap25, // Add gap except after the last item
                          ]
                        ],
                      ),
                      kGap40,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          children: [
                            CountdownTimer(),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<TimerCubit>(context).restartTimer();
                              },
                              child: Text(
                                "Resend",
                                style: context.button.copyWith(color: AppColors.primaryOrange),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                    ])),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryOrange,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Continue',
                          style: context.button,
                        ),
                        onPressed: () async {
                          await func.handleOTP(context, {
                            "email": widget.email,
                            "otp": "${otpController[0].value.text}${otpController[1].value.text}${otpController[2].value.text}${otpController[3].value.text}",
                          });
                        }),
                  ))
            ],
          ),
        ));
  }
}
