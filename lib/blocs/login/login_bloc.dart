import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserModel? u;
  LoginBloc({this.u}) : super(LoginInitial(user: u)) {
    on<LoginEvent>((event, emit) {});

    on<UserLoginEvent>((event, emit) {
      _onLogin(event, emit);
    });
  }

  void _onLogin(UserLoginEvent event, Emitter<LoginState> emit) {
    emit(LoginComplete(user: event.model));
  }
}
