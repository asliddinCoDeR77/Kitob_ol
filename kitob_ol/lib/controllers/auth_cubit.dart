import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kitob_ol/service/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  void sendSmsCode(String phone) async {
    try {
      emit(AuthLoading());
      final Response response = await authService.sendSmsCodeRegister(phone);
      if (response.statusCode == 200 && response.data['success']) {
        emit(AuthSmsSent());
      } else {
        emit(AuthFailure('Failed to send SMS code'));
      }
    } catch (e) {
      emit(AuthFailure('Error: $e'));
    }
  }

  void verifyCode(String phone, String code) async {
    try {
      emit(AuthLoading());
      final Response response = await authService.verifyCode(phone, code);
      if (response.statusCode == 200 && response.data['success']) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Invalid code or verification failed'));
      }
    } catch (e) {
      emit(AuthFailure('Error: $e'));
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSmsSent extends AuthState {}

class AuthPhoneNotRegistered extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthSuccess extends AuthState {}
