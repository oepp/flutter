import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:oepp/authentication/authentication_event.dart';
import 'package:oepp/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => Initial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is OnInitialize) {
      final bool hasToken = false;

      if (hasToken) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is OnLogin) {
      yield Loading();
      sleep(Duration(seconds: 2));
      yield Authenticated();
    }

    if (event is OnLogout) {
      yield Loading();
      sleep(Duration(seconds: 2));
      yield Unauthenticated();
    }
  }
}
