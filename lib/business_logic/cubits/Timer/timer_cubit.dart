import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;
  final int initialSeconds;

  TimerCubit({this.initialSeconds = 30}) : super(initialSeconds);

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    emit(initialSeconds); // Reset timer to initial value

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1); // Decrease timer value
      } else {
        _timer?.cancel();
      }
    });
  }

  void restartTimer() {
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Clean up when the cubit is closed
    return super.close();
  }
}
