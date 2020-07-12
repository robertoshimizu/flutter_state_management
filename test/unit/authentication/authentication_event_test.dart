import 'package:flutter_test/flutter_test.dart';
import 'package:state_mgmt/authentication/authentication_bloc.dart';

void main() {
  group('Authentication Events', () {
    group('AuthenticationStarted', () {
      test('props are []', () {
        expect(AuthenticationStarted().props, []);
      });
    });
    group('AuthenticationLoggedIn', () {
      test('props are [token]', () {
        String token;
        token = 'anytoken';
        expect(AuthenticationLoggedIn(token: token).props, ['anytoken']);
      });
    });
    group('AuthenticationLoggedOut', () {
      test('props are []', () {
        expect(AuthenticationLoggedOut().props, []);
      });
    });
  });
}
