import 'package:flutter_test/flutter_test.dart';
import 'package:state_mgmt/authentication/bloc/authentication_bloc.dart';

void main() {
  group('Authentication Events', () {
    group('AuthenticationStarted', () {
      test('props are []', () {
        expect(AuthenticationStarted().props, []);
      });
    });
    group('AuthenticationLoggedIn', () {
      test('props are []', () {
        expect(AuthenticationLoggedIn().props, []);
      });
    });
    group('AuthenticationLoggedOut', () {
      test('props are []', () {
        expect(AuthenticationLoggedOut().props, []);
      });
    });
  });
}
