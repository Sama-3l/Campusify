part of 'log_in_sign_up_cubit.dart';

@immutable
sealed class LogInSignUpState {}

final class LogInSignUpInitial extends LogInSignUpState {}

final class SwitchState extends LogInSignUpState {}

final class SubmitState extends LogInSignUpState {}
