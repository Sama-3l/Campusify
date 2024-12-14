import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'load_events_state.dart';

class LoadEventsCubit extends Cubit<LoadEventsState> {
  LoadEventsCubit() : super(LoadEventsInitial());

  onLoadingFinish() => emit(EventsLoaded());
}
