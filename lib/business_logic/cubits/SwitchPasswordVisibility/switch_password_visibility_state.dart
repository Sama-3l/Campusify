part of 'switch_password_visibility_cubit.dart';

@immutable
sealed class SwitchPasswordVisibilityState {}

final class SwitchPasswordVisibilityInitial extends SwitchPasswordVisibilityState {}

final class SwitchVisibilityState extends SwitchPasswordVisibilityState {}
