import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_sign_up_state.dart';

class LogInSignUpCubit extends Cubit<LogInSignUpState> {
  LogInSignUpCubit() : super(LogInSignUpInitial());

  onSwitch() => emit(SwitchState());
  onSubmit() => emit(SubmitState());
}
