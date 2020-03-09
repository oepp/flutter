abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class OnInitialize extends AuthenticationEvent {}

class OnLogin extends AuthenticationEvent {}

class OnLogout extends AuthenticationEvent {}
