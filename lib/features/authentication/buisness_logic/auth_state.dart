import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
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
class LoginSuccessButErrorInData extends AuthState {
  final String errorMessage;
  LoginSuccessButErrorInData({required this.errorMessage});
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



class LogoutLoading extends AuthState {}
class LogoutSuccess extends AuthState {}
class LogoutError extends AuthState {
  final String error;
  LogoutError(this.error);
}


class UpdateProfileLoading extends AuthState {}
class UpdateProfileSuccess extends AuthState {}
class UpdateProfileError extends AuthState {
  final String error;
  UpdateProfileError(this.error);
}


class ForgetPasswordLoading extends AuthState {}
class ForgetPasswordSuccess extends AuthState {
  final MainResponse mainResponse;

  ForgetPasswordSuccess({required this.mainResponse});
}
class ForgetPasswordError extends AuthState {
  final String error;
  ForgetPasswordError(this.error);
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

class ConfirmForgetPasswordLoading extends AuthState {}
class ConfirmForgetPasswordSuccess extends AuthState {
  final LoginModel confirmForgetPasswordModel;

  ConfirmForgetPasswordSuccess(this.confirmForgetPasswordModel);
}
class ConfirmForgetPasswordSuccessButErrorInData extends AuthState {
  final String errorMessage;
  ConfirmForgetPasswordSuccessButErrorInData({required this.errorMessage});
}
class ConfirmForgetPasswordError extends AuthState {
  final String error;
  ConfirmForgetPasswordError(this.error);
}
