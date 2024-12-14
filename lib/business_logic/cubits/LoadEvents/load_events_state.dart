part of 'load_events_cubit.dart';

@immutable
sealed class LoadEventsState {}

final class LoadEventsInitial extends LoadEventsState {}

final class EventsLoaded extends LoadEventsState {}
