import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_password_visibility_state.dart';

class SwitchPasswordVisibilityCubit extends Cubit<SwitchPasswordVisibilityState> {
  SwitchPasswordVisibilityCubit() : super(SwitchPasswordVisibilityInitial());

  onSwitch() => emit(SwitchVisibilityState());
}
