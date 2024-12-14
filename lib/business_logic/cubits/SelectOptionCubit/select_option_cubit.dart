import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_option_state.dart';

class SelectOptionCubit extends Cubit<SelectOptionState> {
  SelectOptionCubit() : super(SelectOptionInitial());

  onSelect() => emit(OptionSelected());
}
