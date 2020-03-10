import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:oepp/authentication/authentication_event.dart';
import 'package:oepp/authentication/authentication_state.dart';
import 'package:oepp/services/user_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserService _userService;

  AuthenticationBloc(this._userService);

  @override
  AuthenticationState get initialState => Initial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is OnInitialize) {
      final bool hasToken = await _userService.hasToken();

      if (hasToken) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is OnLogin) {
      sleep(Duration(seconds: 2));
      yield Authenticated();
    }

    if (event is OnLogout) {
      sleep(Duration(seconds: 2));
      yield Unauthenticated();
    }
  }
}
