part of 'select_option_cubit.dart';

@immutable
sealed class SelectOptionState {}

final class SelectOptionInitial extends SelectOptionState {}

final class OptionSelected extends SelectOptionState {}
