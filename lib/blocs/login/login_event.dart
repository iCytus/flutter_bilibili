part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final UserModel model;
  const UserLoginEvent({required this.model});
}

class TestEvent extends LoginEvent {}



