abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class DoneAuthState extends AuthState {
  String userToken;
  DoneAuthState({required this.userToken});
}

class ErrorAuthState extends AuthState {
  String err;
  ErrorAuthState({required this.err});
}
