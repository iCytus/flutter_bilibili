part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UserModel? user;
  const LoginState({this.user});
  @override
  List<Object> get props => user != null ? [user!] : [];

  LoginState copyWith({required UserModel user}) {
    return LoginState(user: user);
  }
}

class LoginInitial extends LoginState {
  const LoginInitial({super.user});
}

class LoginComplete extends LoginState {
  const LoginComplete({super.user});
}

class LoginIncomplete extends LoginState {
  LoginIncomplete({super.user});
}
