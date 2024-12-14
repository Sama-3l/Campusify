import 'package:campusify/business_logic/cubits/Timer/timer_cubit.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, int>(
      builder: (context, remainingSeconds) {
        String formatTime(int seconds) {
          final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
          final secs = (seconds % 60).toString().padLeft(2, '0');
          return "$minutes:$secs";
        }

        return Text(
          formatTime(remainingSeconds),
          style: context.options,
        );
      },
    );
  }
}
