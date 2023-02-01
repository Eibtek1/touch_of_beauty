import 'package:touch_of_beauty/features/authentication/data/models/register_model.dart';

import '../data/models/confirm_register_model.dart';
import '../data/models/login_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class GetCitiesLoading extends AuthState {}
class GetCitiesSuccess extends AuthState {}
class GetChangedCity extends AuthState {}


class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {
  final LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}
class LoginError extends AuthState {
  final String error;
  LoginError({required this.error});
}


class GetPickedImageSuccessState extends AuthState {}
class GetPickedImageErrorState extends AuthState {}


class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {
  final RegisterModel? registerModel;

  RegisterSuccess(this.registerModel);
}
class RegisterError extends AuthState {
  final String error;
  RegisterError(this.error);
}


class GetUserDataLoading extends AuthState {}
class GetUserDataSuccess extends AuthState {}
class GetUserDataError extends AuthState {
  final String error;
  GetUserDataError(this.error);
}

class ConfirmRegisterLoading extends AuthState {}
class ConfirmRegisterSuccess extends AuthState {
  final ConfirmRegisterModel confirmRegisterModel;

  ConfirmRegisterSuccess(this.confirmRegisterModel);
}
class ConfirmRegisterError extends AuthState {
  final String error;
  ConfirmRegisterError(this.error);
}
